col br_name format a70
col freq format a10
col refresh format a5

select br.br_name, 
       br.br_next_run_date, 
       br.br_num_freq_units || decode(br.br_rfu_id, 2002, ' DAY', 2004, ' MONTH', br.br_rfu_id) freq,
       decode(br.br_auto_refresh, 0, 'N', 1, 'Y') refresh
from   discoasw_us.eul5_batch_reports br , discoasw_us.eul5_br_runs brr
where  br.br_id = brr.brr_br_id
and    brr.brr_state = 1
order by br.br_next_run_date desc
/
