# Waits and performance

[Oracle DBA Query Library](../README.md)

Take two samples from the same instance and workload interval when comparing cumulative metrics.

## Wait totals for one session

[session-wait-totals.sql](session-wait-totals.sql) · Read-only diagnostic

See cumulative non-idle waits for a verified live session on the local instance. A delta between two captures isolates a time window.

Access to `V$SESSION_EVENT`, `V$SESSION`.

Bind variables

- `:p_sid` `NUMBER` · SID from the target instance.
- `:p_serial` `NUMBER` · SERIAL# paired with the SID.

```sql
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
@waits-performance/session-wait-totals.sql
```

## Instance-wide wait totals

[instance-wait-totals.sql](instance-wait-totals.sql) · Read-only diagnostic

Identify large cumulative foreground wait events. Repeat at two times on the same instance and compare foreground deltas.

Access to `V$SYSTEM_EVENT`.

## Instance activity counters

[instance-activity-counters.sql](instance-activity-counters.sql) · Read-only diagnostic

Capture commits, rollbacks, reads, executions and redo bytes. Calculate rates using the difference divided by elapsed seconds across samples from the same startup.

Access to `V$SYSSTAT`, `V$INSTANCE`.

## Wait totals by class

[wait-class-totals.sql](wait-class-totals.sql) · Read-only diagnostic

Compare the cumulative foreground time by wait class to choose the next diagnostic area. Use the time model for CPU.

Access to `V$SYSTEM_EVENT`.

## Database time and CPU totals

[instance-time-model.sql](instance-time-model.sql) · Read-only diagnostic

Compare deltas for DB time and DB CPU. Because multiple sessions can accumulate time concurrently, DB time is distinct from wall-clock time.

Access to `V$SYS_TIME_MODEL`.

## Physical I/O counts by datafile

[datafile-io-counters.sql](datafile-io-counters.sql) · Read-only diagnostic

Rank files by cumulative physical reads and writes. Use deltas from a consistent instance and container to compare a problem interval.

Access to `V$FILESTAT`, `V$DATAFILE`.

## Segment activity by statistic

[segment-activity-counters.sql](segment-activity-counters.sql) · Read-only diagnostic

Find active segments for a chosen owner and statistic. Take deltas to detect recent activity and preserve the partition name when comparing captures.

Access to `V$SEGMENT_STATISTICS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.
- `:p_statistic` `VARCHAR2(64)` · Exact statistic name.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_statistic VARCHAR2(64)
EXEC :p_statistic := 'logical reads'
@waits-performance/segment-activity-counters.sql
```

## Latch misses and sleeps

[latch-contention-summary.sql](latch-contention-summary.sql) · Read-only diagnostic

Find latches worth investigating by comparing gets, misses and sleeps over an interval. Counters reflect the local instance.

Access to `V$LATCH`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [Instance tuning using performance views](https://docs.oracle.com/en/database/oracle/oracle-database/19/tgdba/instance-tuning-using-performance-views.html)
