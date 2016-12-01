set line 999;
set pagesize 10000;
set trimspool on;
set echo off;
set head off;
set feed off;
set verify off;

col machine for a30
col program for a17
col module for a17

select sid, serial#, status, machine, program, module
from v$session
where username = 'NAVISUSR'
order by machine, sid, serial#;

DEFINE machine = &trace_machine

spool enable_trace.sql

select 'set line 999;' from dual;
select 'set pagesize 10000;' from dual;
select 'set trimspool on;' from dual;
select 'set head on;' from dual;
select 'set feed on;' from dual;
select 'set echo on;' from dual;
select 'set time on;' from dual;

select 'spool enable_trace.log;' from dual;

select 'execute dbms_system.set_sql_trace_in_session(' || sid || ',' || serial# || ',' || 'TRUE);'
from v$session
where username = 'NAVISUSR'
and machine like '%&&machine%';

select 'spool off;' from dual;

spool off;

spool trace_list.log

select '###_' || p.spid || '.trc' 
from v$session s, v$process p
where s.paddr = p.addr
and s.username = 'NAVISUSR'
and machine like '%&&machine%';

spool off;

set head on;
set feed on;


