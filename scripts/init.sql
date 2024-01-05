--liquibase formatted sql

--changeset  igor.kolomiyets:create_schema
--comment: Creating initial schema
-- Creating the 'users' table
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR PRIMARY KEY,
    is_supervisor BOOLEAN
);

-- Creating the 'projects' table
CREATE TABLE IF NOT EXISTS projects (
    project_id INTEGER PRIMARY KEY,
    project_name VARCHAR,
    student_id VARCHAR,
    supervisor_id VARCHAR,
    created_at TIMESTAMP
);

-- Creating the 'ganttItem' table
CREATE TABLE IF NOT EXISTS gantt_items (
    item_id INTEGER PRIMARY KEY,
    project_id INTEGER,
    start_date DATE,
    end_date DATE,
    description VARCHAR,
    links VARCHAR,
    feedback VARCHAR
);

-- Creating the 'ticket' table
CREATE TABLE IF NOT EXISTS tickets (
    ticket_id INTEGER PRIMARY KEY,
    student_id VARCHAR,
    supervisor_id VARCHAR,
    questionShort VARCHAR,
    questionLong VARCHAR,
    answer VARCHAR,
    is_answered BOOLEAN
);

-- Creating the foreign key relationships
ALTER TABLE gantt_items
ADD CONSTRAINT fk_gantt_items_projectTable
FOREIGN KEY (project_id) REFERENCES projects(project_id);

ALTER TABLE projects
ADD CONSTRAINT fk_projects_student
FOREIGN KEY (student_id) REFERENCES users(username);

ALTER TABLE projects
ADD CONSTRAINT fk_projects_supervisor
FOREIGN KEY (supervisor_id) REFERENCES users(username);

ALTER TABLE tickets
ADD CONSTRAINT fk_tickets_student
FOREIGN KEY (student_id) REFERENCES users(username);

ALTER TABLE tickets
ADD CONSTRAINT fk_tickets_supervisor
FOREIGN KEY (supervisor_id) REFERENCES users(username);

--rollback DROP TABLE IF EXISTS tickets;
--rollback DROP TABLE IF EXISTS gantt_items;
--rollback DROP TABLE IF EXISTS projects;
--rollback DROP TABLE IF EXISTS users;
