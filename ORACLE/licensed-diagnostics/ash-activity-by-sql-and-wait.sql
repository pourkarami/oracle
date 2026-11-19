SELECT inst_id, con_id, sql_id, session_state, wait_class, event,
       COUNT(*) AS active_samples
FROM   gv$active_session_history
WHERE  sample_time >= SYSTIMESTAMP - NUMTODSINTERVAL(:p_minutes, 'MINUTE')
AND    session_type = 'FOREGROUND'
GROUP BY inst_id, con_id, sql_id, session_state, wait_class, event
ORDER BY active_samples DESC, inst_id, con_id, sql_id, session_state, event
FETCH FIRST 50 ROWS ONLY;
