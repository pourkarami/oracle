# Schema, security and jobs

[Oracle DBA Query Library](../README.md)

Use dictionary views for object status, grants and job metadata. Run scoped queries in the target schema or PDB.

## Invalid objects in one schema

[invalid-objects-by-owner.sql](invalid-objects-by-owner.sql) · Read-only diagnostic

Review invalid objects before or after deployments. Use the object type and name to look up compilation errors and dependencies.

Access to `DBA_OBJECTS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@schema-security-jobs/invalid-objects-by-owner.sql
```

## Extract DDL for one object

[object-ddl.sql](object-ddl.sql) · Read-only diagnostic

Fetch the DDL as text for review or comparison. Metadata access depends on the object's owner and the caller's privileges.

Access to `DBMS_METADATA`.

Bind variables

- `:p_object_type` `VARCHAR2(50)` · DBMS_METADATA object type.
- `:p_object` `VARCHAR2(128)` · Object name as stored in the dictionary.
- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.

```sql
VARIABLE p_object_type VARCHAR2(50)
EXEC :p_object_type := 'TABLE'
VARIABLE p_object VARCHAR2(128)
EXEC :p_object := 'EXAMPLE_TABLE'
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@schema-security-jobs/object-ddl.sql
```

## Constraints on one table

[table-constraints.sql](table-constraints.sql) · Read-only diagnostic

List constraint types, columns, enforcement, validation and referenced constraints for a table in the target PDB.

Access to `DBA_CONSTRAINTS`, `DBA_CONS_COLUMNS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.
- `:p_table` `VARCHAR2(128)` · Table name as stored in the dictionary.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_table VARCHAR2(128)
EXEC :p_table := 'EXAMPLE_TABLE'
@schema-security-jobs/table-constraints.sql
```

## Index inventory for one table

[table-index-inventory.sql](table-index-inventory.sql) · Read-only diagnostic

See ordered index columns, uniqueness, visibility and index type. Partitioned indexes can require a separate partition-status check.

Access to `DBA_INDEXES`, `DBA_IND_COLUMNS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.
- `:p_table` `VARCHAR2(128)` · Table name as stored in the dictionary.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_table VARCHAR2(128)
EXEC :p_table := 'EXAMPLE_TABLE'
@schema-security-jobs/table-index-inventory.sql
```

## Foreign keys without a matching index prefix

[foreign-key-index-review.sql](foreign-key-index-review.sql) · Read-only diagnostic

Find enabled foreign keys with no visible, ordinary B-tree index whose leading columns contain the same set of columns. Treat the output as a review list and check index or partition usability separately.

Access to `DBA_CONSTRAINTS`, `DBA_CONS_COLUMNS`, `DBA_INDEXES`, `DBA_IND_COLUMNS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@schema-security-jobs/foreign-key-index-review.sql
```

## Account status and expiry by user

[account-status-and-expiry.sql](account-status-and-expiry.sql) · Read-only diagnostic

Check lock and password expiry metadata in the target PDB. Use the account's profile to interpret expiry and grace periods.

Access to `DBA_USERS`.

Bind variables

- `:p_user` `VARCHAR2(128)` · Username or NULL for a bounded recent inventory.

```sql
VARIABLE p_user VARCHAR2(128)
EXEC :p_user := NULL
@schema-security-jobs/account-status-and-expiry.sql
```

## Direct grants for one database role

[direct-role-grants.sql](direct-role-grants.sql) · Read-only diagnostic

List direct recipients and the admin option for a role. Nested role membership requires a transitive-grant review.

Access to `DBA_ROLE_PRIVS`.

Bind variables

- `:p_role` `VARCHAR2(128)` · Role name as stored in the dictionary.

```sql
VARIABLE p_role VARCHAR2(128)
EXEC :p_role := 'DBA'
@schema-security-jobs/direct-role-grants.sql
```

## Currently running Scheduler jobs

[running-scheduler-jobs.sql](running-scheduler-jobs.sql) · Read-only diagnostic

Identify running jobs by owner, instance and session. Follow the job's run-history entry for a terminal status after completion.

Access to `DBA_SCHEDULER_RUNNING_JOBS`.

## Recent Scheduler job runs

[scheduler-job-run-history.sql](scheduler-job-run-history.sql) · Read-only diagnostic

Review recent logged runs, failures and error numbers for the selected owner. Logging settings determine which runs are available.

Access to `DBA_SCHEDULER_JOB_RUN_DETAILS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.
- `:p_days` `NUMBER` · Positive lookback in days.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_days NUMBER
EXEC :p_days := 7
@schema-security-jobs/scheduler-job-run-history.sql
```

## Data Pump job inventory

[data-pump-jobs.sql](data-pump-jobs.sql) · Read-only diagnostic

See job mode, operation, state and attached sessions in the current container. A retained master table can appear without active workers.

Access to `DBA_DATAPUMP_JOBS`.

## Database, instance and container context

[database-session-context.sql](database-session-context.sql) · Read-only diagnostic

Confirm the scope of a report before sampling dynamic views or applying schema filters.

Access to `SYS_CONTEXT`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [DBMS_METADATA reference](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_METADATA.html)
- [Database Administrator’s Guide](https://docs.oracle.com/en/database/oracle/oracle-database/19/admin/index.html)
