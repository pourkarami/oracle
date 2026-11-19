SELECT con_dbid, con_id, sql_id, plan_hash_value,
       MIN(timestamp) AS earliest_plan_line_timestamp,
       COUNT(*) AS stored_plan_lines
FROM   dba_hist_sql_plan
WHERE  dbid = :p_dbid
AND    (:p_con_dbid IS NULL OR con_dbid = :p_con_dbid)
AND    sql_id = :p_sql_id
GROUP BY con_dbid, con_id, sql_id, plan_hash_value
ORDER BY earliest_plan_line_timestamp DESC, plan_hash_value;
