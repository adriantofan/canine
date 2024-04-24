/*
* This script should be run ONCE per PostgreSQL instance
* to create the group roles that will/can be used in all databases
* for ddl/dml/read_only access
 */

/* Object admins (migration): these roles are allowed to create objects
   in a database. */
CREATE ROLE ddl_grp WITH NOLOGIN;

/*Data admins: these roles are allowed to modify data and associated
  objects with DML statements*/
CREATE ROLE dml_grp WITH NOLOGIN;

/*Read-only: these roles are allowed to select data from specific
  schemas or tables. */
CREATE ROLE read_only_grp WITH NOLOGIN;
