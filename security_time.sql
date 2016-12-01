set line 132
set pagesize 20000

col timestamp   for a20
col username    for a20
col userhost    for a27
col priv_used   for a20
col action_name for a20
col returncode  for a15

spool audit_time.out

select   to_char(timestamp, 'DD/MM/YYYY HH24:MI:SS') timestamp,
         rpad(nvl(username,'N/A'),20,' ') username,
         rpad(nvl(userhost,'N/A'),27,' ') userhost,
         rpad(nvl(priv_used,'N/A'),20,' ') priv_used,
         rpad(nvl(action_name,'N/A'),20,' ') action_name,
         rpad(nvl(decode(returncode,
            1,    'U_CONS_VIOLATE',
            54,   'RESOURCE_BUSY',
            904,  'INV_IDENTIFIER',
            942,  'TABLE_NOT_EXIST',
            955,  'NAME_USE_BY_OBJ',
            1017, 'INV_NAME/PASS',
            1400, 'CANT_INS_NULL',
            1401, 'INS_TOO_LARGE',
            1722, 'INV_NUM',
            2248, 'INV_OPT_ALT_SES',
            6502, 'PLSQL_N/V_ERR',
            24344,'SQL_COMP_ERR',
            25228,'TIMEOUT_MSG_DEQ',
         returncode),0),15,' ') returncode
from     dba_audit_trail 
where    to_char(timestamp, 'YYYYMM') = to_char(sysdate, 'YYYYMM')
order by timestamp
;

spool off
