select (select username from v$session where sid=a.sid) blocker,
       a.sid,
       ' is blocking ',
       (select username from v$session where sid=b.sid) blockee,
        b.sid
from   v$lock a,
       (select sid, id1, id2, request
       from v$lock 
       where request > 0) b
where  a.id1 = b.id1
and    a.id2 = b.id2
and    a.block = 1
/
