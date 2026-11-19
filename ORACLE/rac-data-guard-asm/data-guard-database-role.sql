SELECT dbid, name, db_unique_name, database_role, open_mode, log_mode,
       protection_mode, protection_level, switchover_status, force_logging
FROM   v$database;
