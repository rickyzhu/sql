col file_name format a60
col max_mb format 99999999
col free_mb format 99999999
col used_mb format 99999999

select a.file_name,
       a.bytes/1048576 MAX_MB,
       b.bytes/1048576 FREE_MB,
      (a.bytes - b.bytes)/1048576 USED_MB
from dba_data_files a, 
     (select   tablespace_name, file_id, sum(bytes) bytes
      from     dba_free_space 
      group by tablespace_name, file_id) b
where a.tablespace_name = b.tablespace_name
and   a.file_id = b.file_id
order by b.bytes
/
