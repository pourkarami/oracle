SELECT sql_handle, plan_name, origin, enabled, accepted, fixed,
       reproduced, created, last_executed
FROM   dba_sql_plan_baselines
WHERE  (:p_handle IS NULL OR sql_handle = :p_handle)
ORDER BY created DESC, sql_handle, plan_name
FETCH FIRST 100 ROWS ONLY;
