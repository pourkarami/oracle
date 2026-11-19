SELECT id, operation, target, status, start_time, end_time
FROM   dba_optstat_operations
WHERE  start_time >= SYSTIMESTAMP - NUMTODSINTERVAL(:p_days, 'DAY')
ORDER BY start_time DESC, id
FETCH FIRST 100 ROWS ONLY;
