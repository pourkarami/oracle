SELECT owner, job_name, job_subname, running_instance, session_id,
       elapsed_time, cpu_used
FROM   dba_scheduler_running_jobs
ORDER BY elapsed_time DESC NULLS LAST, owner, job_name;
