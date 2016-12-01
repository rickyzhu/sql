select frm.form_name
from   fnd_form frm, fnd_form_tl frmtl
where  frm.form_id = frmtl.form_id
and    frmtl.user_form_name like '%&user_form_name%'
and    frmtl.language = 'US'
/
