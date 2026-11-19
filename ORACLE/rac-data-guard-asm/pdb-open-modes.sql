SELECT inst_id, con_id, name, open_mode, restricted, open_time
FROM   gv$pdbs
ORDER BY con_id, inst_id;
