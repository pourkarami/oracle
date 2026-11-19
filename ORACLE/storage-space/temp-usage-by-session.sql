SELECT u.inst_id, u.con_id, s.sid, u.session_num AS serial#,
       u.tablespace, u.segtype, u.sql_id_tempseg,
       SUM(u.blocks) AS temp_blocks, SUM(u.extents) AS temp_extents
FROM   gv$tempseg_usage u
LEFT JOIN gv$session s
       ON s.inst_id = u.inst_id
      AND s.saddr = u.session_addr
      AND s.serial# = u.session_num
      AND s.con_id = u.con_id
GROUP BY u.inst_id, u.con_id, s.sid, u.session_num,
         u.tablespace, u.segtype, u.sql_id_tempseg
ORDER BY temp_blocks DESC NULLS LAST, u.inst_id, s.sid;
