alter table if exists users
add column if not exists is_supervisor BOOLEAN DEFAULT false;