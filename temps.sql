set line 132
set pagesize 1000

col sort_kb format 999999999
col process format 99999
col sid format 99999
col serial# format 99999
col machine format a10
col module format a20
col action format a40
col status format a8

SELECT    SUM (su.blocks * dts.block_size)/1024 sort_kb,
          s.process,
          s.sid,
          s.serial#,
          s.machine,
          s.module,
          s.action,
          s.status
FROM      v$session s, v$sort_usage su, dba_tablespaces dts
WHERE     dts.tablespace_name = su.TABLESPACE
AND       su.session_addr = s.saddr
GROUP BY  s.sid,
          s.process,
          s.sid,
          s.serial#,
          s.machine,
          s.module,
          s.action,
          s.status
ORDER BY 1
/
