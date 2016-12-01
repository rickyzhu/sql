
define sqlid=$1

exec dbms_sqltune.drop_tuning_task('STA_&sqlid');


EXEC DBMS_SQLTUNE.execute_tuning_task(task_name => 'STA_&sqlid');

SET SERVEROUTPUT ON
DECLARE
l_sql_tune_task_id  VARCHAR2(100);
BEGIN
l_sql_tune_task_id := DBMS_SQLTUNE.create_tuning_task (
   begin_snap  => 141,
   end_snap    => 142,
   sql_id      => '&sqlid',
   scope       => DBMS_SQLTUNE.scope_comprehensive,
   time_limit  => 1800,
   task_name   => 'STA_&sqlid',
   description => 'Tuning task for statement &sqlid in STA.');
DBMS_OUTPUT.put_line('l_sql_tune_task_id: ' || l_sql_tune_task_id);
END;
/

SET LONG 8000
SET LONGCHUNKSIZE 8000
SET LINESIZE 100
SET PAGESIZE 100

SELECT dbms_sqltune.report_tuning_task('STA_&sqlid')
FROM dual
/

