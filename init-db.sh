#!/bin/bash
/usr/local/bin/docker-entrypoint.sh $1 &
sleep 10

psql -v ON_ERROR_STOP=1 --username "$1" <<-EOSQL
CREATE USER fctdbowner with encrypted password 'Password1';
alter user fctdbowner CREATEDB;
alter user fctdbowner CREATEROLE;
alter user fctdbowner LOGIN;
alter user fctdbowner INHERIT;
CREATE DATABASE fctdb owner=fctdbowner;
EOSQL
