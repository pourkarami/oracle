SELECT wait_class, event, total_waits_fg AS foreground_waits,
       ROUND(time_waited_micro_fg / 1000000, 3) AS foreground_wait_seconds,
       ROUND(time_waited_micro_fg / NULLIF(total_waits_fg, 0) / 1000, 3)
         AS average_foreground_wait_ms
FROM   v$system_event
WHERE  wait_class <> 'Idle'
AND    total_waits_fg > 0
ORDER BY time_waited_micro_fg DESC NULLS LAST, event;
