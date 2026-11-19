WITH free_extents AS (
    SELECT file_id, SUM(bytes) AS free_bytes, MAX(bytes) AS largest_extent_bytes
    FROM   dba_free_space
    GROUP BY file_id
)
SELECT d.file_id, d.tablespace_name, d.file_name, d.online_status,
       ROUND(d.bytes / POWER(1024, 2), 2) AS allocated_mib,
       CASE WHEN d.online_status IN ('ONLINE', 'SYSTEM')
            THEN ROUND(NVL(f.free_bytes, 0) / POWER(1024, 2), 2)
       END AS free_mib,
       ROUND(f.largest_extent_bytes / POWER(1024, 2), 2) AS largest_free_extent_mib,
       d.autoextensible,
       ROUND(GREATEST(d.bytes, NVL(d.maxbytes, 0)) / POWER(1024, 2), 2)
         AS configured_ceiling_mib
FROM   dba_data_files d
LEFT JOIN free_extents f ON f.file_id = d.file_id
ORDER BY d.tablespace_name, d.file_id;
