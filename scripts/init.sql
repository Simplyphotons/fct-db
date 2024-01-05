--liquibase formatted sql

--changeset  igor.kolomiyets:create_schema
--comment: Creating initial schema
-- Creating the 'users' table
CREATE TABLE users (
    username VARCHAR PRIMARY KEY,
    is_supervisor BOOLEAN
);

-- Creating the 'projectTable' table
CREATE TABLE projectTable (
    project_id INTEGER PRIMARY KEY,
    project_name VARCHAR,
    student_id INTEGER REFERENCES users(username),
    supervisor_id INTEGER REFERENCES users(username),
    created_at TIMESTAMP
);

-- Creating the 'ganttItem' table
CREATE TABLE ganttItem (
    item_id INTEGER PRIMARY KEY,
    project_id INTEGER REFERENCES projectTable(project_id),
    start_date DATE,
    end_date DATE,
    description VARCHAR,
    links VARCHAR[],
    feedback VARCHAR[]
);

-- Creating the 'ticket' table
CREATE TABLE ticket (
    ticket_id INTEGER PRIMARY KEY,
    student_id INTEGER REFERENCES users(username),
    supervisor_id INTEGER REFERENCES users(username),
    questionShort VARCHAR,
    questionLong VARCHAR,
    answer VARCHAR,
    is_answered BOOLEAN
);

-- Creating the foreign key relationships
ALTER TABLE ganttItem
ADD CONSTRAINT fk_ganttItem_projectTable
FOREIGN KEY (project_id) REFERENCES projectTable(project_id);

ALTER TABLE projectTable
ADD CONSTRAINT fk_projectTable_student
FOREIGN KEY (student_id) REFERENCES users(username);

ALTER TABLE projectTable
ADD CONSTRAINT fk_projectTable_supervisor
FOREIGN KEY (supervisor_id) REFERENCES users(username);

ALTER TABLE ticket
ADD CONSTRAINT fk_ticket_student
FOREIGN KEY (student_id) REFERENCES users(username);

ALTER TABLE ticket
ADD CONSTRAINT fk_ticket_supervisor
FOREIGN KEY (supervisor_id) REFERENCES users(username);

--rollback DROP SEQUENCE IF EXISTS TEST_ID_SEQ;
--rollback DROP TABLE IF EXISTS TEST;
