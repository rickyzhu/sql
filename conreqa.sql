set line 132
set pagesize 1000

col request_id format 99999999
col phase_code format a10
col status_code format a12
col request_date format a20
col requested_start_date format a20
col actual_start_date format a20
col actual_completion_date format a20
col user_name format a15
col responsibility_name format a20
col concurrent_program_name format a30
col sid format 999999
col serial# format 999999
col osuser format a10
col process format a12
col spid format a8
col pid format 999999

SELECT req.request_id,
       DECODE(req.phase_code,
              'C', 'Completed',
              'I', 'Inactive',
              'P', 'Pending',
              'R', 'Running',
              req.phase_code) phase_code,
       DECODE(req.status_code,
              'A', 'Waiting',
              'B', 'Resuming',
              'C', 'Normal',
              'D', 'Cancelled',
              'E', 'Errored',
              'F', 'Scheduled',
              'G', 'Warning',
              'H', 'On Hold',
              'I', 'Normal',
              'M', 'No Manager',
              'Q', 'Standby',
              'R', 'Normal',
              'S', 'Suspended',
              'T', 'Terminating',
              'U', 'Disabled',
              'W', 'Paused',
              'X', 'Terminated',
              'Z', 'Waiting',
              req.status_code) status_code,
       to_char(req.request_date, 'DD/MM/YYYY HH24:MI:SS') request_date,
       to_char(req.requested_start_date, 'DD/MM/YYYY HH24:MI:SS') requested_start_date,
       to_char(req.actual_start_date, 'DD/MM/YYYY HH24:MI:SS') actual_start_date,
       to_char(req.actual_completion_date, 'DD/MM/YYYY HH24:MI:SS') actual_completion_date,
       usr.user_name,
       rep.responsibility_name,
       prog.concurrent_program_name,
       req.oracle_process_id,
       req.argument_text
FROM   apps.fnd_concurrent_requests req,
       apps.fnd_concurrent_programs prog,
       apps.fnd_user usr,
       apps.fnd_responsibility_tl rep
WHERE  req.requested_by = usr.user_id
AND    req.program_application_id = prog.application_id
AND    req.concurrent_program_id = prog.concurrent_program_id
AND    req.responsibility_application_id = rep.application_id
AND    req.responsibility_id = rep.responsibility_id
AND    rep.language = 'US'
AND    prog.concurrent_program_name like '%&program_name%'
AND    usr.user_name like '%&user_name%'
AND    req.argument_text like '%&argument%'
ORDER BY req.request_date, req.actual_start_date
/
