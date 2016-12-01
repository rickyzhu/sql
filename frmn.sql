select frmtl.user_form_name
from   fnd_form frm, fnd_form_tl frmtl
where  frm.form_id = frmtl.form_id
and    frm.form_name = '&form_name'
and    frmtl.language = 'US'
/
