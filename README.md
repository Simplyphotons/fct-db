#  Final Year Project Collaboration Web Application Database
This project prepares two Docker images:
* test database image, which has the test database schema, dictionary data and test data, that would allow to 
run service tests for the service that uses database in question as soon as container is created
* the database update image, which is used to keep the database instances across environments in the correct state

# Creating database

First create the Database owner and database.
For example let's assume the following database parameters:

| Parameter               | Value           |
|-------------------------|-----------------|
| Database Name           | fctdb           |
| Database Owner          | fctdbowner      |
| Database Owner Password | Password1       |

In order to create the owner and the database run the following (postgresql):

```sql
postgres=# create user fctdbowner with encrypted password 'Password1';
CREATE ROLE
postgres=# create database fctdb owner fctdbowner;
CREATE DATABASE
postgres=# grant all privileges on database fctdb to fctdbowner;
GRANT
```

Next, prepare liquibase properties file using the above parameters and run the following (assuming that liquibase is
available through the PATH variable) while in the deploy/database directory
`liquibase update`

## Run database in Docker
docker run --name fct-db -d -p 5432:5432 simplyphotons/fct-db:<tag>

For example:
```json
docker run --restart unless-stopped --name fct-db -d -p 5432:5432 simplyphotons/fct-db:1.0.0.1
```

## Updating database
In UAT database update is carried out by the job or standalone docker container
