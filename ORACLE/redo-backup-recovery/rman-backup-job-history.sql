SELECT session_key, input_type, status, start_time, end_time, elapsed_seconds,
       ROUND(output_bytes / POWER(1024, 3), 2) AS output_gib,
       output_device_type
FROM   v$rman_backup_job_details
WHERE  start_time >= SYSDATE - :p_days
ORDER BY start_time DESC, session_key DESC
FETCH FIRST 100 ROWS ONLY;
