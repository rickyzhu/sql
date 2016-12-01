select   o.sql_id,
         sa.sql_fulltext,
         o.count
from     (select sql_id, count(1) count from v$open_cursor group by sql_id) o,
         v$sqlarea sa
where    o.sql_id = sa.sql_id
and      o.count >= to_number(decode('&&sql_min_count','','0','&sql_min_count'))
order    by o.count
/

undefine sql_min_count;
