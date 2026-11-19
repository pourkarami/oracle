SELECT sid, serial#, con_id, status, sql_id, sql_child_number,
       CASE WHEN state = 'WAITING' THEN wait_class END AS current_wait_class,
       CASE WHEN state = 'WAITING' THEN event END AS current_wait_event,
       last_call_et AS seconds_in_status
FROM   v$session
WHERE  type = 'USER'
AND    status = 'ACTIVE'
AND    sid <> TO_NUMBER(SYS_CONTEXT('USERENV', 'SID'))
ORDER BY last_call_et DESC, sid;
