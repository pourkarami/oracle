# Undo and transactions

[Oracle DBA Query Library](../README.md)

Use undo blocks and records to identify consumers. Look at recent undo intervals before changing retention or space.

## Active transactions ranked by undo

[active-transactions.sql](active-transactions.sql) · Read-only diagnostic

Find the biggest current undo consumers across instances. Inspect the related session before taking any action.

Access to `GV$TRANSACTION`, `GV$SESSION`.

## Recent undo interval statistics

[undo-interval-statistics.sql](undo-interval-statistics.sql) · Read-only diagnostic

Review undo demand, tuned retention and counts of snapshot-too-old or out-of-space errors. Retention is reported in seconds.

Access to `V$UNDOSTAT`.

Bind variables

- `:p_hours` `NUMBER` · Positive lookback in hours.

```sql
VARIABLE p_hours NUMBER
EXEC :p_hours := 24
@undo-transactions/undo-interval-statistics.sql
```

## Fast-start rollback progress

[fast-start-rollback-progress.sql](fast-start-rollback-progress.sql) · Read-only diagnostic

Monitor transactions tracked by fast-start recovery. Rollback completion percentage is approximate and covers the undo work reported by Oracle.

Access to `V$FAST_START_TRANSACTIONS`.

## Undo segment activity

[rollback-segment-statistics.sql](rollback-segment-statistics.sql) · Read-only diagnostic

Inspect current transaction count and size together with cumulative waits and writes per undo segment.

Access to `V$ROLLSTAT`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [Database Administrator’s Guide](https://docs.oracle.com/en/database/oracle/oracle-database/19/admin/index.html)
