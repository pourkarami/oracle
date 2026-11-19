SELECT con_id, begin_time, end_time, undoblks, txncount, maxquerylen,
       tuned_undoretention AS tuned_retention_seconds,
       ssolderrcnt AS snapshot_too_old_errors,
       nospaceerrcnt AS out_of_space_errors
FROM   v$undostat
WHERE  end_time >= SYSDATE - :p_hours / 24
ORDER BY begin_time DESC, con_id;
