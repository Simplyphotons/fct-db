--liquibase formatted sql

--changeset  igor.kolomiyets:seed_data
--comment: Adding seed data
insert into public.test (ID, NAME) values (1, 'Dummy');

--rollback DELETE FROM TEST;
