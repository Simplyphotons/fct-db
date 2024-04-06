--liquibase formatted sql

--changeset  dennis.kolomiyets:removing_datecreated_column
--comment:  remove date created column from project table

alter TABLE if exists projects
drop column if exists created_at;

alter table if exists projects
drop constraint fk_projects_student, drop constraint fk_projects_supervisor;

alter table if exists tickets
    drop constraint fk_tickets_student, drop constraint fk_tickets_supervisor;

alter table if exists gantt_items
    drop constraint fk_gantt_items_projectTable;

alter table if exists users
rename column username to id;


ALTER TABLE if exists projects ALTER COLUMN project_id TYPE varchar (128);
ALTER TABLE if exists gantt_items ALTER COLUMN item_id TYPE varchar (128);
ALTER TABLE if exists gantt_items ALTER COLUMN project_id TYPE varchar (128);
ALTER TABLE if exists tickets ALTER COLUMN ticket_id TYPE varchar (128);

alter table if exists gantt_items
    add column if not exists gantt_name varchar(128);


alter table if exists users
add column if not exists name varchar(128),
drop column if exists is_supervisor;

ALTER TABLE gantt_items
    ADD CONSTRAINT fk_gantt_items_projectTable
        FOREIGN KEY (project_id) REFERENCES projects(project_id);

ALTER TABLE projects
    ADD CONSTRAINT fk_projects_student
        FOREIGN KEY (student_id) REFERENCES users(id);

ALTER TABLE projects
    ADD CONSTRAINT fk_projects_supervisor
        FOREIGN KEY (supervisor_id) REFERENCES users(id);

ALTER TABLE tickets
    ADD CONSTRAINT fk_tickets_student
        FOREIGN KEY (student_id) REFERENCES users(id);

ALTER TABLE tickets
    ADD CONSTRAINT fk_tickets_supervisor
        FOREIGN KEY (supervisor_id) REFERENCES users(id);



--rollback alter TABLE if exists projects add column if not exists created_at timestamp;