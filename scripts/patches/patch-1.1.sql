--liquibase formatted sql

--changeset  dennis.kolomiyets:add_col_users
--comment:  added bool to users


alter table if exists users
add column if not exists is_supervisor BOOLEAN DEFAULT false;