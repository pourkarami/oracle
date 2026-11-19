SELECT inst_id, con_id, resource_name, current_utilization, max_utilization,
       initial_allocation, limit_value
FROM   gv$resource_limit
WHERE  resource_name IN ('processes', 'sessions', 'transactions')
ORDER BY inst_id, con_id, resource_name;
