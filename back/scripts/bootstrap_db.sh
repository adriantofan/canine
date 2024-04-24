#!/usr/bin/env sh

# put in to $database all arguments received from the commandline and concatenate them into a
# string separated by commas

#set -e # Exit immediately if a command exits with a non-zero status.
set -x
# Initialize the flag as true indicating the first argument has not been processed yet
first_arg=true

environment=$1
database=$2

# Optional: Output the values of environment and database for verification
echo "Environment: $environment"
echo "Databases: $database"

echo "01_roles_once.sql"
psql --echo-queries -v ON_ERROR_STOP=1 -f ./migrations_roles/01_roles_once.sql

echo "Users and grants"
./scripts/bootstrap_users_${environment}.sh

set +e
echo "The following database will be created: $database. It normal to fail if db exists"
psql --echo-queries <<-EOSQL
      CREATE DATABASE $database;
EOSQL
set -e

echo "10_roles_common.sql"
sed "s/DB_NAMES/$database/g" ./migrations_roles/10_roles_common.sql | psql --echo-queries -v ON_ERROR_STOP=1



export PGDATABASE=$database

echo "20_roles_ddl.sql"
psql --echo-queries -v ON_ERROR_STOP=1 -f ./migrations_roles/20_roles_ddl.sql

echo "30_roles_dml_ro.sql"
psql --echo-queries -v ON_ERROR_STOP=1 -f ./migrations_roles/30_roles_dml_ro.sql

echo "40_default_other.sql"
psql --echo-queries -v ON_ERROR_STOP=1 -f ./migrations_roles/40_default_other.sql

