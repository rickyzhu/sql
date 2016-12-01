select * from dba_objects
where object_name in 
(
'HGL_CHECK_GROUP_ID',
'IGIPMGLT',
'IGIPREC',
'IGI_ITR_GL_INTERFACE_PKG',
'AP_PAYMENT_EVENT_WF_PKG',
'ARP_CASH_BASIS_ACCOUNTING',
'FUN_GL_BATCH_TRANSFER',
'FUN_PERIOD_STATUS_PKG',
'FV_AR_PKG',
'FV_CST_GL',
'FV_DISB_IN_TRANSIT',
'FV_YE_CARRYFORWARD',
'FV_YE_CLOSE',
'GL_INTERFACE_PKG',
'HCON_SUMMARY_NET_ASSETS_PKG',
'HCON_UCODE_PLACCOUNT_PKG',
'HGL_213_PKG',
'HGL_REALLOCATE_PKG',
'HRG_REPORTS_DETAIL_PKG',
'IGIPMGLT',
'IGIPREC',
'IGIRCBAP',
'IGI_ITR_GL_INTERFACE_PKG',
'IGS_FI_GL_INTERFACE',
'IGS_FI_UPG_RETENTION',
'OKL_CONTRACT_PARTY_PUB',
'OKL_RULE_PUB',
'PSA_AR_GL_INTERFACE',
'PSA_XFR_TO_GL_PKG',
'PSP_ENC_LIQ_TRAN',
'PSP_ENC_SUM_TRAN',
'PSP_SUM_ADJ',
'PSP_SUM_TRANS',
'PY_ROLLBACK_PKG',
'WMS_CARTNZN_PUB',
'XLA_GL_TRANSFER_PKG',
'XLA_TRANSFER_PKG',
'ZPB_BUILD_METADATA',
'HCON_CHK_GL_IMPORT',
'HCON_RERUN_IMPORT',
'IGI_BUD_JOURNAL_LINES_T2',
'IGI_BUD_JOURNAL_LINES_T3',
'IGI_BUD_JOURNAL_PERIODS_T1',
'IGI_BUD_JOURNAL_PERIODS_T2'
)
