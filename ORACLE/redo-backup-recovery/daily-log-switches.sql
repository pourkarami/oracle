SELECT TRUNC(h.first_time) AS log_day, h.thread#, COUNT(*) AS switches
FROM   v$log_history h
CROSS JOIN v$database d
WHERE  h.first_time >= TRUNC(SYSDATE) - :p_days + 1
AND    h.resetlogs_change# = d.resetlogs_change#
AND    h.resetlogs_time = d.resetlogs_time
GROUP BY TRUNC(h.first_time), h.thread#
ORDER BY log_day DESC, h.thread#;
