
set line 999;

set pagesize 10000;

set trimspool on;

set head on;

set feed on;

set echo on;

set time on;

spool enable_trace.log;

execute dbms_system.set_sql_trace_in_session(9,38149,TRUE);
execute dbms_system.set_sql_trace_in_session(12,29491,TRUE);
execute dbms_system.set_sql_trace_in_session(15,43963,TRUE);
execute dbms_system.set_sql_trace_in_session(19,43019,TRUE);
execute dbms_system.set_sql_trace_in_session(108,11395,TRUE);
execute dbms_system.set_sql_trace_in_session(112,12005,TRUE);
execute dbms_system.set_sql_trace_in_session(118,47813,TRUE);
execute dbms_system.set_sql_trace_in_session(206,54525,TRUE);
execute dbms_system.set_sql_trace_in_session(208,61395,TRUE);
execute dbms_system.set_sql_trace_in_session(210,603,TRUE);
execute dbms_system.set_sql_trace_in_session(213,58093,TRUE);
execute dbms_system.set_sql_trace_in_session(303,53515,TRUE);
execute dbms_system.set_sql_trace_in_session(309,827,TRUE);
execute dbms_system.set_sql_trace_in_session(394,46243,TRUE);
execute dbms_system.set_sql_trace_in_session(404,13895,TRUE);
execute dbms_system.set_sql_trace_in_session(407,22869,TRUE);
execute dbms_system.set_sql_trace_in_session(504,941,TRUE);
execute dbms_system.set_sql_trace_in_session(506,60605,TRUE);
execute dbms_system.set_sql_trace_in_session(589,65339,TRUE);
execute dbms_system.set_sql_trace_in_session(596,2099,TRUE);
execute dbms_system.set_sql_trace_in_session(598,44269,TRUE);
execute dbms_system.set_sql_trace_in_session(600,53243,TRUE);
execute dbms_system.set_sql_trace_in_session(687,38961,TRUE);
execute dbms_system.set_sql_trace_in_session(691,44759,TRUE);
execute dbms_system.set_sql_trace_in_session(692,32377,TRUE);
execute dbms_system.set_sql_trace_in_session(693,56375,TRUE);

spool off;
