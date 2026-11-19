SELECT wait_class,
       SUM(total_waits_fg) AS foreground_waits,
       ROUND(SUM(time_waited_micro_fg) / 1000000, 2) AS foreground_wait_seconds
FROM   v$system_event
WHERE  wait_class <> 'Idle'
GROUP BY wait_class
ORDER BY foreground_wait_seconds DESC NULLS LAST, wait_class;
