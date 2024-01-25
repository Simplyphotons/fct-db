--liquibase formatted sql

--changeset  dennis.kolomiyets:update_schema
--comment:  update schema: adding new table to facilitate project requests
-- Creating the 'applications' table
CREATE TABLE IF NOT EXISTS  applications(
        id              VARCHAR PRIMARY KEY,
        student_id      VARCHAR,
        supervisor_id   VARCHAR,
        heading         VARCHAR,
        description     VARCHAR,
        accepted        BOOL,
        declined        BOOL
);

ALTER TABLE applications
    ADD CONSTRAINT fk_tickets_student
        FOREIGN KEY (student_id) REFERENCES users(username);

ALTER TABLE applications
    ADD CONSTRAINT fk_tickets_supervisor
        FOREIGN KEY (supervisor_id) REFERENCES users(username);


--rollback DROP TABLE IF EXISTS appliations;