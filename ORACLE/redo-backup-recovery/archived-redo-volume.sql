WITH logs AS (
    SELECT resetlogs_change#, resetlogs_time, thread#, sequence#,
           MIN(first_time) AS first_time, MAX(blocks * block_size) AS log_bytes
    FROM   v$archived_log
    WHERE  first_time >= TRUNC(SYSDATE) - :p_days + 1
    AND    dest_id = :p_dest_id
    AND    archived = 'YES'
    GROUP BY resetlogs_change#, resetlogs_time, thread#, sequence#
)
SELECT TRUNC(first_time) AS redo_day, thread#, COUNT(*) AS archived_sequences,
       ROUND(SUM(log_bytes) / POWER(1024, 3), 2) AS redo_gib
FROM   logs
GROUP BY TRUNC(first_time), thread#
ORDER BY redo_day DESC, thread#;
