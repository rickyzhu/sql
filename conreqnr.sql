select prog.concurrent_program_name, progtl.user_concurrent_program_name
from   fnd_concurrent_programs prog, fnd_concurrent_programs_tl progtl
where  prog.concurrent_program_id = progtl.concurrent_program_id
and    progtl.user_concurrent_program_name like '%&user_concurrent_program_name%' 
and    progtl.language = 'US'
/
