SELECT con_id, child_number, position, name, datatype_string,
       was_captured, last_captured
FROM   v$sql_bind_capture
WHERE  sql_id = :p_sql_id
AND    con_id = TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID'))
ORDER BY child_number, position;
