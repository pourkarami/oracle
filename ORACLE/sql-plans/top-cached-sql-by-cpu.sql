SELECT con_id, sql_id, plan_hash_value, executions, buffer_gets, disk_reads,
       ROUND(cpu_time / 1000000, 3) AS cpu_seconds,
       ROUND(cpu_time / NULLIF(executions, 0) / 1000, 3) AS cpu_ms_per_execution,
       last_active_time
FROM   v$sqlstats
WHERE  last_active_time >= SYSDATE - :p_minutes / 1440
AND    con_id = TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID'))
ORDER BY cpu_time DESC NULLS LAST, sql_id
FETCH FIRST 25 ROWS ONLY;
