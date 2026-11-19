SELECT w.inst_id AS waiting_instance, w.sid AS waiting_sid,
       w.serial# AS waiting_serial, w.con_id AS waiting_container,
       w.event, w.seconds_in_wait, w.sql_id AS waiting_sql_id,
       w.blocking_instance, w.blocking_session AS blocking_sid,
       b.serial# AS blocking_serial, b.sql_id AS blocking_sql_id,
       w.final_blocking_instance, w.final_blocking_session
FROM   gv$session w
LEFT JOIN gv$session b
       ON b.inst_id = w.blocking_instance
      AND b.sid = w.blocking_session
WHERE  w.state = 'WAITING'
AND    w.blocking_session_status = 'VALID'
ORDER BY w.seconds_in_wait DESC, w.inst_id, w.sid;
