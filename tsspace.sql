set pagesize 1000

SELECT total.tablespace_name "Tablespace Name",
       nvl(free_space, 0) free_space,
       nvl(total_space-free_space, 0) used_space,
       max_space, 
       total_space,
       round(nvl(total_space-free_space,0)/decode(max_space,0,total_space,max_space)*100,2) max_space_prct
FROM
       (select tablespace_name, sum(bytes/1024/1024) free_Space
        from sys.dba_free_space
        group by tablespace_name
       ) free,
       (select b.tablespace_name, sum(bytes/1024/1024) total_space, sum(maxbytes/1024/1024) max_space
        from dba_data_files a, dba_tablespaces b
        where a.tablespace_name = b.tablespace_name
        group by b.tablespace_name
       ) total
WHERE free.tablespace_name(+) = total.tablespace_name
ORDER BY max_space_prct desc
/
