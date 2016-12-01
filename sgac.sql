col name  for a20
col mb    for 999999.99
col inuse for 999999.99

select name, round(sum(mb),1) mb, round(sum(inuse),1) inuse
from (
      select case 
                when name = 'buffer_cache' 
                   then 'db_cache_size'
                when name = 'log_buffer' 
                   then 'log_buffer'
                else pool
             end name,
             bytes/1024/1024 mb,
             case when name = 'buffer_cache'               
                     then (bytes - 
                           (select count(*) from v$bh where  status='free') *
                           (select value from v$parameter where name = 'db_block_size')
                          )/1024/1024
                  when name <> 'free memory'
                     then bytes/1024/1024
             end inuse
      from v$sgastat
)group by name
/
