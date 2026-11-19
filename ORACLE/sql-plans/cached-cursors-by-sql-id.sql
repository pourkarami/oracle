SELECT con_id, sql_id, child_number, plan_hash_value, executions,
       parse_calls, buffer_gets, disk_reads, rows_processed,
       ROUND(cpu_time / 1000000, 3) AS cpu_seconds,
       ROUND(elapsed_time / 1000000, 3) AS elapsed_seconds,
       last_active_time
FROM   v$sql
WHERE  sql_id = :p_sql_id
AND    con_id = TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID'))
ORDER BY child_number;
