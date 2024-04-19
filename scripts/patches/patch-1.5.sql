--liquibase formatted sql

--changeset  dennis.kolomiyets:add_col_colour_to_gantt
--comment:  added colour storage for gantt items
alter table if exists gantt_items
    add column if not exists feedback_update_tracker int DEFAULT 0;