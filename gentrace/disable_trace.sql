
set line 999;

set pagesize 10000;

set trimspool on;

set head on;

set feed on;

set echo on;

set time on;

spool enable_trace.log;

execute dbms_system.set_sql_trace_in_session(9,38149,FALSE);
execute dbms_system.set_sql_trace_in_session(12,29491,FALSE);
execute dbms_system.set_sql_trace_in_session(15,43963,FALSE);
execute dbms_system.set_sql_trace_in_session(19,43019,FALSE);
execute dbms_system.set_sql_trace_in_session(108,11395,FALSE);
execute dbms_system.set_sql_trace_in_session(112,12005,FALSE);
execute dbms_system.set_sql_trace_in_session(118,47813,FALSE);
execute dbms_system.set_sql_trace_in_session(206,54525,FALSE);
execute dbms_system.set_sql_trace_in_session(208,61395,FALSE);
execute dbms_system.set_sql_trace_in_session(210,603,FALSE);
execute dbms_system.set_sql_trace_in_session(213,58093,FALSE);
execute dbms_system.set_sql_trace_in_session(303,53515,FALSE);
execute dbms_system.set_sql_trace_in_session(309,827,FALSE);
execute dbms_system.set_sql_trace_in_session(394,46243,FALSE);
execute dbms_system.set_sql_trace_in_session(404,13895,FALSE);
execute dbms_system.set_sql_trace_in_session(407,22869,FALSE);
execute dbms_system.set_sql_trace_in_session(504,941,FALSE);
execute dbms_system.set_sql_trace_in_session(506,60605,FALSE);
execute dbms_system.set_sql_trace_in_session(589,65339,FALSE);
execute dbms_system.set_sql_trace_in_session(596,2099,FALSE);
execute dbms_system.set_sql_trace_in_session(598,44269,FALSE);
execute dbms_system.set_sql_trace_in_session(600,53243,FALSE);
execute dbms_system.set_sql_trace_in_session(687,38961,FALSE);
execute dbms_system.set_sql_trace_in_session(691,44759,FALSE);
execute dbms_system.set_sql_trace_in_session(692,32377,FALSE);
execute dbms_system.set_sql_trace_in_session(693,56375,FALSE);

spool off;
