SELECT inst_id, con_id, sample_time, session_id, session_serial#,
       sql_id, sql_plan_hash_value, session_state, wait_class, event,
       blocking_inst_id, blocking_session
FROM   gv$active_session_history
WHERE  inst_id = :p_instance
AND    session_id = :p_sid
AND    session_serial# = :p_serial
AND    sample_time >= SYSTIMESTAMP - NUMTODSINTERVAL(:p_minutes, 'MINUTE')
ORDER BY sample_time DESC
FETCH FIRST 500 ROWS ONLY;
