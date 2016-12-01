set line 132
set pagesize 1000

column profile  format a40
column value    format a40
column level    format a6
column location format a40

SELECT distinct protl.user_profile_option_name "Profile",
       DECODE( prov.profile_option_value,
                  '1', '1 (may be "Yes")',
                  '2', '2 (may be "No")',
                  prov.profile_option_value) "Value",
       DECODE( prov.level_id,
                  10001, 'Site',
                  10002, 'Appl',
                  10003, 'Resp',
                  10004, 'User',
                  '????') "Level",
       DECODE( prov.level_id,
                  10002, appl.application_name,
                  10003, resp.responsibility_name,
                  10004, usr.user_name,
                  '-') "Location"
FROM   applsys.fnd_application_tl appl,
       applsys.fnd_user usr,
       applsys.fnd_responsibility_tl resp,
       applsys.fnd_profile_option_values prov,
       applsys.fnd_profile_options pro,
       applsys.fnd_profile_options_tl protl
WHERE  UPPER( protl.user_profile_option_name) LIKE UPPER( '%&User_Profile_Option_Name%')
AND    protl.profile_option_name = pro.profile_option_name
AND    pro.application_id = prov.application_id
AND    pro.profile_option_id = prov.profile_option_id
AND    prov.level_value = resp.responsibility_id (+)
AND    prov.level_value = usr.user_id (+)
AND    prov.level_value = appl.application_id(+)
ORDER BY 1
/
