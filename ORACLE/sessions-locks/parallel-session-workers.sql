SELECT inst_id AS worker_instance, sid AS worker_sid,
       serial# AS worker_serial, server_group, server_set, server#,
       degree AS actual_degree, req_degree AS requested_degree
FROM   gv$px_session
WHERE  qcinst_id = :p_instance
AND    qcsid = :p_sid
AND    qcserial# = :p_serial
AND    (inst_id <> qcinst_id OR sid <> qcsid)
ORDER BY server_group, server_set, server#, inst_id;
