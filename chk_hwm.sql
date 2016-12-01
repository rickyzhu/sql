set line 132
set pagesize 10000
set trimspool on

col file_name for a50
col hwm_mb for 999999
col currsize_mb for 999999
col saving_mb for 999999

select file_name,
ceil( (nvl(ext.hwm,1)*8192)/1024/1024 ) hwm_mb,
ceil( df.blocks*8192/1024/1024 ) currsize_mb,
ceil( (df.blocks-nvl(ext.hwm,1))*8192/1024/1024 ) saving_mb
from dba_data_files df,
     ( select file_id, max(block_id+blocks-1) hwm
       from dba_extents
       group by file_id ) ext
where df.file_id = ext.file_id(+)
and   df.tablespace_name = '&tablespace_name'
/
