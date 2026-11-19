# Sessions and locks

[Oracle DBA Query Library](../README.md)

Start with the current session, then match its instance, SID and serial number before interpreting blockers or process IDs.

## Active user sessions

[active-user-sessions.sql](active-user-sessions.sql) · Read-only diagnostic

Use this first when users report slowness. A row with `state = 'WAITING'` is currently waiting, while a non-waiting row can be on CPU or runnable.

Access to `V$SESSION`.

## Current blocking sessions across instances

[blocking-sessions-rac.sql](blocking-sessions-rac.sql) · Read-only diagnostic

Find waiting sessions with a valid blocker. Match instance, SID and serial number before acting. The left join preserves the waiting row if the blocker disappears between dynamic-view reads.

Access to `GV$SESSION`.

## Objects with transaction locks

[locked-objects.sql](locked-objects.sql) · Read-only diagnostic

Check which objects have DML locks in the current container. A lock row can be normal and can exist without any waiter.

Access to `V$LOCKED_OBJECT`, `V$SESSION`, `DBA_OBJECTS`.

## Cursor counts for one session

[session-open-cursors.sql](session-open-cursors.sql) · Read-only diagnostic

Investigate cursor pressure on the current instance. Cursor types include cached entries. Compare the opened-cursors-current statistic and the configured limit for a leak assessment.

Access to `V$OPEN_CURSOR`.

Bind variables

- `:p_sid` `NUMBER` · SID from the target instance.

```sql
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
@sessions-locks/session-open-cursors.sql
```

## Progress of tracked long operations

[session-long-operations.sql](session-long-operations.sql) · Read-only diagnostic

Monitor incomplete operations reported by Oracle. `time_remaining` is an estimate and the view covers only instrumented operations.

Access to `GV$SESSION_LONGOPS`.

## Map a session to a server process

[session-server-process.sql](session-server-process.sql) · Read-only diagnostic

Find the server process on the current instance after confirming SID and serial number. A shared server or threaded configuration can make an OS PID non-unique to a session.

Access to `V$SESSION`, `V$PROCESS`.

Bind variables

- `:p_sid` `NUMBER` · SID from the target instance.
- `:p_serial` `NUMBER` · SERIAL# paired with the SID.

```sql
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
@sessions-locks/session-server-process.sql
```

## Parallel coordinator and workers

[parallel-session-workers.sql](parallel-session-workers.sql) · Read-only diagnostic

Trace currently visible parallel workers across RAC instances using the coordinator's instance, SID and serial number.

Access to `GV$PX_SESSION`.

Bind variables

- `:p_instance` `NUMBER` · Instance number, or the monitor coordinator instance.
- `:p_sid` `NUMBER` · SID from the target instance.
- `:p_serial` `NUMBER` · SERIAL# paired with the SID.

```sql
VARIABLE p_instance NUMBER
EXEC :p_instance := 1
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
@sessions-locks/parallel-session-workers.sql
```

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
