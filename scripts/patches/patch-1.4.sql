--liquibase formatted sql

--changeset  dennis.kolomiyets:add_col_colour_to_gantt
--comment:  added colour storage for gantt items
alter table if exists gantt_items
    add column if not exists colour VARCHAR(10) DEFAULT '#2A9D39';