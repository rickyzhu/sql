col status format a10
col sid format 99999
col username format a8
col undo_blocks format 99999
col undo_records format 9999999

SELECT us.segment_name,
       us.status,
       us.bytes,
       us.seg_count,
       si.sid,
       si.username,
       si.start_time,
       si.used_ublk undo_blocks,
       si.used_urec undo_records
FROM   (SELECT s.sid,
               s.username,
               r.name,
               t.start_time,
               t.used_ublk,
               t.used_urec
        FROM   v$session s,
               v$transaction t,
               v$rollname r
        WHERE  t.addr = s.taddr
        AND    r.usn  = t.xidusn) si,
       (SELECT   segment_name, 
                 status, 
                 sum(bytes) bytes, 
                 count(*) seg_count
        FROM     dba_undo_extents
        GROUP BY segment_name, status) us
WHERE  us.segment_name = si.name (+)
ORDER BY us.status, us.bytes
/
