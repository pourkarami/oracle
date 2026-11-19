SELECT con_id, sql_id, plan_hash_value, executions, rows_processed,
       ROUND(elapsed_time / 1000000, 3) AS elapsed_seconds,
       ROUND(elapsed_time / NULLIF(executions, 0) / 1000, 3)
         AS elapsed_ms_per_execution,
       last_active_time
FROM   v$sqlstats
WHERE  last_active_time >= SYSDATE - :p_minutes / 1440
AND    con_id = TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID'))
ORDER BY elapsed_time DESC NULLS LAST, sql_id
FETCH FIRST 25 ROWS ONLY;
