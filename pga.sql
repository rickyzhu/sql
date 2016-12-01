select 'current' status, sum(value)/1024/1024 Mb
from   v$sesstat s,
       v$statname n
where  n.STATISTIC# = s.STATISTIC#
and    name = 'session pga memory'
union
select 'maximum', value/1024/1024
from   v$pgastat
where  name = 'maximum PGA allocated'
/

