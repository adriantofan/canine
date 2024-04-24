#!/bin/sh
set -x
set -e

psql --echo-queries -v ON_ERROR_STOP=1 <<-EOSQL
  CREATE USER "prod" WITH PASSWORD 'prod';
  CREATE USER "migrate" WITH PASSWORD 'migrate';
  GRANT dml_grp TO "prod";
  GRANT ddl_grp TO "migrate";
EOSQL
