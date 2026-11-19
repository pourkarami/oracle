SELECT con_id, usn, slt, seq, state, undoblocksdone, undoblockstotal,
       ROUND(100 * undoblocksdone / NULLIF(undoblockstotal, 0), 1)
         AS estimated_percent
FROM   v$fast_start_transactions
ORDER BY con_id, usn, slt, seq;
