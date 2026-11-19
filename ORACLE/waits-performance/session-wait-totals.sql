SELECT e.sid, s.serial#, e.wait_class, e.event, e.total_waits,
       e.total_timeouts, ROUND(e.time_waited_micro / 1000000, 3) AS wait_seconds
FROM   v$session_event e
JOIN   v$session s ON s.sid = e.sid
WHERE  e.sid = :p_sid
AND    s.serial# = :p_serial
AND    e.wait_class <> 'Idle'
ORDER BY e.time_waited_micro DESC NULLS LAST, e.event;
