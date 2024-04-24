#!/bin/sh
set +x
set -e
psql --echo-queries -v ON_ERROR_STOP=1 <<-EOSQL
  GRANT dml_grp TO "canine-gke-app-p-sa@prj-p-k9canine-base-f4s4.iam", "postgres";
  GRANT ddl_grp TO "canine-sql-migrate-p-sa@prj-p-k9canine-base-f4s4.iam", "postgres";
EOSQL