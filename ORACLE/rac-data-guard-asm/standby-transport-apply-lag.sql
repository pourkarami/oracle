SELECT name, value, unit, time_computed, datum_time
FROM   v$dataguard_stats
WHERE  LOWER(name) IN ('transport lag', 'apply lag', 'apply finish time')
ORDER BY name;
