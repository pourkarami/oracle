# Memory and resources

[Oracle DBA Query Library](../README.md)

Separate current usage, high-water marks, and estimates. Confirm whether each measurement is per session or per instance.

## PGA summary by instance

[pga-memory-summary.sql](pga-memory-summary.sql) · Read-only diagnostic

Compare current PGA allocation, peak allocation, the configured target and over-allocation count. Consult the unit column before comparing values.

Access to `GV$PGASTAT`.

## Active SQL workareas

[active-pga-workareas.sql](active-pga-workareas.sql) · Read-only diagnostic

Find operations using PGA and spilling to TEMP. Increasing `number_passes` indicates extra passes over the data for the observed workarea.

Access to `V$SQL_WORKAREA_ACTIVE`.

## Resource limits and high-water marks

[resource-limits.sql](resource-limits.sql) · Read-only diagnostic

Compare current and peak utilization for sessions, processes and transactions across instances. Limit values can be textual, including `UNLIMITED`.

Access to `GV$RESOURCE_LIMIT`.

## Dynamic SGA component sizes

[sga-components.sql](sga-components.sql) · Read-only diagnostic

Compare current, minimum and maximum observed component sizes. Resize operations and their last timestamp can help explain changing allocation.

Access to `V$SGA_DYNAMIC_COMPONENTS`.

## Sessions ranked by current PGA

[largest-session-pga.sql](largest-session-pga.sql) · Read-only diagnostic

Compare current and peak session PGA on this instance. Session statistics and instance PGA metrics have different scopes.

Access to `V$SESSTAT`, `V$STATNAME`, `V$SESSION`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
