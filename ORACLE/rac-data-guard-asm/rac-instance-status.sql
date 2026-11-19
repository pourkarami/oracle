SELECT inst_id, instance_name, instance_number, startup_time,
       status, database_status, logins, archiver, thread#
FROM   gv$instance
ORDER BY inst_id;
