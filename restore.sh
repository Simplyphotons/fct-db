#!/bin/bash

/usr/local/bin/docker-entrypoint.sh postgres &
sleep 10

/usr/lib/postgresql/16/bin/psql -f /backup.sql -U postgres
/usr/lib/postgresql/16/bin/pg_ctl stop