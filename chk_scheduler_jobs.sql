set line 132
set pagesize 10000

col owner for a15
col job_name for a40
col actual_start_date for a50
col run_duration for a15

select owner, job_name, actual_start_date, run_duration
from DBA_SCHEDULER_JOB_RUN_DETAILS
where owner like '%&owner%'
and job_name like '%&job_name%'
order by actual_start_date
/

