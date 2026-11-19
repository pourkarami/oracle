# Oracle DBA Query Library

[نسخهٔ فارسی](https://github.com/pourkarami/oracle/tree/oracle/query-library-fa/ORACLE)

This library organizes 70 Oracle Database scripts by troubleshooting task. Each category documents when to run a query, the required database objects, and its bind variables. The SQL is shared by both language branches.

## Find a query

| Topic | Scripts | When to use |
| --- | ---: | --- |
| [Sessions and locks](sessions-locks/README.md) | 7 | Start with the current session, then match its instance, SID and serial number before interpreting blockers or process IDs. |
| [Waits and performance](waits-performance/README.md) | 8 | Take two samples from the same instance and workload interval when comparing cumulative metrics. |
| [SQL, plans and statistics](sql-plans/README.md) | 7 | Match the SQL ID and child cursor first. Compare lifetime totals and per-execution averages separately. |
| [Storage and space](storage-space/README.md) | 6 | Distinguish allocated bytes, current free space, and the growth limit. Read per-PDB dictionary views in the intended container. |
| [Undo and transactions](undo-transactions/README.md) | 4 | Use undo blocks and records to identify consumers. Look at recent undo intervals before changing retention or space. |
| [Redo, backup and recovery](redo-backup-recovery/README.md) | 8 | Check archive volume, FRA usage and RMAN status independently. A successful backup job does not establish recoverability. |
| [RAC, Data Guard and ASM](rac-data-guard-asm/README.md) | 6 | Confirm the database role and instance before interpreting lag, archive gaps or disk-group capacity. |
| [Memory and resources](memory-resources/README.md) | 5 | Separate current usage, high-water marks, and estimates. Confirm whether each measurement is per session or per instance. |
| [Schema, security and jobs](schema-security-jobs/README.md) | 11 | Use dictionary views for object status, grants and job metadata. Run scoped queries in the target schema or PDB. |
| [ASH, AWR and SQL Monitoring](licensed-diagnostics/README.md) | 8 | Confirm entitlement for the deployed edition and service before accessing pack-specific views and packages. |
| [Operations reference](operations-reference/README.md) | — | Use the notes to locate the applicable runbook and identify settings or actions that require change approval. |
| [Source catalog](source-catalog/README.md) | — | Use the source links to find legacy variants, private runbooks, third-party tools and Microsoft SQL Server references. |

## Execution scope

The reference baseline is Oracle Database 19c. Check view columns, licensing and features against the target release, edition and container. The SQL was reviewed statically. Verify results and permissions in a test database before relying on a script operationally.

Use a monitoring account with access to the listed views and packages. Confirm your instance and PDB, and run from `ORACLE/` in SQL*Plus, SQLcl, or script mode in SQL Developer. Here is a bind setup for the recent cached SQL report.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 30
@sql-plans/top-cached-sql-by-cpu.sql
```

For bind parameters, replace example values with the exact IDs and names from your own diagnostic session. For CLOB reports in SQL*Plus, use `SET LONG 1000000` and `SET LONGCHUNKSIZE 32767`.

ASH and AWR require Oracle Diagnostics Pack as applicable to your edition and service. Real-Time SQL Monitoring requires Oracle Tuning Pack and its Diagnostics Pack prerequisite where those packs are separately licensed. The manual AWR snapshot writes to the AWR repository. The other scripts are diagnostic reads. [Oracle licensing information](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)

Use the separate OneNote source index to find the legacy scripts and private notes behind these workflows.
