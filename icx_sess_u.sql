select
  disabled_flag,
  to_char(first_connect,'MM/DD/YYYY HH:MI:SS') Start_Time,
  to_char(sysdate,'HH:MI:SS') Current_Time,
  USER_NAME,
  session_id,
  (SYSDATE-last_connect)*24*60 Mins_Idle,
  fnd_profile.value_specific
   ('ICX_SESSION_TIMEOUT',
     a.user_id,
     a.responsibility_id,
     a.responsibility_application_id,
     a.org_id,
     NULL
   ) TimeOut
from
  ICX_SESSIONS a, fnd_User b
where
  a.user_id=b.user_id
  and user_name='&USER_NAME_IN_UPPER_CASE'
order by first_connect 
/
