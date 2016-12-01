export ORACLE_SID=$1
sqlplus "/ as sysdba" << !
spool $1_db_links.log;
@chk_db_links.sql;
spool off;
!
