col owner for a8
col job_name for a30
col actual_start_date for a20
col run_duration for a15
col status for a10

select owner, job_name, to_char(actual_start_date,'DD/MM/YYYY HH24:MI:SS') actual_start_date, run_duration, status from dba_scheduler_job_run_details where owner = 'MMOSDATA' order by 1,2,3
;
