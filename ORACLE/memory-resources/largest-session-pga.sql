SELECT s.sid, s.serial#, s.con_id, s.status, s.sql_id,
       ROUND(MAX(CASE WHEN n.name = 'session pga memory' THEN st.value END)
         / POWER(1024, 2), 2) AS current_pga_mib,
       ROUND(MAX(CASE WHEN n.name = 'session pga memory max' THEN st.value END)
         / POWER(1024, 2), 2) AS peak_pga_mib
FROM   v$session s
JOIN   v$sesstat st ON st.sid = s.sid
JOIN   v$statname n ON n.statistic# = st.statistic#
WHERE  s.type = 'USER'
AND    n.name IN ('session pga memory', 'session pga memory max')
GROUP BY s.sid, s.serial#, s.con_id, s.status, s.sql_id
ORDER BY current_pga_mib DESC NULLS LAST, s.sid
FETCH FIRST 30 ROWS ONLY;
