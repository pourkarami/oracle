SELECT m.tablespace_name, t.contents, t.status,
       ROUND(m.used_space * t.block_size / POWER(1024, 3), 2) AS used_gib,
       ROUND(m.tablespace_size * t.block_size / POWER(1024, 3), 2) AS capacity_gib,
       ROUND(m.used_percent, 2) AS used_percent
FROM   dba_tablespace_usage_metrics m
JOIN   dba_tablespaces t ON t.tablespace_name = m.tablespace_name
ORDER BY m.used_percent DESC NULLS LAST, m.tablespace_name;
