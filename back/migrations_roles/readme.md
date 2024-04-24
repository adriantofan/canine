
See https://www.red-gate.com/simple-talk/databases/postgresql/postgresql-basics-a-template-for-managing-database-privileges/
for more details.

Take the following in to consideration:

In PostgreSQL, privileges are applied at various levels within the system architecture, ranging from the cluster level to the specific elements within a database. Understanding where these privileges are applied is crucial for effective database security and access control management.

### Cluster Level Privileges
These privileges are applied across the entire PostgreSQL instance, affecting all databases within the PostgreSQL cluster.

- **Role Privileges**:
    - **LOGIN**: Allows roles to log in; without it, a role cannot connect to any databases.
    - **SUPERUSER**: Grants all privileges automatically to the role; a superuser can bypass all permission checks except for login restrictions.
    - **CREATEDB**: Allows roles to create new databases, which inherently allows them to create new top-level namespaces (schemas).
    - **CREATEROLE**: Permits roles to create, alter, and drop other roles.
    - **REPLICATION**: Allows roles to initiate streaming replication and backup.

### Database Level Privileges
These privileges are specific to individual databases within the cluster.

- **Database-specific Privileges**:
    - **CONNECT**: Allows a role to connect to a specific database.
    - **CREATE**: In the context of a database, allows the role to create new schemas within the database.
    - **TEMPORARY** (or **TEMP**): Permits the creation of temporary tables within the database. These tables are automatically dropped at the end of the session.

### Schema Level Privileges
Privileges that affect how roles interact with specific schemas within a database.

- **Schema Privileges**:
    - **CREATE**: Allows roles to create new objects within the schema, such as tables, types, or functions.
    - **USAGE**: Permits roles to access objects within the schema and to use objects the schema contains if they have sufficient privileges on those objects.

### Table Level Privileges
Privileges applied to tables and sometimes more granularly to columns within those tables.

- **Table and Column Privileges**:
    - **SELECT**, **INSERT**, **UPDATE**, **DELETE**, **TRUNCATE**, **REFERENCES**, **TRIGGER**.

### Other Objects
Privileges can also be set on sequences, functions, procedures, languages, and foreign data wrappers and servers.

- **Sequence Privileges**: **USAGE**, **SELECT**, **UPDATE**.
- **Function/Procedure Privileges**: **EXECUTE**.
- **Language Privileges**: **USAGE**.
- **Foreign Data Wrapper and Server Privileges**: **USAGE**.

### Applying and Checking Privileges
Privileges are generally granted using the `GRANT` command and can be revoked with the `REVOKE` command. To check privileges, you can query system catalogs or use views like `information_schema.role_table_grants`, `pg_roles`, and other specific catalog views that PostgreSQL provides.

By understanding and appropriately applying these different levels of privileges, database administrators can effectively manage access controls, ensuring that users and roles have the appropriate level of access required for their functions without compromising the security or integrity of the data held within the PostgreSQL cluster.