SELECT f.file_id, f.file_name, f.online_status,
       ROUND(f.bytes / POWER(1024, 2), 2) AS current_mib,
       MAX(e.block_id + e.blocks - 1) AS highest_extent_block,
       ROUND(MAX(e.block_id + e.blocks) * t.block_size / POWER(1024, 2), 2)
         AS observed_extent_boundary_mib
FROM   dba_data_files f
JOIN   dba_tablespaces t ON t.tablespace_name = f.tablespace_name
LEFT JOIN dba_extents e ON e.file_id = f.file_id
WHERE  f.file_id = :p_file_id
GROUP BY f.file_id, f.file_name, f.online_status, f.bytes, t.block_size;
