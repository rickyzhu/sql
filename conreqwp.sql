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
       req.oracle_process_id
FROM   apps.fnd_concurrent_requests req,
       apps.fnd_concurrent_programs prog,
       apps.fnd_user usr
WHERE  req.requested_by = usr.user_id
AND    req.program_application_id = prog.application_id
AND    req.concurrent_program_id = prog.concurrent_program_id
AND    prog.concurrent_program_name = '&program_name'
ORDER BY req.actual_start_date
/
