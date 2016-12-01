set line 132
set pagesize 10000

col server_name for a4
col status for a9
col pid for 99999
col spid for a6
col sid for 99999
col serial# for 99999
col qcsid for 99999
col qcserial# for 99999
col qcinst_id for 99999
col server_group for 99999
col server_set for 99999
col server# for 99999
col degree for 99999
col req_degree for 99999
col qclogon_time format a21
col qcp_serial# format 99999
col qcpid format 99999
col qcspid format a8
col qcprocess format a8
col qcmachine format a10
col qcmodule format a48
col qcaction format a32
col qcstatus format a8
col qcusername format a10


select pxp.server_name,
       pxp.status, 
       pxp.pid,
       pxp.spid,
       pxp.sid,
       pxp.serial#,
       pxs.qcsid,
       pxs.qcserial#,
       pxs.qcinst_id,
       pxs.server_group,
       pxs.server_set,
       pxs.server#,
       pxs.degree,
       pxs.req_degree,
       to_char(s.logon_time,'DD/MM/YYYY HH24:MI:SS') qclogon_time,
       p.serial# qcp_serial#,
       p.pid qcpid,
       p.spid qcspid,
       s.process qcprocess,
       s.sid qcsid,
       s.serial# qcs_serial#,
       s.machine qcmachine,
       s.module qcmodule,
       s.action qcaction,
       s.status qcstatus,
       s.username qcusername
from   v$px_process pxp, v$px_session pxs, v$session s, v$process p
where  pxp.sid = pxs.sid (+)
and    pxp.serial# = pxs.serial# (+)
and    pxs.qcsid = s.sid (+)
and    pxs.qcserial# = s.serial# (+)
and    s.paddr = p.addr (+)
order by pxp.server_name
/
