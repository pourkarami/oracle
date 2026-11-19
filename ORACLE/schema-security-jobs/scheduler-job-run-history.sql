SELECT owner, job_name, job_subname, status, error# AS error_number,
       actual_start_date, run_duration, instance_id
FROM   dba_scheduler_job_run_details
WHERE  owner = :p_owner
AND    log_date >= SYSTIMESTAMP - NUMTODSINTERVAL(:p_days, 'DAY')
ORDER BY log_date DESC, log_id DESC
FETCH FIRST 100 ROWS ONLY;
