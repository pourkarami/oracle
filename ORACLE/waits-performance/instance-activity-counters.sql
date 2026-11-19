SELECT i.instance_number, i.startup_time, SYSTIMESTAMP AS sampled_at,
       s.name, s.value
FROM   v$sysstat s
CROSS JOIN v$instance i
WHERE  s.name IN ('user commits', 'user rollbacks', 'execute count',
                  'session logical reads', 'physical reads', 'redo size',
                  'redo buffer allocation retries')
ORDER BY s.name;
