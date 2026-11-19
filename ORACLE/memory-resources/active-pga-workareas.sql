SELECT con_id, sid, sql_id, operation_type, operation_id, number_passes,
       ROUND(actual_mem_used / POWER(1024, 2), 2) AS pga_mib,
       ROUND(tempseg_size / POWER(1024, 2), 2) AS temp_mib
FROM   v$sql_workarea_active
ORDER BY tempseg_size DESC NULLS LAST, actual_mem_used DESC NULLS LAST, sid
FETCH FIRST 50 ROWS ONLY;
