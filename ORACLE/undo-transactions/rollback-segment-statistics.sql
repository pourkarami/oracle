SELECT con_id, usn, xacts, waits, writes,
       ROUND(rssize / POWER(1024, 2), 2) AS segment_mib,
       wraps, extends, shrinks
FROM   v$rollstat
ORDER BY xacts DESC, con_id, usn;
