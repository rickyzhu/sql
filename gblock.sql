col inst_id for 999999
col sid for 999999
col blocker for a12
col blockee for a12
col machine for a28

SELECT DISTINCT
       S1.INST_ID  ,
       S1.SID      ,
       S1.MACHINE  ,
       S1.USERNAME BLOCKER,
       ' IS BLOCKING ',
       S2.INST_ID  ,
       S2.SID      ,
       S2.MACHINE  ,
       S2.USERNAME BLOCKEE
FROM   GV$LOCK L1,
       GV$SESSION S1,
       GV$LOCK L2,
       GV$SESSION S2
WHERE  S1.SID=L1.SID
AND    S2.SID=L2.SID
AND    S1.INST_ID=L1.INST_ID
AND    S2.INST_ID=L2.INST_ID
AND    L1.BLOCK > 0
AND    L2.REQUEST > 0
AND    L1.ID1 = L2.ID1
AND    L1.ID2 = L2.ID2
ORDER BY S1.INST_ID, S1.SID
/

