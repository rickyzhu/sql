select sid, sum(value)/1024/1024 Mb
from   v$sesstat s, v$statname n
where  n.STATISTIC# = s.STATISTIC#
and    name = 'session pga memory'
and    sid in (
select sid
from v$session
where module = 'SQL*Plus'
and status = 'ACTIVE'
)
group by sid
order by Mb
/

