SELECT owner, segment_type, segment_name, partition_name, tablespace_name,
       ROUND(bytes / POWER(1024, 2), 2) AS allocated_mib
FROM   dba_segments
WHERE  owner = :p_owner
ORDER BY bytes DESC, segment_name, partition_name
FETCH FIRST 50 ROWS ONLY;
