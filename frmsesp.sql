set linesize 132
set pagesize 1000

col sid format 999999
col serial# format 999999
col machine format a10
col username format a15
col os_user format a10
col status format a10
col form_name format a50
col apps_user format a30
col machine format a15
col sid_serial format a12
col idle format a10
col lockwait format a10

SELECT  s.sid,
        s.serial#,
        s.machine,
        s.username,
        s.osuser,
        decode(s.lockwait,'','','y') lockwait,
        to_char(s.logon_time, 'DD/MM/YYYY HH24:MI:SS') logon_time,
        nvl(f.start_time, nvl(r.start_time, l.start_time)) start_time,
        floor(s.last_call_et/3600) || ':' || floor(mod(s.last_call_et,3600)/60) || ':' || mod(mod(s.last_call_et,3600),60) idle,
        s.status,
        usr.user_name,
        rsp.responsibility_name,
        frm.user_form_name,
        l.pid
FROM    apps.fnd_responsibility_tl rsp,
        apps.fnd_form_tl frm,
        apps.fnd_user usr,
        apps.fnd_logins l,
        apps.fnd_login_responsibilities r,
        apps.fnd_login_resp_forms f,
        v$session s
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
AND     f.audsid = s.audsid
AND     s.process = '&process'
/
