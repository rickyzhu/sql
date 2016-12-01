set line 132
set pagesize 10000

col client_name for a40
col job_start_time for a50
col job_duration for a15

select client_name, job_start_time, job_duration
from dba_autotask_job_history
where client_name like '%&client_name%'
order by job_start_time
/

