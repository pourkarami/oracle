SELECT con_id, tablespace_name, file_id,
       ROUND(bytes_used / POWER(1024, 2), 2) AS used_mib,
       ROUND(bytes_free / POWER(1024, 2), 2) AS free_mib
FROM   v$temp_space_header
ORDER BY con_id, tablespace_name, file_id;
