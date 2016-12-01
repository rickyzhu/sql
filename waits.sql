select *
from   v$session_wait
where  sid = &sid
/
