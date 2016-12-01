set line 132
set pagesize 1000

col logon_time format a21
col p_serial# format 999999
col pid format 999999
col spid format a8
col process format a8
col sid format 999999
col s_serial# format 999999
col machine format a25
col module format a48
col action format a32
col status format a8
col username format a10

select to_char(s.logon_time,'DD/MM/YYYY HH24:MI:SS') logon_time, 
       p.serial# p_serial#, 
       p.pid, 
       p.spid,
       s.process,
       s.sid,
       s.serial# s_serial#,
       s.machine,
       s.module,
       s.action,
       s.status,
       s.username
from   v$session s, 
       v$process p
where  s.paddr = p.addr
and    p.spid  = &pid
order by 1 desc
/

