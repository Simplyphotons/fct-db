--liquibase formatted sql

--changeset  igor.kolomiyets:test_data context:test_data
--comment: Adding test data
INSERT INTO TEST (ID, NAME) VALUES (2, 'Test');

ALTER SEQUENCE TEST_ID_SEQ
    MINVALUE 3
    START WITH 3
    RESTART WITH 3;

--rollback DELETE FROM TEST WHERE ID = 2;
