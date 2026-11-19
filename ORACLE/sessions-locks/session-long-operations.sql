SELECT inst_id, sid, serial#, con_id, opname, sql_id,
       sofar, totalwork, units,
       ROUND(100 * sofar / NULLIF(totalwork, 0), 1) AS percent_complete,
       elapsed_seconds, time_remaining AS estimated_seconds_remaining,
       start_time, last_update_time
FROM   gv$session_longops
WHERE  totalwork > 0
AND    sofar < totalwork
AND    last_update_time >= SYSDATE - 1
ORDER BY last_update_time DESC, inst_id, sid;
