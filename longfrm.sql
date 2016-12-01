col logon_time format a23
col module format a50
col action format a34
col status format a10

select   s.logon_time, 
	 s.module, 
	 s.action, 
	 s.status
from     v$session s, apps.fnd_form f
where    s.module = f.form_name
and      s.machine in ('ebsapp01','ebsapp02')
and      abs(sysdate - s.logon_time)*24 > &p_threshold
order by s.logon_time
/
