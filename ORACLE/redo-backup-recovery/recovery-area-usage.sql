SELECT con_id, name, number_of_files,
       ROUND(space_limit / POWER(1024, 3), 2) AS limit_gib,
       ROUND(space_used / POWER(1024, 3), 2) AS used_gib,
       ROUND(space_reclaimable / POWER(1024, 3), 2) AS reclaimable_gib,
       ROUND(100 * space_used / NULLIF(space_limit, 0), 1) AS used_percent
FROM   v$recovery_file_dest;
