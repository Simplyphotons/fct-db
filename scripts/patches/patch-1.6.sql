--liquibase formatted sql

--changeset  dennis.kolomiyets:add_col_second_reader
--comment:  added second reader
alter table if exists projects
    add column if not exists second_reader_id VARCHAR(30) DEFAULT '';