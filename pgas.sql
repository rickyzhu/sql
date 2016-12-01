select sid, sum(value)/1024/1024 Mb
from   v$sesstat s, v$statname n
where  n.STATISTIC# = s.STATISTIC#
and    name = 'session pga memory'
group by sid
order by Mb
/
