SELECT stat_name, value AS microseconds,
       ROUND(value / 1000000, 2) AS seconds
FROM   v$sys_time_model
WHERE  stat_name IN ('DB time', 'DB CPU', 'background elapsed time',
                     'background cpu time', 'sql execute elapsed time',
                     'parse time elapsed', 'hard parse elapsed time')
ORDER BY value DESC, stat_name;
