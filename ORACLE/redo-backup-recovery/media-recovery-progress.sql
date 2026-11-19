SELECT con_id, start_time, type, item, units, sofar, total, timestamp
FROM   v$recovery_progress
ORDER BY start_time DESC, type, item;
