set line 132
set pagesize 100

col tablespace_name format a25
col mb_used format a15
col mb_total format a15
col perc_used format a10

SELECT res.tablespace_name,
       to_char(res.used/1024/1024,  'FM999,990.00') MB_USED,
       to_char(res.total/1024/1024, 'FM999,990.00') MB_TOTAL,
       to_char(used*100/total, 'FM990.00')||'%' perc_used
FROM  (SELECT tablespace_name,
              block_size,
              (SELECT SUM(v$sort_usage.blocks * block_size)
               FROM   v$sort_usage
               WHERE  v$sort_usage.TABLESPACE = dba_tablespaces.tablespace_name) USED,
              (SELECT SUM(bytes)
               FROM   dba_temp_files
               WHERE  tablespace_name = dba_tablespaces.tablespace_name) TOTAL
       FROM  dba_tablespaces
       WHERE contents = 'TEMPORARY'
) res
/
