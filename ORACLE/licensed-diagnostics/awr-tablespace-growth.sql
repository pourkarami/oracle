WITH snapshot_times AS (
    SELECT dbid, snap_id, MAX(end_interval_time) AS interval_end
    FROM   dba_hist_snapshot
    WHERE  dbid = :p_dbid
    AND    con_id IN (0, TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID')))
    AND    end_interval_time >= SYSTIMESTAMP - NUMTODSINTERVAL(:p_days, 'DAY')
    GROUP BY dbid, snap_id
)
SELECT s.interval_end, u.snap_id, u.con_id, u.tablespace_id,
       u.tablespace_usedsize AS used_blocks,
       u.tablespace_size AS allocated_blocks,
       u.tablespace_maxsize AS max_blocks
FROM   dba_hist_tbspc_space_usage u
JOIN   snapshot_times s ON s.dbid = u.dbid AND s.snap_id = u.snap_id
WHERE  (:p_con_dbid IS NULL OR u.con_dbid = :p_con_dbid)
AND    u.tablespace_id = :p_ts_id
ORDER BY u.snap_id DESC;
