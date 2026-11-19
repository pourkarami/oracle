SELECT l.thread#, l.group#, l.sequence#, l.status AS group_status, l.archived,
       ROUND(l.bytes / POWER(1024, 2), 2) AS group_mib,
       m.status AS member_status, m.member
FROM   v$log l
JOIN   v$logfile m ON m.group# = l.group# AND m.type = 'ONLINE'
ORDER BY l.thread#, l.group#, m.member;
