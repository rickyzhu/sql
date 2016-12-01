/*****************************************************************************************************************
-- File name:   gen_create_sql_profiles_sp.sql (sql must be in shared pool)
-- Purpose:     Create SQL Profile based on Outline hints in V$SQL.OTHER_XML.
-- Usage:       This scripts prompts for seven values.
--
--              sql_id1: sql_id would like to attached profile (must be in the shared pool)
--              child_no1: the child_no of the statement from v$sql
--              sql_id2: the sql_id of the statement with wanted plans (must be in the shared pool)
--              child_no2: the child_no of the statement from v$sql
--              profile_name: the name of the profile to be generated
--              category: the name of the category for the profile
--              force_macthing: a toggle to turn on or off the force_matching feature
--
-- Description: Based on a script by Kerry Osborne.
--
-- Modify to generate the script instead of applying the script.
-- Modify the below sql (extractvalue) if it will be used by 10g database
*****************************************************************************************************************/
set feedback off
set sqlblanklines on
set serveroutput size on 1000000

accept sql_id1 -
       prompt 'Enter value for sql_id1(sql_id would like to attached profile): ' -
       default 'X0X0X0X0'
accept child_no1 -
       prompt 'Enter value for child_no1 (child number of above sql) (0): ' -
       default '0'
accept sql_id2 -
       prompt 'Enter value for sql_id2(used to generate sql profile): ' -
       default '&&sql_id1'
accept child_no2 -
       prompt 'Enter value for child_no2(child number of above sql) (0): ' -
       default '0'
accept profile_name -
       prompt 'Enter value for profile_name (default - PROF_sqlid_planhash): ' -
       default 'X0X0X0X0'
accept category -
       prompt 'Enter value for category (DEFAULT): ' -
       default 'DEFAULT'
accept force_matching -
       prompt 'Enter value for force_matching (FALSE): ' -
       default 'false'

declare
ar_profile_hints sys.sqlprof_attr;
cl_sql_text clob;
l_profile_name varchar2(30);

begin
select
sql_fulltext,
decode('&&profile_name','X0X0X0X0','PROF_&&sql_id1'||'_'||plan_hash_value,'&&profile_name')
into
cl_sql_text, l_profile_name
from
v$sql
where
sql_id = '&&sql_id1'
and child_number = &&child_no1;


select
extractvalue(value(d), '/hint') as outline_hints -- For 11g database or above
-- extractvalue(d.column_value,'/hint') as outline_hints -- For 10g database
bulk collect
into
ar_profile_hints
from
xmltable('/*/outline_data/hint'
passing (
select
xmltype(other_xml) as xmlval
from
v$sql_plan
where
sql_id = '&&sql_id2'
and child_number = &&child_no2
and other_xml is not null
)
) d;

dbms_output.put_line('set feedback off;');
dbms_output.put_line('set sqlblanklines on;');

dbms_output.put_line('declare');
dbms_output.put_line('ar_profile_hints sys.sqlprof_attr;');
dbms_output.put_line('cl_sql_text clob;');
dbms_output.put_line('v_sql_text varchar2(4000);');
dbms_output.put_line('l_profile_name varchar2(30);');

dbms_output.put_line('begin');

dbms_output.put_line('ar_profile_hints := sys.sqlprof_attr();');
dbms_output.put_line('ar_profile_hints.extend(' || ar_profile_hints.count || ');');

for ar_profile_hints_indx in ar_profile_hints.FIRST..ar_profile_hints.LAST
loop
dbms_output.put_line('ar_profile_hints(' || ar_profile_hints_indx || ') := ''' || replace(ar_profile_hints(ar_profile_hints_indx),'''','''''') || ''';');
end loop;

dbms_output.put_line('cl_sql_text := ''' || replace(cl_sql_text,'''','''''') || ''';');

dbms_output.put_line('dbms_sqltune.import_sql_profile(');
dbms_output.put_line('sql_text => cl_sql_text,');
dbms_output.put_line('profile => ar_profile_hints,');
dbms_output.put_line('category => ''&&category'',');
dbms_output.put_line('name => ''' || l_profile_name || ''',');
dbms_output.put_line('force_match => ''&&force_matching'',');
dbms_output.put_line(');');

dbms_output.put_line('dbms_output.put_line('' '');');
dbms_output.put_line('dbms_output.put_line(''SQL Profile ''||l_profile_name||'' created.'');');
dbms_output.put_line('dbms_output.put_line('' '');');
dbms_output.put_line('exception');
dbms_output.put_line('when NO_DATA_FOUND then');
dbms_output.put_line('dbms_output.put_line(''NO_DATA_FOUND!'');');
dbms_output.put_line('end;');
dbms_output.put_line('/');

exception
when NO_DATA_FOUND then
  dbms_output.put_line(' ');
  dbms_output.put_line('ERROR: sql_id: '||'&&sql_id1'||' Child: '||'&&child_no1'||' not found in v$sql.');
  dbms_output.put_line(' ');

end;
/

undef sql_id1
undef child_no1
undef sql_id2
undef child_no2
undef profile_name
undef category
undef force_matching

