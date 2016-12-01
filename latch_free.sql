
SELECT name, 'Child '||child#, gets, misses, sleeps
FROM v$latch_children 
WHERE addr in (select P1RAW from v$session_wait where sid = &sid)
UNION
SELECT name, null, gets, misses, sleeps
FROM v$latch
WHERE addr in (select P1RAW from v$session_wait where sid = &sid)
;

SELECT * FROM v$latchname 
WHERE latch# in (select P2 from v$session_wait where sid = &sid)
;
