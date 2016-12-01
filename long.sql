set line 132
set pagesize 1000

select *
from v$session_longops
where sofar < totalwork
/
