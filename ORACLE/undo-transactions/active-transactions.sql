SELECT t.inst_id, t.con_id, s.sid, s.serial#, s.sql_id,
       t.xidusn, t.xidslot, t.xidsqn, t.start_date,
       t.used_ublk AS undo_blocks, t.used_urec AS undo_records
FROM   gv$transaction t
LEFT JOIN gv$session s ON s.inst_id = t.inst_id
                       AND s.saddr = t.ses_addr
                       AND s.con_id = t.con_id
ORDER BY t.used_ublk DESC NULLS LAST, t.inst_id, s.sid;
