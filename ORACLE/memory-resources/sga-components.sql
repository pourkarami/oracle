SELECT component, con_id,
       ROUND(current_size / POWER(1024, 2), 2) AS current_mib,
       ROUND(min_size / POWER(1024, 2), 2) AS min_mib,
       ROUND(max_size / POWER(1024, 2), 2) AS max_mib,
       oper_count, last_oper_type, last_oper_time
FROM   v$sga_dynamic_components
WHERE  current_size > 0
ORDER BY current_size DESC, component;
