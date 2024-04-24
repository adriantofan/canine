#!/usr/bin/env sh
set -e
env | grep PG
psql --echo-queries -v ON_ERROR_STOP=1 <<-EOSQL
  -- golang-migrate needs ddl_grp to create the schema_migrations table
  -- this is also done in it
  SET ROLE ddl_grp;

  CREATE TABLE IF NOT EXISTS public.schema_migrations (version bigint not null primary key, dirty boolean not null);
  RESET ROLE;
EOSQL