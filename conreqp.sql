set line 132
set pagesize 1000

col parent_request_id format 99999999
col request_id format 99999999
col phase_code format a10
col status_code format a12
col request_date format a20
col actual_start_date format a20
col actual_completion_date format a20
col user_name format a15
col concurrent_program_name format a30
col concurrent_queue_name format a12
col sid format 999999
col serial# format 999999
col osuser format a10
col process format a12
col spid format a8
col pid format 999999

SELECT req.parent_request_id,
       req.request_id,
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
       to_char(req.actual_start_date, 'DD/MM/YYYY HH24:MI:SS') actual_start_date,
       to_char(req.actual_completion_date, 'DD/MM/YYYY HH24:MI:SS') actual_completion_date,
       usr.user_name,
       prog.concurrent_program_name,
       que.concurrent_queue_name,
       req.oracle_process_id
FROM   apps.fnd_concurrent_requests req,
       apps.fnd_concurrent_programs prog,
       apps.fnd_concurrent_processes proc,
       apps.fnd_concurrent_queues que,
       apps.fnd_user usr
WHERE  req.requested_by = usr.user_id
AND    req.program_application_id = prog.application_id
AND    req.concurrent_program_id = prog.concurrent_program_id
AND    req.controlling_manager = proc.concurrent_process_id (+)
AND    proc.concurrent_queue_id = que.concurrent_queue_id  (+)
AND    req.parent_request_id = &parent_request_id
/
