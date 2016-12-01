set line 200
set pagesize 5000

col segment_type for a15
col table_name for a30
col column_name for a50

select nvl(l.table_name,s.segment_name) table_name, s.segment_name, s.segment_type, sum(s.bytes)/1024/1024 MB, l.column_name
from dba_segments s, dba_lobs l
where s.owner = l.owner (+)
and s.segment_name = l.segment_name (+)
and s.tablespace_name = 'NAVISTS'
and s.segment_type in ('TABLE','LOBSEGMENT')
and nvl(l.table_name,s.segment_name) not like 'L$%'
and nvl(l.table_name,s.segment_name) not like 'MDRT%$'
and nvl(l.table_name,s.segment_name) not like 'MLOG$%'
group by s.segment_name, s.segment_type, l.table_name, l.column_name
order by table_name, s.segment_type desc
/

select table_name, sum(MB) MB
from (
select nvl(l.table_name,s.segment_name) table_name, s.segment_name, s.segment_type, sum(s.bytes)/1024/1024 MB, l.column_name
from dba_segments s, dba_lobs l
where s.owner = l.owner (+)
and s.segment_name = l.segment_name (+)
and s.tablespace_name = 'NAVISTS'
and s.segment_type in ('TABLE','LOBSEGMENT')
and nvl(l.table_name,s.segment_name) not like 'L$%'
and nvl(l.table_name,s.segment_name) not like 'MDRT%$'
and nvl(l.table_name,s.segment_name) not like 'MLOG$%'
group by s.segment_name, s.segment_type, l.table_name, l.column_name
order by table_name, s.segment_type desc
)
group by table_name
order by table_name
/
