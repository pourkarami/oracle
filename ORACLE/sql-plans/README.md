# SQL, plans and statistics

[Oracle DBA Query Library](../README.md)

Match the SQL ID and child cursor first. Compare lifetime totals and per-execution averages separately.

## Cached children for a SQL ID

[cached-cursors-by-sql-id.sql](cached-cursors-by-sql-id.sql) · Read-only diagnostic

Check plan hash, executions and resource use for every cached child on the local instance. Rows can age out of the shared pool.

Access to `V$SQL`.

Bind variables

- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@sql-plans/cached-cursors-by-sql-id.sql
```

## Top cached SQL by accumulated CPU

[top-cached-sql-by-cpu.sql](top-cached-sql-by-cpu.sql) · Read-only diagnostic

Find CPU-heavy cached SQL IDs with recent activity. CPU totals cover each cursor's lifetime and can precede the activity filter.

Access to `V$SQLSTATS`.

Bind variables

- `:p_minutes` `NUMBER` · Positive recent time window in minutes.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@sql-plans/top-cached-sql-by-cpu.sql
```

## Top cached SQL by accumulated elapsed time

[top-cached-sql-by-elapsed.sql](top-cached-sql-by-elapsed.sql) · Read-only diagnostic

Find recently active cached SQL with high elapsed totals. Compare executions and per-execution averages, then switch to snapshot deltas for interval attribution.

Access to `V$SQLSTATS`.

Bind variables

- `:p_minutes` `NUMBER` · Positive recent time window in minutes.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@sql-plans/top-cached-sql-by-elapsed.sql
```

## Plan of a cached child cursor

[cached-execution-plan.sql](cached-execution-plan.sql) · Read-only diagnostic

Display the plan actually associated with the cursor. Use the same instance and container and check plan notes, row estimates and predicate details.

Access to `DBMS_XPLAN`, `V$SQL`, `V$SQL_PLAN`, `V$SQL_PLAN_STATISTICS_ALL`, `V$SESSION`.

Bind variables

- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.
- `:p_child` `NUMBER` · Child number for the cached SQL ID.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
VARIABLE p_child NUMBER
EXEC :p_child := 0
@sql-plans/cached-execution-plan.sql
```

## Captured bind metadata by SQL ID

[cached-bind-metadata.sql](cached-bind-metadata.sql) · Read-only diagnostic

Review bind positions, types and capture timestamps. Capture is sampled and does not occur for every type or execution.

Access to `V$SQL_BIND_CAPTURE`.

Bind variables

- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@sql-plans/cached-bind-metadata.sql
```

## SQL plan baseline status

[sql-plan-baselines.sql](sql-plan-baselines.sql) · Read-only diagnostic

See enabled, accepted and fixed baselines. Use the SQL handle when known and verify SPM availability for the edition and release.

Access to `DBA_SQL_PLAN_BASELINES`.

Bind variables

- `:p_handle` `VARCHAR2(128)` · SQL handle, or NULL to list recent baselines.

```sql
VARIABLE p_handle VARCHAR2(128)
EXEC :p_handle := NULL
@sql-plans/sql-plan-baselines.sql
```

## Optimizer statistics operations

[optimizer-statistics-operations.sql](optimizer-statistics-operations.sql) · Read-only diagnostic

Review recent statistics operations and their status when planning changes or investigating a new plan.

Access to `DBA_OPTSTAT_OPERATIONS`.

Bind variables

- `:p_days` `NUMBER` · Positive lookback in days.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
@sql-plans/optimizer-statistics-operations.sql
```

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [DBMS_XPLAN reference](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_XPLAN.html)
- [Oracle licensing information](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)
