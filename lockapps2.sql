SELECT SESSION_ID "SESSION",
       SERIAL#,
	   substr(s.status,1,8) "STATUS",
       to_char(s.logon_time,'DD-MM-YYYY_HH24:MI:SS') "LOGGEDON",
       substr(a.OBJECT_NAME,1,30) "OBJECT NAME",
       substr(a.object_type,1,5) "TYPE",
       substr(v.OS_USER_NAME,1,13) "OS USER",
       substr(s.TERMINAL,1,10) "COMPUTER",
       decode(locked_mode, 2, 'row share', 3, 'row exclusive', 4, 'share', 5, 'share row exclusive', 6, 'exclusive',  'unknown') "Lockmode"
FROM   v$locked_object v,
       all_objects a,
       v$session s
WHERE  a.OBJECT_ID=v.OBJECT_ID
AND    s.SID=v.SESSION_ID
and    v.ORACLE_USERNAME='APPS'
AND    a.object_name like '%&object_name%'
ORDER BY s.logon_time,a.OBJECT_NAME,s.logon_time
/
