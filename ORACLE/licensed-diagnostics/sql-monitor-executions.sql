SELECT inst_id, con_id, status, sql_id, sql_exec_id, sql_exec_start,
       TO_CHAR(sql_exec_start, 'YYYY-MM-DD HH24:MI:SS') AS report_start_value,
       sql_plan_hash_value,
       ROUND(elapsed_time / 1000000, 3) AS elapsed_seconds,
       ROUND(cpu_time / 1000000, 3) AS cpu_seconds,
       buffer_gets, disk_reads
FROM   gv$sql_monitor
WHERE  sql_id = :p_sql_id
AND    px_server# IS NULL
ORDER BY sql_exec_start DESC, inst_id, sql_exec_id
FETCH FIRST 50 ROWS ONLY;
