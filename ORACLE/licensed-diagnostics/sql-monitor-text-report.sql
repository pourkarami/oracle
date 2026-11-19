SELECT DBMS_SQLTUNE.REPORT_SQL_MONITOR(
           sql_id         => :p_sql_id,
           sql_exec_start => TO_DATE(:p_exec_start, 'YYYY-MM-DD HH24:MI:SS'),
           sql_exec_id    => :p_exec_id,
           inst_id        => :p_instance,
           report_level   => 'TYPICAL',
           type           => 'TEXT'
       ) AS report
FROM   dual;
