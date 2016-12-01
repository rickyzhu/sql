set line 132
set pagesize 1000
set long 50000

col spid format a8
col sid format 999999
col s_serial# format 999999
col process format a8
col machine format a10
col module format a50
col action format a50
col status format a8
col username format a10
col osuser format a8
col sql_fulltext format a132

SELECT   s.osuser osuser,
         s.username su,
         s.status status,
         s.sid sid,
         s.serial# serial#,
	 s.process process,
         s.module module,
	 s.action action,
         p.spid spid,
         sa.sql_fulltext
FROM     v$process p,
         v$session s,
         v$sqlarea sa
WHERE    p.addr=s.paddr
AND      s.username is not null
AND      s.sql_address = sa.address(+)
AND      s.sql_hash_value = sa.hash_value(+)
AND      s.sid = &sid
/
