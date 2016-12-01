set linesize 132
set pagesize 1000

col start_time format a23
col user_name format a15
col description format a50
col user_form_name format a50
col responsibility_name format a50

SELECT  to_char(nvl(f.start_time, nvl(r.start_time, l.start_time)),'DD/MM/YYYY HH24:MI:SS') start_time,
        usr.user_name,
        usr.description,
        rsp.responsibility_name,
        frm.user_form_name
FROM    apps.fnd_responsibility_tl rsp, 
        apps.fnd_form_tl frm, 
        apps.fnd_user usr, 
        apps.fnd_logins l, 
        apps.fnd_login_responsibilities r, 
        apps.fnd_login_resp_forms f
WHERE   r.login_id = f.login_id
AND     r.login_resp_id = f.login_resp_id
AND     l.login_id = r.login_id
AND     l.end_time is null
AND     r.end_time is null
AND     f.end_time is null
AND     l.user_id = usr.user_id
AND     r.responsibility_id = rsp.responsibility_id
AND     r.resp_appl_id = rsp.application_id
AND     rsp.language = userenv('LANG')
AND     f.form_id = frm.form_id
AND     f.form_appl_id = frm.application_id
AND     frm.language = userenv('LANG')
AND     l.pid = &Oracle_process_number
AND     l.process_spid = &Unix_process_pid
/
