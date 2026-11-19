SELECT s.sid, s.serial#, s.con_id, s.server,
       p.pid AS oracle_process_id, p.spid AS os_process_id, p.stid AS os_thread_id
FROM   v$session s
LEFT JOIN v$process p ON p.addr = s.paddr
WHERE  s.sid = :p_sid
AND    s.serial# = :p_serial;
