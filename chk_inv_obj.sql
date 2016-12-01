set line 132
set pagesize 10000
set trimspool on

col owner format a15
col object_type format a15
col object_name format a60

select owner, object_type, object_name
from dba_objects
where status = 'INVALID'
order by owner, object_type, object_name
/
