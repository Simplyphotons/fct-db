--liquibase formatted sql

--changeset  dennis.kolomiyets:user_test_data context:test_data
--comment: Adding test data for user bools

UPDATE users SET is_supervisor = 'true' where id = 'auth0|660e9f0660dbd55b5bbd9a16';
UPDATE users SET is_supervisor = 'true' where id = 'auth0|661136c8a009dbb7b90e3d4a';
UPDATE users SET is_supervisor = 'true' where id = 'auth0|6611382b9fbd80a7b657b715';
UPDATE users SET is_supervisor = 'true' where id = 'auth0|6611388051aa90d60be7cf8e';