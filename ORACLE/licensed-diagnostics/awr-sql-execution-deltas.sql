WITH snapshot_times AS (
    SELECT dbid, snap_id, instance_number,
           MIN(begin_interval_time) AS interval_begin,
           MAX(end_interval_time) AS interval_end
    FROM   dba_hist_snapshot
    WHERE  dbid = :p_dbid
    AND    con_id IN (0, TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID')))
    AND    end_interval_time >= SYSTIMESTAMP - NUMTODSINTERVAL(:p_days, 'DAY')
    GROUP BY dbid, snap_id, instance_number
)
SELECT st.snap_id, st.instance_number, st.con_dbid, st.con_id,
       sn.interval_begin, sn.interval_end, st.plan_hash_value,
       st.executions_delta, st.buffer_gets_delta, st.disk_reads_delta,
       ROUND(st.cpu_time_delta / 1000000, 3) AS cpu_seconds,
       ROUND(st.elapsed_time_delta / 1000000, 3) AS elapsed_seconds
FROM   dba_hist_sqlstat st
JOIN   snapshot_times sn ON sn.dbid = st.dbid
                         AND sn.snap_id = st.snap_id
                         AND sn.instance_number = st.instance_number
WHERE  st.dbid = :p_dbid
AND    (:p_con_dbid IS NULL OR st.con_dbid = :p_con_dbid)
AND    st.sql_id = :p_sql_id
ORDER BY sn.interval_end DESC, st.instance_number, st.con_id, st.plan_hash_value
FETCH FIRST 250 ROWS ONLY;
