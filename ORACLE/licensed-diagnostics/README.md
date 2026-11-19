# ASH, AWR and SQL Monitoring

[Oracle DBA Query Library](../README.md)

Confirm entitlement for the deployed edition and service before accessing pack-specific views and packages.

ASH and AWR require Oracle Diagnostics Pack as applicable to your edition and service. Real-Time SQL Monitoring requires Oracle Tuning Pack and its Diagnostics Pack prerequisite where those packs are separately licensed. The manual AWR snapshot writes to the AWR repository. The other scripts are diagnostic reads. [Oracle licensing information](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)

For AWR history choose the repository DBID and data container. Inspect `CON_ID` and `CON_DBID` when reviewing multiple PDBs. ASH is sampled and AWR SQL statistics describe captured SQL, so use these reports to compare observed workload.

## Recent ASH samples for one session

[ash-samples-for-session.sql](ash-samples-for-session.sql) · Read-only diagnostic · Diagnostics Pack

Use Diagnostics Pack to inspect sampled session activity across RAC. A gap in samples can reflect inactivity or retention.

Access to `GV$ACTIVE_SESSION_HISTORY`.

Bind variables

- `:p_instance` `NUMBER` · Instance number, or the monitor coordinator instance.
- `:p_sid` `NUMBER` · SID from the target instance.
- `:p_serial` `NUMBER` · SERIAL# paired with the SID.
- `:p_minutes` `NUMBER` · Positive recent time window in minutes.

```sql
VARIABLE p_instance NUMBER
EXEC :p_instance := 1
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@licensed-diagnostics/ash-samples-for-session.sql
```

## ASH activity by SQL and wait state

[ash-activity-by-sql-and-wait.sql](ash-activity-by-sql-and-wait.sql) · Read-only diagnostic · Diagnostics Pack

Count sampled active-user rows over a recent interval. Samples show relative activity across groups and are distinct from execution counts.

Access to `GV$ACTIVE_SESSION_HISTORY`.

Bind variables

- `:p_minutes` `NUMBER` · Positive recent time window in minutes.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@licensed-diagnostics/ash-activity-by-sql-and-wait.sql
```

## AWR SQL statistics by snapshot

[awr-sql-execution-deltas.sql](awr-sql-execution-deltas.sql) · Read-only diagnostic · Diagnostics Pack

Use Diagnostics Pack to compare captured executions and resource deltas by snapshot, instance and plan. Identify DBID and container before comparing snapshots.

Access to `DBA_HIST_SQLSTAT`, `DBA_HIST_SNAPSHOT`.

Bind variables

- `:p_dbid` `NUMBER` · Repository DBID from the intended AWR snapshots.
- `:p_con_dbid` `NUMBER` · Target container DBID. NULL removes the container filter, so inspect the returned container columns.
- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.
- `:p_days` `NUMBER` · Positive lookback in days.

```sql
VARIABLE p_dbid NUMBER
EXEC :p_dbid := 1000000001
VARIABLE p_con_dbid NUMBER
EXEC :p_con_dbid := 1000000001
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
VARIABLE p_days NUMBER
EXEC :p_days := 7
@licensed-diagnostics/awr-sql-execution-deltas.sql
```

## Plans captured in AWR for a SQL ID

[awr-captured-sql-plans.sql](awr-captured-sql-plans.sql) · Read-only diagnostic · Diagnostics Pack

Use this to list plan hashes for a captured SQL ID and container. Use snapshot SQL statistics to identify when those plans ran.

Access to `DBA_HIST_SQL_PLAN`.

Bind variables

- `:p_dbid` `NUMBER` · Repository DBID from the intended AWR snapshots.
- `:p_con_dbid` `NUMBER` · Target container DBID. NULL removes the container filter, so inspect the returned container columns.
- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.

```sql
VARIABLE p_dbid NUMBER
EXEC :p_dbid := 1000000001
VARIABLE p_con_dbid NUMBER
EXEC :p_con_dbid := 1000000001
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@licensed-diagnostics/awr-captured-sql-plans.sql
```

## AWR tablespace growth in blocks

[awr-tablespace-growth.sql](awr-tablespace-growth.sql) · Read-only diagnostic · Diagnostics Pack

Compare AWR snapshots for one tablespace within one container. The output keeps the original unit in blocks so mixed tablespace block sizes stay interpretable.

Access to `DBA_HIST_TBSPC_SPACE_USAGE`, `DBA_HIST_SNAPSHOT`.

Bind variables

- `:p_dbid` `NUMBER` · Repository DBID from the intended AWR snapshots.
- `:p_con_dbid` `NUMBER` · Target container DBID. NULL removes the container filter, so inspect the returned container columns.
- `:p_ts_id` `NUMBER` · Tablespace number within the selected container.
- `:p_days` `NUMBER` · Positive lookback in days.

```sql
VARIABLE p_dbid NUMBER
EXEC :p_dbid := 1000000001
VARIABLE p_con_dbid NUMBER
EXEC :p_con_dbid := 1000000001
VARIABLE p_ts_id NUMBER
EXEC :p_ts_id := 7
VARIABLE p_days NUMBER
EXEC :p_days := 7
@licensed-diagnostics/awr-tablespace-growth.sql
```

## Executions visible to Real-Time SQL Monitoring

[sql-monitor-executions.sql](sql-monitor-executions.sql) · Read-only diagnostic · Tuning Pack + Diagnostics Pack

Use Tuning Pack with its Diagnostics Pack prerequisite. Capture the coordinator's instance, SQL ID, execution ID and execution start to open the matching report.

Access to `GV$SQL_MONITOR`.

Bind variables

- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@licensed-diagnostics/sql-monitor-executions.sql
```

## Text report for a monitored SQL execution

[sql-monitor-text-report.sql](sql-monitor-text-report.sql) · Read-only diagnostic · Tuning Pack + Diagnostics Pack

Open the report for the exact execution identified by the inventory query. Some reports include SQL text or operational identifiers. Review output before sharing.

Access to `DBMS_SQLTUNE`, `GV$SQL_MONITOR`.

Bind variables

- `:p_instance` `NUMBER` · Instance number, or the monitor coordinator instance.
- `:p_sql_id` `VARCHAR2(13)` · SQL ID from your own session or cache.
- `:p_exec_id` `NUMBER` · SQL_EXEC_ID from the monitor inventory.
- `:p_exec_start` `VARCHAR2(19)` · REPORT_START_VALUE from the matching monitor row.

```sql
VARIABLE p_instance NUMBER
EXEC :p_instance := 1
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
VARIABLE p_exec_id NUMBER
EXEC :p_exec_id := 16777216
VARIABLE p_exec_start VARCHAR2(19)
EXEC :p_exec_start := '2026-01-15 09:30:00'
@licensed-diagnostics/sql-monitor-text-report.sql
```

## Create one manual AWR snapshot

[create-awr-snapshot.sql](create-awr-snapshot.sql) · AWR repository write · Diagnostics Pack

An authorized administrator can capture a before/after boundary in the intended AWR repository. Running this block writes to that repository and returns the snapshot ID.

Access to `DBMS_WORKLOAD_REPOSITORY`, `DBMS_OUTPUT`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [Oracle licensing information](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)
- [DBMS_SQLTUNE reference](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_SQLTUNE.html)
- [DBMS_WORKLOAD_REPOSITORY reference](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_WORKLOAD_REPOSITORY.html)
