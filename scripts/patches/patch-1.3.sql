--liquibase formatted sql

--changeset  dennis.kolomiyets:add_col_has_projects_to_users
--comment:  added bool has_projects to users
alter table if exists users
    add column if not exists has_project BOOLEAN DEFAULT false;