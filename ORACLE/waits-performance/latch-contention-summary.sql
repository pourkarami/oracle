SELECT name, gets, misses, sleeps, immediate_gets, immediate_misses,
       ROUND(100 * misses / NULLIF(gets, 0), 3) AS willing_miss_percent
FROM   v$latch
WHERE  misses > 0 OR sleeps > 0 OR immediate_misses > 0
ORDER BY sleeps DESC NULLS LAST, misses DESC NULLS LAST, name
FETCH FIRST 30 ROWS ONLY;
