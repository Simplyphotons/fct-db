FROM postgres:16.1 AS deploy

ARG LIQUIBASE_VERSION=4.3.1
ARG POSTGRES_VERSION=42.2.19

USER root

RUN apt-get update \
    && apt-get install -y openjdk-17-jre git \
    && mkdir /app \
    && chown postgres /app

ADD https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz /liquibase/liquibase-${LIQUIBASE_VERSION}.tar.gz

RUN cd /liquibase \
    && gzip -dc /liquibase/liquibase-${LIQUIBASE_VERSION}.tar.gz | tar xvf - \
    && rm /liquibase/liquibase-${LIQUIBASE_VERSION}.tar.gz

ADD https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar /app/postgresql.jar
ADD init.sh /app/
ADD scripts /app/scripts
ADD deploy.xml /app/deploy.xml

WORKDIR /app

RUN chmod 755 init.sh

ENTRYPOINT ["./init.sh"]

CMD ["/liquibase/liquibase", "update"]

FROM deploy as build

ENV POSTGRES_PASSWORD Password1

USER root

ADD init-db.sh /app/
RUN chmod 755 /app/init-db.sh
RUN chmod 644 /app/postgresql.jar

USER postgres

ADD liquibase.properties /app/

WORKDIR /app

RUN ls -l && /app/init-db.sh postgres \
    && /liquibase/liquibase --contexts=test_data update \
    && pg_dumpall > /app/backup.sql \
    && pg_ctl stop

FROM postgres:16.1

ENV POSTGRES_PASSWORD Password1

COPY --from=build /app/backup.sql /
ADD restore.sh /
RUN chmod 755 restore.sh

USER postgres

RUN /restore.sh

USER root

RUN rm /restore.sh /backup.sql

USER postgres
