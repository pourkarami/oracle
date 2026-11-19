SELECT owner_name, job_name, operation, job_mode, state,
       degree, attached_sessions, datapump_sessions
FROM   dba_datapump_jobs
ORDER BY state, owner_name, job_name;
