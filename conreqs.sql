set line 132
set pagesize 1000

col request_id format 99999999
col phase_code format a10
col status_code format a12
col request_date format a20
col actual_start_date format a20
col actual_completion_date format a20
col user_name format a15
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
       to_char(req.actual_start_date, 'DD/MM/YYYY HH24:MI:SS') actual_start_date,
       to_char(req.actual_completion_date, 'DD/MM/YYYY HH24:MI:SS') actual_completion_date,
       usr.user_name,
       prog.concurrent_program_name,
       s.sid,
       s.serial#,
       s.osuser,
       s.process,
       p.spid,
       p.pid,
       req.oracle_process_id
FROM   apps.fnd_concurrent_requests req,
       apps.fnd_concurrent_programs prog,
       apps.fnd_user usr,
       v$session s,
       v$process p
WHERE  req.requested_by = usr.user_id
AND    req.program_application_id = prog.application_id
AND    req.concurrent_program_id = prog.concurrent_program_id
AND    p.spid = req.oracle_process_id
AND    s.audsid = req.oracle_session_id
AND    s.paddr = p.addr
AND    s.sid    = &sid
/
