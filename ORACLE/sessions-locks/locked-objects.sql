SELECT l.session_id AS sid, s.serial#, l.con_id,
       o.owner, o.object_name, o.subobject_name, o.object_type,
       l.locked_mode, s.sql_id
FROM   v$locked_object l
JOIN   v$session s ON s.sid = l.session_id
                  AND s.con_id = l.con_id
JOIN   dba_objects o ON o.object_id = l.object_id
WHERE  l.con_id = TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID'))
ORDER BY o.owner, o.object_name, l.session_id;
