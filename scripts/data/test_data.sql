--liquibase formatted sql

--changeset  igor.kolomiyets:test_data context:test_data
--comment: Adding test data
--student users
insert into users(id, name) values ('auth0|65a2af9da1b0c48bd531a49a', 'Dennis');
insert into users(id, name) values ('auth0|660d9f56376afe8127c947a4', 'DemoDay');
insert into users(id, name) values ('auth0|66112f86a009dbb7b90e3a1a', 'Maximilian Morton');
insert into users(id, name) values ('auth0|66113255658e19fa19fdd5e6', 'Gabriella Woods');
insert into users(id, name) values ('auth0|661132b5a009dbb7b90e3b89', 'Boston Henderson');
insert into users(id, name) values ('auth0|6611332387394172ec48ed84', 'Hannah Belmont');
insert into users(id, name) values ('auth0|6611335c60dbd55b5bbfc40c', 'Chloe Oakley');
insert into users(id, name) values ('auth0|661133b1658e19fa19fdd692', 'Donna Samson');
insert into users(id, name) values ('auth0|661133e251aa90d60be7cd59', 'Norbert Garrard');
insert into users(id, name) values ('auth0|6611367d51aa90d60be7ce9b', 'Gemma Warwick');


--supervisors
insert into users(id, name) values ('auth0|660e9f0660dbd55b5bbd9a16', 'The Supervisor');
insert into users(id, name) values ('auth0|661136c8a009dbb7b90e3d4a', 'Gillian Tailor');
insert into users(id, name) values ('auth0|6611382b9fbd80a7b657b715', 'Mariah Horsfall');
insert into users(id, name) values ('auth0|6611388051aa90d60be7cf8e', 'Tanner Rowbottom');


insert into projects(project_id, project_name, student_id, supervisor_id) values ('b6020bf4-dfad-47e2-ae78-cfcd799ba356', 'CodeCraft', 'auth0|65a2af9da1b0c48bd531a49a', 'auth0|660e9f0660dbd55b5bbd9a16');
insert into projects(project_id, project_name, student_id, supervisor_id) values ('4b198ebb-8fb0-4186-a316-155a14b2bbdb', 'TechTrove', 'auth0|660d9f56376afe8127c947a4', 'auth0|660e9f0660dbd55b5bbd9a16');
insert into projects(project_id, project_name, student_id, supervisor_id) values ('c44c32a6-8baa-4737-8d7f-f64711d90cd2', 'ByteBound', 'auth0|66112f86a009dbb7b90e3a1a', 'auth0|661136c8a009dbb7b90e3d4a');
insert into projects(project_id, project_name, student_id, supervisor_id) values ('ad69fce0-73e7-4ec2-809a-8de196d4dafb', 'NexusNet', 'auth0|661133e251aa90d60be7cd59', 'auth0|661136c8a009dbb7b90e3d4a');
insert into projects(project_id, project_name, student_id, supervisor_id) values ('001912ec-d3f4-4c78-9c25-0bf2f16c7048', 'InnovateX', 'auth0|661132b5a009dbb7b90e3b89', 'auth0|6611382b9fbd80a7b657b715');
insert into projects(project_id, project_name, student_id, supervisor_id) values ('4baa8af5-233c-4fe8-b1d4-e31a080953bd', 'SparkSphere', 'auth0|6611332387394172ec48ed84', 'auth0|6611382b9fbd80a7b657b715');

insert into gantt_items(item_id, project_id, gantt_name, start_date, end_date, description, links, feedback) values ('b6bd7ee3-d3a9-4d2b-a2cf-24da6d0c3cfd', 'b6020bf4-dfad-47e2-ae78-cfcd799ba356', 'Project initilisation', '2024-09-04', '2024-11-05', 'Initialising the codecraft code', '', '');
insert into gantt_items(item_id, project_id, gantt_name, start_date, end_date, description, links, feedback) values ('7ddfec74-c50a-4017-b875-0051a2807366', 'b6020bf4-dfad-47e2-ae78-cfcd799ba356', 'Project design', '2024-11-04', '2024-12-05', 'Designing the codecraft code', '', '');
insert into gantt_items(item_id, project_id, gantt_name, start_date, end_date, description, links, feedback) values ('1d8d19ed-2002-4041-82bc-c4bc31e5be7c', 'b6020bf4-dfad-47e2-ae78-cfcd799ba356', 'Project Complete', '2025-01-01', '2025-04-21', 'Completing the codecraft code', '', '');
insert into gantt_items(item_id, project_id, gantt_name, start_date, end_date, description, links, feedback) values ('b5be4428-012a-4fce-a05d-28e5c67a4127', '4b198ebb-8fb0-4186-a316-155a14b2bbdb', 'Project initilisation', '2024-09-04', '2024-11-05', 'Initialising the TechTrove code', '', '');
insert into gantt_items(item_id, project_id, gantt_name, start_date, end_date, description, links, feedback) values ('37dffa66-b050-43b5-b95f-76180980e3ea', '4b198ebb-8fb0-4186-a316-155a14b2bbdb', 'Project design', '2024-11-04', '2024-12-05', 'Designing the TechTrove code', '', '');
insert into gantt_items(item_id, project_id, gantt_name, start_date, end_date, description, links, feedback) values ('ab527b04-eaba-426d-ae91-5c94c74f504f', '4b198ebb-8fb0-4186-a316-155a14b2bbdb', 'Project Complete', '2025-01-01', '2025-04-21', 'Completing the TechTrove code', '', '');

insert into tickets(ticket_id, student_id, supervisor_id, questionshort, questionLong, answer, is_answered) values ('edecedd6-bfa0-449d-9021-1818479c4124', 'auth0|65a2af9da1b0c48bd531a49a', 'auth0|660e9f0660dbd55b5bbd9a16', 'First Question', 'Is this the first question', '', false)