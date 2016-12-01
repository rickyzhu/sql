SET ECHO OFF
REM   =========================================================================
REM   Copyright © 2005 Oracle Corporation Redwood Shores, California, USA
REM   Oracle Support Services.  All rights reserved.
REM   =========================================================================
REM
DEFINE          v_fileName = 'HRMS12'
DEFINE        v_lastUpdate = '02-MAR-2010'
DEFINE          v_testDesc = 'Display HRMS R12 Details'
DEFINE    v_testNoteNumber = '453632.1'
DEFINE           v_product = 'Oracle HRMS'
DEFINE       v_legislation = 'All'
DEFINE          v_platform = 'Generic'
DEFINE v_validAppsVersions = '12.0 and 12.1'
DEFINE   v_inputParameters = 'None'
REM
REM   =========================================================================
REM   USAGE:   sqlplus apps/apps @HRMS12
REM   =========================================================================
REM
REM   CHANGE HISTORY:
REM
REM    07-AUG-2007   jbressle  created
REM
REM    08-AUG-2007   jbressle  added the following:
REM                            HR R12 released HRMS family packs section
REM
REM    15-AUG-2007   jbressle  added the following:
REM                            hardcoded spooled output file name as HRMS12_output_file.txt 
REM                            to accommodate appending !frmbld to this file 
REM                            so as now to see the customer's FORMS VERSION in this output
REM
REM    10-OCT-2007   jbressle  added the following:
REM                            AME Approval Management Engine to OTHER current patching levels section
REM
REM    03-DEC-2007   jbressle  added the following:
REM                            fixed code for Date of last Succesfull Run of hrglobal.drv
REM
REM    18-JAN-2008   jbressle  added R12.HR_PF.A.delta.3 6196269 
REM                            to the R12 released HRMS family packs section
REM
REM    13-FEB-2008   jbressle  added product id 821 for iRec to Application Install Status section
REM                            added 6494646 R12.HR_PF.A.delta.4 to R12 HRMS family packs section
REM
REM    03-MAR-2008   jbressle  added 12.0.4 patching to scripts
REM
REM    07-MAR-2008   jbressle  added the following
REM                            added Language Details section showing Installed Languages
REM
REM    17-JUL-2008   jbressle  added the following:
REM                            R12.HR_PF.A.delta.5 patch 6610000
REM                            GEOCODE section for Address Validation
REM                            Instance Creation Date following Instance Name
REM                            changed output file naming convention to 
REM                                HRMS12_<SID>_<SYSDATE>.txt
REM
REM    22-JUL-2008   jbressle  added the following:
REM                            R12.IRC.A.delta.5 patch 6835790
REM                            R12.OTA.A.delta.5 patch 6835795
REM                            R12.ALR.A.delta.5 patch 6594741
REM                            R12.ALR.A.delta.6 patch 7237106
REM                            R12.XDO.A.delta.5 pacth 6594787
REM                            R12.XDO.A.delta.6 patch 7237308
REM                            R12.UMX.A.delta.5 patch 6594784
REM                            R12.UMX.A.delta.6 patch 7237243
REM                            R12.AK.A.delta.5  patch 6594738
REM                            R12.AK.A.delta.6  patch 7237094
REM                            R12.JTA.A.delta.5 pacth 6594777
REM                            R12.JTA.A.delta.6 patch 7237223
REM                            R12.EC.A.delta.5  patch 6594747
REM                            R12.EC.A.delta.6  patch 7237136
REM                            R12.FRM.A.delta.5 patch 6594779
REM                            R12.FRM.A.delta.6 patch 7237233
REM                            R12.AME.A.delta.5 patch 6835789
REM
REM    09-OCT-2008   jbressle  added ANNUAL GEOCODE/JIT UPDATE-2008 patch 7328291
REM
REM    19-NOV-2008   jbressle  added R12.HR_PF.A.delta.6 patch 7004477
REM                            added R12.OTA.A.delta.6   patch 7291412
REM                            added R12.IRC.A.delta.6   patch 7291408
REM                            added R12.PSP.A.delta.6   patch 7291411
REM
REM    23-FEB-2008   jbressle  added R12.AD.A.delta.5 patch 7305206
REM                            added R12.AD.A.delta.6 patch 7305220
REM
REM    20-APR-2009  jbressle  added R12.HR_PF.A.delta.7 7577660  planned release MAY 15, 2009
REM                           added OVN triggers to HRMS12 output
REM                           added WHO triggers to HRMS12 output
REM
REM    20-MAY-2009  jbressle  added Business Group Details section just before Language Details section
REM
REM    09-JUN-2009  jbressle  added 12.1+ patching levels for 
REM                           R12 HRMS family packs
REM                           R12 iRec patches
REM                           R12 Learning Management patches
REM                           R12 Labor Distribution psp patches
REM                           R12 ATG patching
REM                           R12 Techstack txk patches
REM                           R12 Alert alr patches
REM                           R12 XML Publisher xdo patches
REM                           R12 User Management umx patches
REM                           R12 Common Modules ak patches
REM                           R12 Common Application Calendar cac patching
REM                           R12 CRM applications Foundation jta
REM                           R12 E-Commerce Gateway ec patches
REM                           R12 Application Object Library fnd patches
REM                           R12 Applications DBA ad patches
REM                           R12 Report Manager frm patches
REM                           R12 Trading Community Architecture hz patches
REM                           R12 Financials fin_pf patches
REM                           R12 Web Applications Desktop Integrator bne patches
REM                           R12 Approval Management Engine ame patches
REM
REM    15-JUN-2009  jbressle  added Pay Action Parameter detail section
REM
REM    29-JUN-2009  jbressle  added Business Group and sub-Organization Classification Details
REM                           added v$parameter section at end of report
REM
REM    25-JUL-2009  jbressle  added Employee Numbering Details section covering the following:
REM                                 Global Numbering Profile details 
REM                                 Business Group Info. Org Developer DF details 
REM                                 NEXT_VALUE ordered by BUSINESS_GROUP_ID details 
REM                                 
REM    30-OCT-2009  jbressle  added 8977291:R12.PAY.A (12.0) ANNUAL GEOCODE UPDATE - 2009
REM                                 8977291:R12.PAY.B (12.1) ANNUAL GEOCODE UPDATE - 2009
REM
REM    26-JAN-2010  jbressle  added 8496467:R12.HR_PF.B.delta.2
REM
REM 
REM    09-FEB-2010  jbressle  added PROFILE settings section
REM                           added Legislation to Business Group Info. under Employee Numbering section
REM                           added Public Sector Budgeting to Application Install Status section
REM
REM    02-MAR-2010  jbressle  added Oracle General Ledger & Oracle Payroll to Application Install Status section
REM                           added Profile 'DateTrack:Enabled'
REM
REM
REM
REM
REM
REM
REM
REM
REM




REM
REM   =========================================================================

REM   =========================================================================
REM   Set SQL PLUS Environment Variables
REM   =========================================================================

      SET FEEDBACK OFF
      SET HEADING ON
      SET LINESIZE 100
      SET LONG 2000000000
      SET LONGCHUNKSIZE 32767
      SET PAGESIZE 50
      SET SERVEROUTPUT ON SIZE 1000000 FORMAT WRAP
      SET TERMOUT ON
      SET TIMING OFF
      SET TRIMOUT ON
      SET TRIMSPOOL ON
      SET VERIFY OFF

      ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';      
    
REM   =========================================================================
REM   Define SQL Variables
REM   =========================================================================

      COLUMN userName new_value v_userName noprint
      select user userName from dual;

      COLUMN testDate new_value v_testDate noprint
      select substr('&v_testDesc',INSTR('&v_testDesc','(',1,1)+1,11) testDate from dual;
                 
      COLUMN sqlplusVersion new_value v_sqlplusVersion noprint
      SELECT NVL('&_SQLPLUS_RELEASE','Unknown') sqlplusVersion from dual;
      
      COLUMN server NEW_VALUE v_server NOPRINT
      SELECT HOST_NAME server FROM V$INSTANCE;
      
      COLUMN platform NEW_VALUE v_platform NOPRINT
      SELECT SUBSTR( REPLACE( REPLACE( pcv1.product,'TNS for '),':' )||pcv2.status,1,40 ) platform
      FROM product_component_version pcv1, product_component_version pcv2
      WHERE UPPER( pcv1.product ) LIKE '%TNS%' AND UPPER( pcv2.product ) LIKE '%ORACLE%' AND ROWNUM = 1;
      

      COLUMN ssdt NEW_VALUE v_ssdt NOPRINT
      SELECT SYSDATE ssdt FROM DUAL;

      COLUMN sid NEW_VALUE v_sid NOPRINT
      SELECT NAME sid FROM V$DATABASE;

      COLUMN crtddt NEW_VALUE v_crtddt NOPRINT
      SELECT CREATED crtddt FROM V$DATABASE;
      
      COLUMN dbVersion NEW_VALUE v_dbVer NOPRINT
      SELECT BANNER dbVersion FROM V$VERSION WHERE ROWNUM = 1;
      
      COLUMN dbComp NEW_VALUE v_dbComp NOPRINT      
      SELECT 'compatible = ' || p.value dbComp FROM v$parameter p WHERE p.name = 'compatible';
      
      COLUMN dbLang NEW_VALUE v_lang NOPRINT
      SELECT VALUE dbLang FROM V$NLS_PARAMETERS WHERE parameter = 'NLS_LANGUAGE';
      
      COLUMN dbCharSet NEW_VALUE v_char NOPRINT
      SELECT VALUE dbCharSet FROM V$NLS_PARAMETERS WHERE parameter = 'NLS_CHARACTERSET';
      
      COLUMN appVer NEW_VALUE v_appVer NOPRINT
      SELECT RELEASE_NAME appVer FROM FND_PRODUCT_GROUPS;
       


REM   =========================================================================
REM   R12 HRMS family packs
REM   =========================================================================

      COLUMN PFbugDate NEW_VALUE v_PFbugDate NOPRINT                    
      SELECT * FROM (
      SELECT 'Patch:' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4719824', 'R12.HR_PF.A - 12.0'
             , '5881943', 'R12.HR_PF.A.delta.1 - 12.0.1'
             , '5997278', 'R12.HR_PF.A.delta.2 - 12.0.2'
             , '6196269', 'R12.HR_PF.A.delta.3 - 12.0.3'
             , '6494646', 'R12.HR_PF.A.delta.4 - 12.0.4'
             , '6610000', 'R12.HR_PF.A.delta.5 - 12.0.5'
             , '7004477', 'R12.HR_PF.A.delta.6 - 12.0.6'
             , '7577660', 'R12.HR_PF.A.delta.7 - 12.0.7'
             , '6603330', 'R12.HR_PF.B - 12.1'
             , '7446767', 'R12.HR_PF.B.delta.1 - 12.1.1'
             , '8496467', 'R12.HR_PF.B.delta.2 - 12.1.2')
          || ' applied ' || LAST_UPDATE_DATE || ' '   PFbugDate
      FROM ad_bugs 
      WHERE BUG_NUMBER IN   
          ('4719824','5881943','5997278','6196269','6494646','6610000','7004477','7577660',
           '6603330','7446767','8496467')
      ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1; 
  	                    



REM   =========================================================================
REM   R12 GEOCODE patches
REM   =========================================================================

      COLUMN GeocodeDate NEW_VALUE v_GeocodeDate NOPRINT                    
      SELECT * FROM (
      SELECT 'patch ' || bug_number || ' ' ||
             DECODE(BUG_NUMBER
             , '8977291', 'GEOCODE_ANNUAL_2009')  
          || ' applied ' || LAST_UPDATE_DATE || ' '   GeocodeDate
      FROM ad_bugs 
      WHERE BUG_NUMBER IN   
          ('8977291')
      ORDER BY BUG_NUMBER desc
      ) WHERE ROWNUM = 1; 





REM   =========================================================================
REM   All Geocodes Patches Installed 
REM   =========================================================================



      COLUMN GeocodeDate2009 NEW_VALUE v_GeocodeDate2009 NOPRINT                    
      SELECT * FROM (
      SELECT ' applied ' || LAST_UPDATE_DATE || ' '   GeocodeDate2009
      FROM ad_bugs 
      WHERE BUG_NUMBER IN   
          ('8977291')
      ORDER BY BUG_NUMBER desc
      ) WHERE ROWNUM = 1; 




REM   =========================================================================
REM   R12 PER and PAY installed
REM   =========================================================================


      COLUMN HRStatus NEW_VALUE v_HRStatus NOPRINT
      SELECT L.MEANING  HRStatus
      FROM FND_APPLICATION_ALL_VIEW V, FND_PRODUCT_INSTALLATIONS I, FND_LOOKUPS L
      WHERE (V.APPLICATION_ID = I.APPLICATION_ID)
        AND (V.APPLICATION_ID = '800')
        AND (L.LOOKUP_TYPE = 'FND_PRODUCT_STATUS')
        AND (L.LOOKUP_CODE = I.Status);
        



      COLUMN PayStatus NEW_VALUE v_PayStatus NOPRINT
      SELECT L.MEANING  PayStatus
      FROM FND_APPLICATION_ALL_VIEW V, FND_PRODUCT_INSTALLATIONS I, FND_LOOKUPS L
      WHERE (V.APPLICATION_ID = I.APPLICATION_ID)
        AND (V.APPLICATION_ID = '801')
        AND (L.LOOKUP_TYPE = 'FND_PRODUCT_STATUS')
        AND (L.LOOKUP_CODE = I.Status);       
        




REM   =========================================================================
REM   R12 Workflow WF version
REM   =========================================================================


      COLUMN wfVer NEW_VALUE v_wfVersion NOPRINT
      SELECT 'WorkFlow' || ' ' || TEXT wfVer
      FROM WF_RESOURCES
      WHERE TYPE = 'WFTKN' 
        AND NAME = 'WF_VERSION'
        AND LANGUAGE = 'US';






REM   =========================================================================
REM   R12 iRec patches
REM   =========================================================================

      COLUMN IRCbugDate NEW_VALUE v_IRCbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'iRecruitment patch: ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '5348577', 'R12.IRC.A'
             , '5889675', 'R12.IRC.A.delta.1'
             , '5997243', 'R12.IRC.A.delta.2'
             , '6196261', 'R12.IRC.A.delta.3'
             , '6506488', 'R12.IRC.A.delta.4'
             , '6835790', 'R12.IRC.A.delta.5'
             , '7291412', 'R12.IRC.A.delta.6'
             , '7644755', 'R12.IRC.A.delta.7'
             , '6658014', 'R12.IRC.B'
             , '7457050', 'R12.IRC.B.delta.1'
             , '8496476', 'R12.IRC.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' IRCbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('5348577','5889675','5997243','6196261','6506488','6835790','7291412','7644755',
              '6658014','7457050','8496476')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;




REM   =========================================================================
REM   R12 Learning Management patches
REM   =========================================================================

COLUMN OLMbugDate NEW_VALUE v_OLMbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Learning Management:' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '5348582', 'R12.OTA.A'
             , '5889686', 'R12.OTA.A.delta.1'
             , '5997248', 'R12.OTA.A.delta.2'
             , '6196267', 'R12.OTA.A.delta.3'
             , '6506492', 'R12.OTA.A.delta.4'
             , '6835795', 'R12.OTA.A.delta.5'
             , '7291412', 'R12.OTA.A.delta.6'
             , '7644783', 'R12.OTA.A.delta.7'
             , '6658018', 'R12.OTA.B'
             , '7457054', 'R12.OTA.B.delta.1'
             , '8496481', 'R12.OTA.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' OLMbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('5348582','5889686','5997248','6196267','6506492','6835795','7291412','7644783',
              '6658018','7457054','8496481')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Labor Distribution psp patches
REM   =========================================================================

      COLUMN LDbugDate NEW_VALUE v_LDbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Labor Distribution: ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '5348607', 'R12.PSP.A'
             , '5889704', 'R12.PSP.A.delta.1'
             , '5997266', 'R12.PSP.A.delta.2'
             , '6196266', 'R12.PSP.A.delta.3'
             , '6506493', 'R12.PSP.A.delta.4'
             , '6835794', 'R12.PSP.A.delta.5'
             , '7291411', 'R12.PSP.A.delta.6'
             , '7644760', 'R12.PSP.A.delta.7'
             , '6658017', 'R12.PSP.B'
             , '7457053', 'R12.PSP.B.delta.1'
             , '8496480', 'R12.PSP.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' LDbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('5348607','5889704','5997266','6196266','6506493','6835794','7291411','7644760',
              '6658017','7457053','8496480')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 MultiOrg flag
REM   =========================================================================


      COLUMN MultiORGflag NEW_VALUE v_MultiORGflag NOPRINT                    
      SELECT * FROM (
             SELECT 'Multi Org flag = ' || ' ' || MULTI_ORG_FLAG || '  - ' ||
             ' flag set ' || LAST_UPDATE_DATE || ' ' MultiORGflag
             FROM FND_PRODUCT_GROUPS)
      WHERE ROWNUM = 1;




REM   =========================================================================
REM   R12 ATG patching
REM   =========================================================================


      COLUMN ATGbugDate NEW_VALUE v_ATGbugDate NOPRINT                    
      SELECT * FROM (
             SELECT 'Applications Technology patch:     ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4461237', 'R12.ATG_PF.A'
             , '5907545', 'R12.ATG_PF.A.delta.1'
             , '5917344', 'R12.ATG_PF.A.delta.2'
             , '6077669', 'R12.ATG_PF.A.delta.3'
             , '6272680', 'R12.ATG_PF.A.delta.4'
             , '6594849', 'R12.ATG_PF.A.delta.5'
             , '7237006', 'R12.ATG_PF.A.delta.6'
             , '6430106', 'R12.ATG_PF.B'
             , '7307198', 'R12.ATG_PF.B.delta.1'
             , '7651091', 'R12.ATG_PF.B.delta.2') 
             || ' applied ' || LAST_UPDATE_DATE || ' 'ATGbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
         ('4461237','5907545','5917344','6077669','6272680','6594849','7237006', 
          '6430106','7307198','7651091')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Techstack txk patches
REM   =========================================================================

      COLUMN TXKbugDate NEW_VALUE v_TXKbugDate NOPRINT                    
      SELECT * FROM (
             SELECT 'Techstack patch:                   ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4494373', 'R12.TXK.A'
             , '5909746', 'R12.TXK.A.delta.1'
             , '5917601', 'R12.TXK.A.delta.2'
             , '6077487', 'R12.TXK.A.delta.3'
             , '6329757', 'R12.TXK.A.delta.4'
             , '6594792', 'R12.TXK.A.delta.5'
             , '7237313', 'R12.TXK.A.delta.6'
             , '6430145', 'R12.TXK.B'
             , '7310275', 'R12.TXK.B.delta.1'
             , '7651166', 'R12.TXK.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' TXKbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4494373','5909746','5917601','6077487','6329757','6594792','7237313', 
              '6430145','7310275','7651166')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Alert alr patches
REM   =========================================================================

      COLUMN ALRbugDate NEW_VALUE v_ALRbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Alerts patch:                      ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4496584', 'R12.ALR.A'
             , '5907552', 'R12.ALR.A.delta.1'
             , '5917314', 'R12.ALR.A.delta.2'
             , '6077418', 'R12.ALR.A.delta.3'
             , '6354126', 'R12.ALR.A.delta.4'
             , '6594741', 'R12.ALR.A.delta.5'
             , '7237106', 'R12.ALR.A.delta.6'
             , '6430052', 'R12.ALR.B'
             , '7310220', 'R12.ALR.B.delta.1'
             , '7651141', 'R12.ALR.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' ALRbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4496584','5907552','5917314','6077418','6354126','6594741','7237106',
              '6430052','7310220','7651141')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 XML Publisher xdo patches
REM   =========================================================================

      COLUMN XDObugDate NEW_VALUE v_XDObugDate NOPRINT                    
      SELECT * FROM (
             SELECT 'XML Publisher patch:               ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4495174', 'R12.XDO.A'
             , '5907579', 'R12.XDO.A.delta.1'
             , '5917336', 'R12.XDO.A.delta.2'
             , '6077632', 'R12.XDO.A.delta.3'
             , '6354146', 'R12.XDO.A.delta.4'
             , '6594787', 'R12.XDO.A.delta.5'
             , '7237308', 'R12.XDO.A.delta.6'
             , '6430103', 'R12.XDO.B'
             , '7310274', 'R12.XDO.B.delta.1'
             , '7651160', 'R12.XDO.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' XDObugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4495174','5907579','5917336','6077632','6354146','6594787','7237308',
              '6430103','7310274','7651160')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 User Management umx patches
REM   =========================================================================

      COLUMN UMXbugDate NEW_VALUE v_UMXbugDate NOPRINT                    
      SELECT * FROM (
             SELECT 'User Management patch:             ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4495281', 'R12.UMX.A'
             , '5907564', 'R12.UMX.A.delta.1'
             , '5917323', 'R12.UMX.A.delta.2'
             , '6077616', 'R12.UMX.A.delta.3'
             , '6354143', 'R12.UMX.A.delta.4'
             , '6594784', 'R12.UMX.A.delta.5'
             , '7237243', 'R12.UMX.A.delta.6'
             , '6430099', 'R12.UMX.B'
             , '7310266', 'R12.UMX.B.delta.1'
             , '7651155', 'R12.UMX.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' UMXbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4495281','5907564','5917323','6077616','6354143','6594784','7237243',
              '6430099','7310266','7651155')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 Common Modules ak patches
REM   =========================================================================

      COLUMN AKbugDate NEW_VALUE v_AKbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'AK Common Modules patch:           ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4496642', 'R12.AK.A'
             , '5907546', 'R12.AK.A.delta.1'
             , '5917306', 'R12.AK.A.delta.2'
             , '6077390', 'R12.AK.A.delta.3'
             , '6354123', 'R12.AK.A.delta.4'
             , '6594738', 'R12.AK.A.delta.5'
             , '7237094', 'R12.AK.A.delta.6'
             , '6430051', 'R12.AK.B'
             , '7307331', 'R12.AK.B.delta.1'
             , '7651136', 'R12.AK.B.delta.2') 
             || ' applied ' || LAST_UPDATE_DATE || ' ' AKbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4496642','5907546','5917306','6077390','6354123''6594738','7237094',
              '6430051','7307331','7651136')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 Common Application Calendar cac patching
REM   =========================================================================

      COLUMN CACbugDate NEW_VALUE v_CACbugDate NOPRINT                    
      SELECT * FROM (
             SELECT 'Common Application Calendar patch: ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4462883', 'R12.CAC.A'
             , '5884322', 'R12.CAC.A.delta.1'
             , '6000253', 'R12.CAC.A.delta.2'
             , '6262228', 'R12.CAC.A.delta.3'
             , '6496853', 'R12.CAC.A.delta.4'
             , '7300404', 'R12.CAC.A.delta.5'
             , '7303904', 'R12.CAC.A.delta.6'
             , '4561622', 'R12.CAC.B'
             , '7442397', 'R12.CAC.B.delta.1'
             , '8508689', 'R12.CAC.B.delta.2') 
             || ' applied ' || LAST_UPDATE_DATE || ' ' CACbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4462883','5884322','6000253','6262228','6496853','7300404','7303904',
              '4561622','7442397','8508689')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 CRM applications Foundation jta
REM   =========================================================================

      COLUMN JTAbugDate NEW_VALUE v_JTAbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'CRM Applications Foundation patch: ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4497250', 'R12.JTA.A'
             , '5907573', 'R12.JTA.A.delta.1'
             , '5917330', 'R12.JTA.A.delta.2'
             , '6077589', 'R12.JTA.A.delta.3'
             , '6354137', 'R12.JTA.A.delta.4'
             , '6594777', 'R12.JTA.A.delta.5'
             , '7237223', 'R12.JTA.A.delta.6'
             , '6430094', 'R12.JTA.B'
             , '7310261', 'R12.JTA.B.delta.1'
             , '7651152', 'R12.JTA.B.delta.2') 
             || ' applied ' || LAST_UPDATE_DATE || ' ' JTAbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4497250','5907573','5917330','6077589','6354137','6594777','7237223',
              '6430094','7310261','7651152')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 E-Commerce Gateway ec patches
REM   =========================================================================

      COLUMN ECbugDate NEW_VALUE v_ECbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'E-Commerce Gateway patch:          ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4496609', 'R12.EC.A'
             , '5907563', 'R12.EC.A.delta.1'
             , '5917321', 'R12.EC.A.delta.2'
             , '6077463', 'R12.EC.A.delta.3'
             , '6354135', 'R12.EC.A.delta.4'
             , '6594747', 'R12.EC.A.delta.5'
             , '7237136', 'R12.EC.A.delta.6'
             , '6430064', 'R12.EC.B'
             , '7310236', 'R12.EC.B.delta.1'
             , '7651149', 'R12.EC.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' ECbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN  
             ('4496609','5907563','5917321','6077463','6354135','6594747','7237136',
              '6430064','7310236','7651149')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Application Object Library fnd patches
REM   =========================================================================

      COLUMN FNDbugDate NEW_VALUE v_FNDbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Application Object Library patch:  ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4494236', 'R12.FND.A'
             , '5907547', 'R12.FND.A.delta.1'
             , '5917310', 'R12.FND.A.delta.2'
             , '6077562', 'R12.FND.A.delta.3'
             , '6272353', 'R12.FND.A.delta.4'
             , '6594756', 'R12.FND.A.delta.5'
             , '7237143', 'R12.FND.A.delta.6'
             , '6430070', 'R12.FND.B'
             , '7307224', 'R12.FND.B.delta.1'
             , '7651104', 'R12.FND.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' FNDbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4494236','5907547','5917310','6077562','6272353','6594756','7237143',
              '6430070','7307224','7651104')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 Applications DBA ad patches
REM   =========================================================================

      COLUMN ADbugDate NEW_VALUE v_ADbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Applications DBA patch:            ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4502962', 'R12.AD.A'
             , '5905728', 'R12.AD.A.delta.1'
             , '6014659', 'R12.AD.A.delta.2'
             , '6272715', 'R12.AD.A.delta.3'
             , '6510214', 'R12.AD.A.delta.4'
             , '7305206', 'R12.AD.A.delta.5'
             , '7305220', 'R12.AD.A.delta.6'
             , '6665350', 'R12.AD.B'
             , '7461070', 'R12.AD.B.1'
             , '7458155', 'R12.AD.B.delta.1')
             || ' applied ' || LAST_UPDATE_DATE || ' ' ADbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4502962','5905728','6014659','6272715','6510214','7305206','7305220',
              '6665350','7461070','7458155')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   R12 Report Manager frm patches
REM   =========================================================================

      COLUMN FRMbugDate NEW_VALUE v_FRMbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Report Manager patch:              ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4494603', 'R12.FRM.A'
             , '5907553', 'R12.FRM.A.delta.1'
             , '5917316', 'R12.FRM.A.delta.2'
             , '6077597', 'R12.FRM.A.delta.3'
             , '6354138', 'R12.FRM.A.delta.4'
             , '6594779', 'R12.FRM.A.delta.5'
             , '7237233', 'R12.FRM.A.delta.6'
             , '6430095', 'R12.FRM.B'
             , '7310264', 'R12.FRM.B.delta.1'
             , '7651154', 'R12.FRM.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' FRMbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4494603','5907553','5917316','6077597','6354138','6594779','7237233',
              '6430095','7310264','7651154')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Trading Community Architecture hz patches
REM   =========================================================================

      COLUMN HZbugDate NEW_VALUE v_HZbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Trading Community patch:           ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4442901', 'R12.HZ.A'
             , '5884333', 'R12.HZ.A.delta.1'
             , '6000271', 'R12.HZ.A.delta.2'
             , '6262395', 'R12.HZ.A.delta.3'
             , '6496858', 'R12.HZ.A.delta.4'
             , '7299997', 'R12.HZ.A.delta.5'
             , '7300355', 'R12.HZ.A.delta.6'
             , '4565315', 'R12.HZ.B'
             , '7389406', 'R12.HZ.B.delta.1'
             , '8521996', 'R12.HZ.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' HZbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4442901','5884333','6000271','6262395','6496858','7299997','7300355',
              '4565315','7389406','8521996')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Financials fin_pf patches
REM   =========================================================================

      COLUMN FINbugDate NEW_VALUE v_FINbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Financials patch:                  ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4175000', 'R12.FIN_PF.A'
             , '5884587', 'R12.FIN_PF.A.delta.1'
             , '6000030', 'R12.FIN_PF.A.delta.2'
             , '6251856', 'R12.FIN_PF.A.delta.3'
             , '6493602', 'R12.FIN_PF.A.delta.4'
             , '6836355', 'R12.FIN_PF.A.delta.5'
             , '7294050', 'R12.FIN_PF.A.delta.6'
             , '4565490', 'R12.FIN_PF.B'
             , '7457000', 'R12.FIN_PF.B.delta.1'
             , '8402900', 'R12.FIN_PF.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' FINbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4175000','5884587','6000030','6251856','6493602','6836355','7294050',
              '4565490','7457000','8402900')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;







REM   =========================================================================
REM   R12 Web Applications Desktop Integrator bne patches
REM   =========================================================================

      COLUMN ADIbugDate NEW_VALUE v_ADIbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Web Application Desktop Integrator:' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '4494583', 'R12.BNE.A'
             , '5907557', 'R12.BNE.A.delta.1'
             , '5917318', 'R12.BNE.A.delta.2'
             , '6077453', 'R12.BNE.A.delta.3'
             , '6354131', 'R12.BNE.A.delta.4'
             , '6594745', 'R12.BNE.A.delta.5'
             , '7237127', 'R12.BNE.A.delta.6'
             , '6430060', 'R12.BNE.B'
             , '7310227', 'R12.BNE.B.delta.1'
             , '7651146', 'R12.BNE.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' ADIbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('4494583','5907557','5917318','6077453','6354131','6594745','7237127',
              '6430060','7310227','7651146')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;





REM   =========================================================================
REM   R12 Approval Management Engine ame patches
REM   =========================================================================


      COLUMN AMEbugDate NEW_VALUE v_AMEbugDate NOPRINT    
      SELECT * FROM (
             SELECT 'Approval Management Engine:        ' || '  ' || bug_number || ' - ' ||
             DECODE(BUG_NUMBER
             , '5348050', 'R12.AME.A'
             , '5889626', 'R12.AME.A.delta.1'
             , '5997203', 'R12.AME.A.delta.2'
             , '6196260', 'R12.AME.A.delta.3'
             , '6506440', 'R12.AME.A.delta.4'
             , '6835789', 'R12.AME.A.delta.5'
             , '7291407', 'R12.AME.A.delta.6'
             , '7644754', 'R12.AME.A.delta.7'
             , '6658013', 'R12.AME.B'
             , '7457049', 'R12.AME.B.delta.1'
             , '8496475', 'R12.AME.B.delta.2')
             || ' applied ' || LAST_UPDATE_DATE || ' ' AMEbugDate
         FROM ad_bugs 
         WHERE BUG_NUMBER IN 
             ('5348050','5889626','5997203','6196260','6506440','6835789','7291407','7644754',
              '6658013','7457049','8496475')
         ORDER BY BUG_NUMBER desc ) 
      WHERE ROWNUM = 1;






REM   =========================================================================
REM   START SPOOLING 
REM   =========================================================================

REM   COLUMN fileExt new_value v_fileExtension noprint

      select decode(substr('&v_sqlplusVersion',1,3),'800','txt','html') fileExt from dual; 


REM   COLUMN spoolfile new_value v_spoolFile noprint
REM   select '&v_fileName._&v_sid._diag.&v_fileExtension' spoolFile from dual;
      
REM   COLUMN setMarkupOff new_value v_setMarkupOff noprint
REM   select decode('&v_fileExtension','html','MARKUP html OFF SPOOL OFF','ECHO OFF') setMarkupOff from dual;   
      
REM      COLUMN setMarkupOn new_value v_setMarkupOn noprint
REM      select decode(lower('&v_fileExtension'),'html','MARKUP html ON SPOOL ON HEAD ''<TITLE>&v_spoolFile</TITLE> -
REM             <STYLE type="text/css"> - 
REM             BODY {font:10pt Arial,Helvetica,sans-serif; color:black; background:White;} 
REM             p {font:10pt Arial,Helvetica,sans-serif; color:black; background:White;} 
REM             table,tr,td {font:10pt Arial,Helvetica,sans-serif; color:Black; background:#f7f7e7; padding:0px 0px 0px 0px; 
REM             margin:0px 0px 0px 0px;} 
REM             th {font:bold 10pt Arial,Helvetica,sans-serif; color:#336699; background:#cccc99; padding:0px 0px 0px 0px;} 
REM             h1 {font:16pt Arial,Helvetica,Geneva,sans-serif; color:#336699; background-color:White; border-bottom:1px solid #cccc99; 
REM             margin-top:0pt; margin-bottom:0pt; padding:0px 0px 0px 0px;} 
REM             h2 {font:bold 10pt Arial,Helvetica,Geneva,sans-serif; color:#336699; background-color:White; margin-top:4pt; 
REM             margin-bottom:0pt;} 
REM             a {font:9pt Arial,Helvetica,sans-serif; color:#663300; background:#ffffff; margin-top:0pt; margin-bottom:0pt; 
REM             vertical-align:top;}</STYLE>''','ECHO OFF') setMarkupOn from dual; 

REM   select decode(lower('&v_fileExtension'),'html','ECHO OFF','ECHO OFF') setMarkupOn from dual; 


      COLUMN spoolfile new_value v_spoolFile noprint
      select '&v_fileName._&v_sid._&v_ssdt..txt' spoolFile from dual;



REM   =========================================================================
REM   END SPOOLING
REM   =========================================================================





REM   =========================================================================
REM   Prompt for Input Parameter(s)
REM   =========================================================================

      PROMPT
      PROMPT &v_fileName..sql - 'Last HRMS12.sql Update Date ' &v_lastUpdate
      PROMPT ================================================================
      PROMPT &v_testDesc
      PROMPT
      PROMPT SQL*Plus User/Version = &v_userName / &v_sqlplusVersion      
      PROMPT NOTE: This Script must be run from SQL*Plus as user apps.
      PROMPT
      PROMPT

      COLUMN startTime new_value v_start noprint
      SELECT to_number(TO_CHAR(SYSDATE,'SSSSS')) startTime FROM DUAL;
      
REM   =========================================================================
REM   Start Spooling and Display Running Message
REM   =========================================================================

      PROMPT ======================================================================
      PROMPT Generating Details for &v_fileName.  This may take several minutes.
      PROMPT ======================================================================
      PROMPT
      PROMPT  Running.....
      PROMPT 
      
      SET TERMOUT OFF;
REM   SET &v_setMarkupOn
REM   SPOOL &v_spoolFile


REM   SPOOL HRMS12_output_file.txt


      SPOOL &v_spoolFile


      PROMPT SQL*Plus User/Version = &v_userName / &v_sqlplusVersion
      PROMPT NOTE: This Script must be run from SQL*Plus as user apps.  
      PROMPT
          

REM   =========================================================================
REM   Display Test Header Details
REM   =========================================================================



      PROMPT
      PROMPT
      PROMPT DATE HRMS12 was run: &v_ssdt
      PROMPT
      PROMPT
      PROMPT &v_fileName..sql - Last Update Date: &v_lastUpdate
      PROMPT =========================================================
      PROMPT &v_testDesc
      PROMPT 
      PROMPT
      PROMPT Review the following notes on www.MyOracleSupport.com
      PROMPT The following notes are for Oracle Applications release 11i and 12
      PROMPT =========================================================
      PROMPT Note: 135266.1 - Oracle HRMS Product Family - Release 11i and 12 Information
      PROMPT Note: 145837.1 - Latest HRMS (HR Global) Legislative Data Patch available
      PROMPT Note: 174605.1 - bde_chk_cbo.sql - current, required and rec. init.ora params  
      PROMPT Note: 226987.1 - Oracle HRMS and Benefits Tuning and System Health Check 
      PROMPT
      PROMPT
      PROMPT Most current downloadable version of file HRMS12.sql
      PROMPT =========================================================
      PROMPT Note: &v_testNoteNumber - Latest version of &v_fileName..sql
      PROMPT
      PROMPT
      PROMPT Instance details
      PROMPT ================
      PROMPT            Instance Name = &v_sid
      PROMPT   Instance Creation Date = &v_crtddt
      PROMPT          Server/Platform = &v_server - &v_platform
      PROMPT    Language/Characterset = &v_lang - &v_char
      PROMPT                 Database = &v_dbVer - &v_dbComp
      PROMPT             Applications = &v_appVer
      PROMPT  &v_wfVersion
      PROMPT  PER &v_HRStatus | PAY &v_PayStatus
      PROMPT
      PROMPT
      PROMPT R12 released HRMS family packs
      PROMPT ===========================
      PROMPT  R12.HR_PF.B.delta.2 8496467  released DEC-15-2009 (12.1.2)
      PROMPT  R12.HR_PF.B.delta.1 7446767  released APR-09-2009 (12.1.1)
      PROMPT  R12.HR_PF.B         6603330  released AUG-13-2008 (12.1)
      PROMPT  R12.HR_PF.A.delta.7 7577660  released MAY-15-2009 (12.0.7)
      PROMPT  R12.HR_PF.A.delta.6 7004477  released NOV-06-2008 (12.0.6)
      PROMPT  R12.HR_PF.A.delta.5 6610000  released MAY-15-2008 (12.0.5)
      PROMPT  R12.HR_PF.A.delta.4 6506482  released JAN-11-2008 (12.0.4)
      PROMPT  R12.HR_PF.A.delta.3 6196269  released OCT-15-2007 (12.0.3)
      PROMPT  R12.HR_PF.A.delta.2 5997278  released JUL-17-2007 (12.0.2)
      PROMPT  R12.HR_PF.A.delta.1 5881943  released JUN-08-2007 (12.0.1)
      PROMPT  R12.HR_PF.A         4719824  released JAN-18-2007 (12.0)
      PROMPT ===========================
      PROMPT  currently installed HR_PF patch = &v_PFbugDate
      PROMPT
      PROMPT
      PROMPT
      PROMPT released GEOCODE patches for Vertex Address Validation
      PROMPT ===========================
      PROMPT  ANNUAL GEOCODE UPDATE - 2009  patch 8977291 released OCT 01 2009
      PROMPT
      PROMPT ===========================
      PROMPT  currently installed GEOCODE patch = &v_GeocodeDate
      PROMPT
      PROMPT
      PROMPT
      PROMPT Learning Management details
      PROMPT ===========================
      PROMPT  &v_OLMbugDate
      PROMPT
      PROMPT
      PROMPT iRecruitment details
      PROMPT ===========================
      PROMPT  &v_IRCbugDate
      PROMPT
      PROMPT
      PROMPT Labor Distribution details
      PROMPT ===========================
      PROMPT  &v_LDbugDate
      PROMPT
      PROMPT
      PROMPT Is this instance Multi Org
      PROMPT ===========================
      PROMPT  &v_MultiORGflag
      PROMPT
      PROMPT
      PROMPT Pay Action Parameter detail
      PROMPT ============================
      col PARAMETER_NAME     format a28
      col PARAMETER_VALUE    format a47
      select PARAMETER_NAME, PARAMETER_VALUE 
      from PAY_ACTION_PARAMETERS;

      PROMPT
      PROMPT
      PROMPT
      PROMPT
      PROMPT OTHER current patching levels
      PROMPT ==============================
      PROMPT  AD :  &v_ADbugDate
      PROMPT  AK :  &v_AKbugDate
      PROMPT  ALR:  &v_ALRbugDate
      PROMPT  AME:  &v_AMEbugDate
      PROMPT  ATG:  &v_ATGbugDate
      PROMPT  BNE:  &v_ADIbugDate
      PROMPT  CAC:  &v_CACbugDate
      PROMPT  EC :  &v_ECbugDate
      PROMPT  FIN:  &v_FINbugDate
      PROMPT  FND:  &v_FNDbugDate
      PROMPT  FRM:  &v_FRMbugDate
      PROMPT  HZ :  &v_HZbugDate
      PROMPT  JTA:  &v_JTAbugDate
      PROMPT  TXK:  &v_TXKbugDate
      PROMPT  UMX:  &v_UMXbugDate
      PROMPT  XDO:  &v_XDObugDate
      PROMPT
      PROMPT
       
      COLUMN app        format a49 heading 'Application Install Status'
      COLUMN appId      format a4  heading 'Id'
      COLUMN appStatus  format a15 heading 'Status' 
      COLUMN patch      format a11 heading 'Patch Level|(?=unknown)'   
      
      SELECT V.APPLICATION_NAME        app
           , to_char(V.APPLICATION_ID) appId
           , L.MEANING                 appStatus
           , DECODE(I.PATCH_LEVEL, NULL, 'R12.' || v.APPLICATION_SHORT_NAME || '.?', I.PATCH_LEVEL) patch
      FROM FND_APPLICATION_ALL_VIEW V, FND_PRODUCT_INSTALLATIONS I, FND_LOOKUPS L
      WHERE (V.APPLICATION_ID = I.APPLICATION_ID)
        AND (V.APPLICATION_ID IN 
            ('0','50','178','231','275','453','603','800','801','802','803','804','805','808','809','810'
             ,'821','8401','8301','8302','8303','8403','101','200'))
        AND (L.LOOKUP_TYPE = 'FND_PRODUCT_STATUS')
        AND (L.LOOKUP_CODE = I.Status )
      ORDER BY UPPER(APPLICATION_NAME); 
 
REM   =========================================================================
REM   Display Test Details
REM   =========================================================================






REM   =========================================================================
REM   PROFILE settings
REM   =========================================================================


PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT =======================================================================================
PROMPT PROFILE settings (FND_PROFILE_OPTIONS FND_PROFILE_OPTIONS_TL FND_PROFILE_OPTION_VALUES)
PROMPT =======================================================================================
PROMPT This section lists PROFILE settings 
PROMPT 
PROMPT 
PROMPT LEVEL_ID values   
PROMPT ============================
PROMPT  
PROMPT value 10001 = SITE
PROMPT value 10002 = APPLICATION
PROMPT value 10003 = RESPONSIBILITY
PROMPT  
PROMPT  
PROMPT  
PROMPT LEVEL_VALUE values   
PROMPT ============================
PROMPT  
PROMPT  800 = PER  (Human Resources)
PROMPT  801 = PAY  (Payroll)
PROMPT  804 = SSP
PROMPT  805 = BEN  (Oracle Advanced Benefits)
PROMPT  808 = OTM  (Time and Labor)
PROMPT  809 = OTL  (Time and Labor engine)
PROMPT  810 = OTA  (Learning Management)
PROMPT  833 = OTL  (Time and Labor)
PROMPT 8301 = GHR  (US Federal Human Resources)
PROMPT 8302 = PQH  (Public Sector Human Resources)
PROMPT 8303 = PQP  (Public Sector Payroll)
PROMPT 8401 = PSB  (Public Sector Budgeting)
PROMPT  
PROMPT  




REM   =========================================================================
REM   DateTrack:Enabled
REM   =========================================================================


COLUMN upon        format a40          heading 'User Profile Option Name'
COLUMN lid         format 999999999    heading 'Level ID'
COLUMN appid       format 99999        heading 'App ID'
COLUMN pov         format a18          heading 'Value'
COLUMN lv          format 99999        heading 'Level|Value'



select fpotl.USER_PROFILE_OPTION_NAME upon, 
             fpov.LEVEL_ID lid, 
             fpo.APPLICATION_ID appid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'Y','Yes',
DECODE(fpov.PROFILE_OPTION_VALUE,'N','No',
             fpov.PROFILE_OPTION_VALUE)) pov, 
             fpov.LEVEL_VALUE lv 
from FND_PROFILE_OPTIONS fpo, 
     FND_PROFILE_OPTIONS_TL fpotl, 
     FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpo.PROFILE_OPTION_NAME = 'DATETRACK:ENABLED' 
and   fpotl.PROFILE_OPTION_NAME = 'DATETRACK:ENABLED' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.PROFILE_OPTION_ID = 1208
and   fpov.LEVEL_ID IN (10001,10002) 
order by 1,2,3,5;




PROMPT
PROMPT
PROMPT

REM   =========================================================================
REM   HR:Cross Business Group
REM   =========================================================================


COLUMN upon        format a45          heading 'User Profile Option Name' 
COLUMN lid         format 999999999    heading 'Level ID' 
COLUMN pov         format a27          heading 'Value'


select fpotl.USER_PROFILE_OPTION_NAME upon, 
             fpov.LEVEL_ID lid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'Y','Yes',
DECODE(fpov.PROFILE_OPTION_VALUE,'N','No',
             fpov.PROFILE_OPTION_VALUE)) pov
from FND_PROFILE_OPTIONS fpo, 
           FND_PROFILE_OPTIONS_TL fpotl, 
           FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'HR_CROSS_BUSINESS_GROUP' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.LEVEL_ID IN (10001,10002);



SET PAGESIZE 0



REM   =========================================================================
REM   HR: Enable DTW4 defaulting
REM   =========================================================================


select fpotl.USER_PROFILE_OPTION_NAME upon, 
             fpov.LEVEL_ID lid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'Y','Yes',
DECODE(fpov.PROFILE_OPTION_VALUE,'N','No',
             fpov.PROFILE_OPTION_VALUE)) pov
from FND_PROFILE_OPTIONS fpo, 
           FND_PROFILE_OPTIONS_TL fpotl, 
           FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'PER_ENABLE_DTW4' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID
and   fpov.LEVEL_ID IN (10001,10002) 
and   fpotl.LANGUAGE = 'US' 
and   fpo.APPLICATION_ID = 800;




REM   =========================================================================
REM   HR: Local or Global Name Format
REM   =========================================================================


select fpotl.USER_PROFILE_OPTION_NAME upon, 
       fpov.LEVEL_ID lid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'G','Global Format',
DECODE(fpov.PROFILE_OPTION_VALUE,'L','Local Format',
       fpov.PROFILE_OPTION_VALUE)) pov
from FND_PROFILE_OPTIONS fpo, 
     FND_PROFILE_OPTIONS_TL fpotl, 
     FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'HR_LOCAL_OR_GLOBAL_NAME_FORMAT' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.LEVEL_ID IN (10001);



REM   =========================================================================
REM   HR: National Identifier Validation
REM   =========================================================================


select fpotl.USER_PROFILE_OPTION_NAME upon, 
       fpov.LEVEL_ID lid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'ERROR','Error on Fail',
DECODE(fpov.PROFILE_OPTION_VALUE,'NONE','No Validation',
DECODE(fpov.PROFILE_OPTION_VALUE,'WARN','Warning on Fail',
       fpov.PROFILE_OPTION_VALUE))) pov
from FND_PROFILE_OPTIONS fpo, 
     FND_PROFILE_OPTIONS_TL fpotl, 
     FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'PER_NATIONAL_IDENTIFIER_VALIDATION' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.LEVEL_ID IN (10001);



REM   =========================================================================
REM   HR: Use Title in Person's Full Name
REM   =========================================================================


select fpotl.USER_PROFILE_OPTION_NAME upon, 
             fpov.LEVEL_ID lid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'Y','Yes',
DECODE(fpov.PROFILE_OPTION_VALUE,'N','No',
             fpov.PROFILE_OPTION_VALUE)) pov
from FND_PROFILE_OPTIONS fpo, 
           FND_PROFILE_OPTIONS_TL fpotl, 
           FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'PER_USE_TITLE_IN_FULL_NAME' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.LEVEL_ID IN (10001,10002); 



REM   =========================================================================
REM   HR:User Type
REM   =========================================================================


select fpotl.USER_PROFILE_OPTION_NAME upon, 
       fpov.LEVEL_ID lid, 
DECODE(fpov.PROFILE_OPTION_VALUE,'INT','HR with Payroll User',
DECODE(fpov.PROFILE_OPTION_VALUE,'PAY','Payroll User',
DECODE(fpov.PROFILE_OPTION_VALUE,'PER','HR User',
       fpov.PROFILE_OPTION_VALUE))) pov
from FND_PROFILE_OPTIONS fpo, 
     FND_PROFILE_OPTIONS_TL fpotl, 
     FND_PROFILE_OPTION_VALUES fpov
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'HR_USER_TYPE' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.LEVEL_ID IN (10001);




REM   =========================================================================
REM   MO: Operating Unit
REM   =========================================================================


select fpotl.USER_PROFILE_OPTION_NAME upon,
             fpov.LEVEL_ID lid, 
             haou.NAME pov
from FND_PROFILE_OPTIONS fpo, 
           FND_PROFILE_OPTIONS_TL fpotl, 
           FND_PROFILE_OPTION_VALUES fpov, 
           HR_ALL_ORGANIZATION_UNITS haou
where fpotl.PROFILE_OPTION_NAME = fpo.PROFILE_OPTION_NAME 
and   fpotl.PROFILE_OPTION_NAME = 'ORG_ID' 
and   fpo.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
and   fpov.PROFILE_OPTION_VALUE = haou.ORGANIZATION_ID 
and   fpotl.LANGUAGE = 'US' 
and   fpov.LEVEL_ID IN (10001,10002); 




SET PAGESIZE 50




PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT =========================================================================
PROMPT Employee Numbering Details 
PROMPT =========================================================================
PROMPT
PROMPT =======================================================
PROMPT Global Numbering Profile 
PROMPT (FND_PROFILE_OPTIONS_VL and FND_PROFILE_OPTION_VALUES)
PROMPT =======================================================
PROMPT 
PROMPT for Global Numbering please see 
PROMPT NOTE : 259160.1
PROMPT Title: Step By Step Instructions For Implementing Global Sequencing 
PROMPT
PROMPT VERY IMPORTANT: Once a customer implements Global Numbering, they cannot go backwards 
PROMPT                 and revert back to Automatic or Manual Numbering via Business Group Info.
PROMPT                 They must continue to use Global Numbering. 
PROMPT 
PROMPT Values can be 
PROMPT
PROMPT   Y = Yes
PROMPT   N = No
PROMPT


       COLUMN nam      format a45    heading 'Profile Name'
       COLUMN lvl      format a5     heading 'Level'
       COLUMN val      format a24     heading 'Value'

       select fpovl.USER_PROFILE_OPTION_NAME nam, 
              decode(fpov.level_id, 10001, 'Site', 10002, 'Appl', 10003, 'Resp', 10004, 'User', 'None') lvl,
              fpov.PROFILE_OPTION_VALUE val
       from FND_PROFILE_OPTIONS_VL fpovl,   
            FND_PROFILE_OPTION_VALUES fpov
       where fpovl.PROFILE_OPTION_ID = fpov.PROFILE_OPTION_ID 
       and fpovl.PROFILE_OPTION_ID IN (1005697,1005696,1005701) 
       order by 1;



PROMPT
PROMPT
PROMPT
PROMPT 
PROMPT ===========================================
PROMPT Custom Number Generation Using FastFormula 
PROMPT (ALL_SOURCE and FF_FUNCTIONS_V)
PROMPT ===========================================
PROMPT 
PROMPT for Custom Number Generation Using FastFormula please see 
PROMPT NOTE : 279458.1
PROMPT Title: How To Implement Custom Person Numbering Using FastFormula
PROMPT 
PROMPT DISCLAIMER: 
PROMPT While this functionality was released by Oracle HR Development with 11i.HR_PF.H patch 3233333 
PROMPT any implementation making use of this feature is purely a Customization. 
PROMPT 
PROMPT Oracle Support Services 'will not support' these FF Fast Formulas nor the associated Functions. 
PROMPT It is up to the customer to create and diagnose any code used to implement this functionality.
PROMPT 
PROMPT This section searches for Custom NUMBER_GENERATION Packages and FF Fast Formulas on customer 
PROMPT instances to determine their existance.
PROMPT 


PROMPT 
PROMPT 
PROMPT 
PROMPT DOES A CUSTOM NUMBER GENERATION PACKAGE EXIST? 
PROMPT 

       select OWNER, NAME, TEXT
       from   ALL_SOURCE
       where  UPPER(NAME) like UPPER('%NUMBER_GENERATION%')
       and    OWNER = 'APPS'
       and    TEXT like '%$Header%'
       order  by NAME;


PROMPT 
PROMPT
PROMPT
PROMPT DOES A CUSTOM NUMBER GENERATION FF FAST FORMULA EXIST?
PROMPT 

       select * from FF_FUNCTIONS_V 
       where UPPER(DATA_TYPE) = UPPER('number') 
       and UPPER(DEFINITION) like UPPER('%NUM%GEN%');



PROMPT
PROMPT
PROMPT
PROMPT ====================================================================
PROMPT Business Group Info. ('Org Developer DF' descriptive flexfield)
PROMPT Employee / Applicant / Contingent Worker Number Generation segments
PROMPT (HR_ORGANIZATION_INFORMATION and HR_ALL_ORGANIZATION_UNITS)
PROMPT ====================================================================
PROMPT 
PROMPT Organization > Business Group > Business Group Info. > settings for 
PROMPT Employee Number Generation
PROMPT Applicant Number Generation
PROMPT Contingent Worker Number Generation
PROMPT
PROMPT Values found under columns Employee/Applicant/ContingentWorker Number Generation can be 
PROMPT
PROMPT   A = Automatic
PROMPT   M = Manual
PROMPT   N = National Identifier
PROMPT



       COLUMN nam          format a35         heading 'Organization Name               '
       COLUMN orgid        format 999999999   heading 'Org id    '
       COLUMN lcode        format a6          heading 'Legis-|lation|Code  '
       COLUMN appnum       format a7          heading 'App    |Number |Gen    '
       COLUMN cwknum       format a7          heading 'Conting|Worker |Number |Gen    '
       COLUMN empnum       format a7          heading 'Emp    |Number |Gen    '


       SELECT haou.NAME              nam
            , hoi.ORGANIZATION_ID    orgid
            , pbg.LEGISLATION_CODE   lcode
            , hoi.ORG_INFORMATION3   appnum
            , hoi.ORG_INFORMATION16  cwknum
            , hoi.ORG_INFORMATION2   empnum
       FROM HR_ORGANIZATION_INFORMATION hoi, 
            HR_ALL_ORGANIZATION_UNITS haou, 
            PER_BUSINESS_GROUPS pbg
       WHERE hoi.ORGANIZATION_ID = haou.ORGANIZATION_ID 
       and   pbg.ORGANIZATION_ID  = haou.ORGANIZATION_ID
       and hoi.ORG_INFORMATION_CONTEXT  = 'Business Group Information' 
       order by 1;



PROMPT
PROMPT
PROMPT 
PROMPT ===========================================================
PROMPT NEXT_VALUE for EMP / APL / CWK sorted by BUSINESS_GROUP_ID 
PROMPT (PER_NUMBER_GENERATION_CONTROLS)
PROMPT ===========================================================
PROMPT

       COLUMN bgid2    format 999999999   heading 'BG ID'
       COLUMN typ      format a10         heading 'TYPE'

       BREAK ON bgid2

       SELECT BUSINESS_GROUP_ID bgid2, 
              TYPE typ, 
              NEXT_VALUE 
       FROM PER_NUMBER_GENERATION_CONTROLS
       WHERE TYPE IN ('EMP','APL', 'CWK')
       order by 1,2;



PROMPT
PROMPT
PROMPT 
PROMPT =======================================
PROMPT MAX values for EMP / APL / NPW numbers
PROMPT =======================================
PROMPT


       COLUMN empnum    format a20    heading 'MAX EMP Number    '
       COLUMN appnum    format a20    heading 'MAX APL Number    '
       COLUMN npwnum    format a20    heading 'MAX NPW Number    '

       SELECT 
       MAX(TO_CHAR(employee_number))  empnum,
       MAX(TO_CHAR(applicant_number)) appnum,
       MAX(TO_CHAR(npw_number))       npwnum
       FROM PER_ALL_PEOPLE_F;



PROMPT
PROMPT
PROMPT
PROMPT
PROMPT =========================================================================
PROMPT end Employee Numbering Details 
PROMPT =========================================================================
PROMPT
PROMPT




PROMPT
PROMPT
PROMPT
PROMPT Language Details
PROMPT ================
PROMPT
PROMPT Installed Languages
REM PROMPT

      column "Language Code"   format A13
      column "Installed Flag"  format A14
      column "NLS Language"    format A35

      SELECT LANGUAGE_CODE  "Language Code",  
             INSTALLED_FLAG "Installed Flag",
             NLS_LANGUAGE   "NLS Language"
      FROM FND_LANGUAGES 
      where INSTALLED_FLAG in ('B','I')
      order by LANGUAGE_CODE;



PROMPT
PROMPT
PROMPT
PROMPT Legislation Details
PROMPT ===================
REM PROMPT
REM Installed legislations
      
      COLUMN legCode  format a29 heading 'Installed legislations|(Code)'
      COLUMN appName  format a25 heading 'Application'
      
      SELECT DECODE(legislation_code
                   ,null,'Global'
                   ,legislation_code)                legCode
           , DECODE(application_short_name
                   , 'PER', 'Human Resources'
                   , 'PAY', 'Payroll'
                   , 'GHR', 'Federal Human Resources'
                   , 'CM',  'College Data'
                   , application_short_name)          appName
      FROM hr_legislation_installations
      WHERE status = 'I'
      ORDER BY legislation_code;

REM      PROMPT
REM  New Legislation data installed during the last year - not all hrglobal patches deliver seed data.

      column date_of_import format a15 heading 'Date Imported'
      column PACKAGE_NAME   format a30 heading 'Package/Export Date'
      column legCode        format a15 heading 'Legislation'
      column status         format a10 heading 'Status'
 
      SELECT date_of_import
           , PACKAGE_NAME 
           , decode(legislation_code, NULL, 'Core', 'ZZ', 'Intl. Payroll',legislation_code) legCode
           , status
      FROM HR_STU_HISTORY
      WHERE TO_NUMBER(TO_CHAR(date_of_import, 'yyyy')) >= TO_NUMBER(TO_CHAR(SYSDATE, 'yyyy')) - 1
      ORDER BY 1 DESC;  
 
PROMPT
PROMPT
PROMPT
PROMPT hrglobal.drv details - Review Metalink Note 145837.1 for latest hrglobal patch.
PROMPT ====================

      COLUMN patchName      format a80 heading 'Version of current hrglobal.drv'
          
      SELECT * FROM ( 
          SELECT  adv.VERSION || ' installed by patch:' || ap.patch_name  || ' on ' || ap.CREATION_DATE patchName
          FROM AD_FILES af
             , AD_FILE_VERSIONS adv
             , ad_applied_patches ap
             , ad_patch_drivers pd
             , ad_patch_runs pr
             , ad_patch_run_bugs prb
             , ad_patch_run_bug_actions prba   
          WHERE af.FILE_ID = adv.FILE_ID
            AND af.file_id                 = prba.file_id
            AND prba.PATCH_FILE_VERSION_ID = adv.FILE_VERSION_ID
            AND prba.patch_run_bug_id      = prb.patch_run_bug_id  
            AND prb.patch_run_id           = pr.patch_run_id
            AND pr.patch_driver_id         = pd.patch_driver_id
            AND pd.applied_patch_id        = ap.applied_patch_id
            AND af.FILENAME = 'hrglobal.drv'
          ORDER BY VERSION desc	
      ) WHERE ROWNUM = 1;

      COLUMN LastSuccessfulRun  format a15 heading 'Date of last|Succesfull Run|of hrglobal.drv'
      COLUMN PatchOptions  format a13 heading 'adpatch|Options'

      SELECT pr.end_date             LastSuccessfulRun
           , pr.PATCH_ACTION_OPTIONS PatchOptions
      FROM ad_patch_runs pr
      WHERE pr.PATCH_TOP LIKE '%/per/12.0.0/patch/115/driver'
        AND pr.SUCCESS_FLAG = 'Y'
        AND pr.end_date =(
         SELECT MAX(pr.end_date)
         FROM ad_patch_runs pr
         WHERE pr.PATCH_TOP LIKE '%/per/12.0.0/patch/115/driver'
           AND pr.SUCCESS_FLAG = 'Y');
                                      
REM      PROMPT
REM DataInstaller - Legislations selected for Install

      COLUMN legCode  format a20 heading 'DataInstaller|Legisilations|Selected for Install'
      COLUMN asn      format a5  heading 'App'
      COLUMN action   format a10 heading 'Action'

      SELECT DECODE(hli.legislation_code
                   ,null,'Global'
                   ,hli.legislation_code)                legCode
           , hli.application_short_name                  asn
           , hli.action                                  action
      FROM user_views uv
         , hr_legislation_installations hli
      WHERE uv.view_name IN (SELECT view_name FROM hr_legislation_installations)
      AND uv.view_name = hli.view_name
      ORDER by legislation_code desc, application_short_name asc;
      
REM      PROMPT
REM Statutory Exceptions - To address rows listed here review Metalink Note:101351.1
     
      COLUMN table_name     format a25 heading 'Statutory Exceptions|on Table'
      COLUMN surrogate_id   format a10 heading 'Surrogate|ID'
      COLUMN true_key       format a10 heading 'True Key'
      COLUMN exception_text format a33 heading 'Exception Text|Review Note:101351.1'
      
      SELECT table_name
           , to_char(surrogate_id) surrogate_id
           , true_key
           , exception_text
      FROM hr_stu_exceptions;

PROMPT
PROMPT
PROMPT
PROMPT JIT/GEOCODE details
PROMPT ===================
REM Last JIT Installed
      
      COLUMN patchName   format A40 heading 'Last JIT Installed'
      COLUMN appliedDate format A12 heading 'Date Applied' 
      
      SELECT 'Patch:' || to_char(patch_number)
             || ' - ' ||  patch_name            patchName
           , applied_date          appliedDate
      FROM pay_patch_status
      WHERE (patch_name LIKE '%JIT%')
        AND status = 'C'
        AND applied_date IN 
           (SELECT MAX(applied_date) 
            FROM pay_patch_status 
            WHERE (patch_name LIKE '%JIT%')
              AND status = 'C');




PROMPT
PROMPT
PROMPT
PROMPT All released Geocode Patches and Installed Geocode Patches
PROMPT ===================
PROMPT  ANNUAL GEOCODE UPDATE - 2009  patch 8977291 &v_GeocodeDate2009
PROMPT
PROMPT



REM All Geocodes Installed
      
REM      COLUMN patchName   format A50 heading 'All Geocodes Installed'
REM      COLUMN geoUpdates  format 99999999 heading 'Geocodes|Updated'
REM      COLUMN appliedDate format A12 heading 'Date Applied' 

      
REM      SELECT 'Patch:' || decode(stat.patch_number, 9999999, 'Seeded', stat.patch_number)  
REM             || ' - ' || stat.patch_name             patchName
REM           , stat.applied_date           appliedDate
REM           , ( select count(mods.patch_name) from pay_us_modified_geocodes mods where mods.patch_name = stat.patch_name) geoUpdates
REM      FROM pay_patch_status stat
REM      WHERE stat.patch_name LIKE '%GEO%'
REM        AND status = 'C'
REM      ORDER BY applied_date desc;




PROMPT
PROMPT
PROMPT
PROMPT Database Parameters - Review Metalink Note 226987.1
PROMPT ===================
PROMPT If currently experiencing performance problems run bde_chk_cbo.sql from Metalink Note 174605.1
PROMPT to verify that all Mandatory Parameters (MP) are set correctly.
REM PROMPT
      
      COLUMN pName    format a20 heading 'Database Parameters'
      COLUMN pValue   format a79 heading 'Value'
      
      SELECT p.name pName, p.value pValue FROM v$parameter p
      WHERE p.name IN ('max_dump_file_size','timed_statistics'
	  ,'user_dump_dest','compatible','optimizer_mode'
	  ,'sql_trace','oracle_trace_enable','core_dump_dest'
	  ,'utl_file_dir','timed_os_statistics')
      ORDER BY p.name;



      PROMPT
      PROMPT
      PROMPT
      PROMPT Gather Schema Statistics
      PROMPT ========================
      
      COLUMN pReqId      format a10 heading 'Request|ID'       
      COLUMN pProg       format a15 heading 'Concurrent|Process'
      COLUMN parentReqId format a10 heading 'Parent'           
      COLUMN pStatus     format a10 heading 'Phase|Status'   
      COLUMN pParms      format a30 heading 'Parameters'       
      COLUMN pStartDate  format a6 heading 'Start|Date'       
      COLUMN pEndDate    format a6 heading 'End|Date'  
      COLUMN pMinutes    format a5 heading 'Dur.|(Min)'
            
      SELECT * FROM (
      SELECT TO_CHAR(request_id) pReqId
           , program pProg
	   , TO_CHAR(decode(fcrs.PARENT_REQUEST_ID,-1,null,fcrs.PARENT_REQUEST_ID)) parentReqId      
           , PHAS.MEANING || ' ' || STAT.MEANING pStatus 
           , fcrs.ARGUMENT_TEXT pParms
           ,REQUESTED_START_DATE pStartDate 
           ,ACTUAL_COMPLETION_DATE pEndDate
           , to_char(round((fcrs.ACTUAL_COMPLETION_DATE - fcrs.REQUESTED_START_DATE) * 1440)) pMinutes
      FROM FND_CONC_REQ_SUMMARY_V fcrs
         , FND_LOOKUPS STAT
         , FND_LOOKUPS PHAS
      WHERE STAT.LOOKUP_CODE = FCRS.STATUS_CODE
        AND STAT.LOOKUP_TYPE = 'CP_STATUS_CODE'
        AND PHAS.LOOKUP_CODE = FCRS.PHASE_CODE
        AND PHAS.LOOKUP_TYPE = 'CP_PHASE_CODE'
        AND UPPER(program) LIKE 'GATHER%'
        AND substr(UPPER(ARGUMENT_TEXT),1,3) in ('HR,','ALL')
      ORDER BY 1 desc)
      where rownum < 2;

PROMPT
PROMPT
PROMPT
PROMPT Invalid Objects and Disabled Triggers - Use adadmin to compile apps schema to resolve these objects.
PROMPT =====================================
REM PROMPT
      
      COLUMN owner          format a10 heading 'Owner'
      COLUMN object_type    format a25 heading 'Type'
      COLUMN object_name    format a35 heading 'Invalid Object'
      BREAK ON owner ON object_type

      SELECT owner, object_type,  object_name
      FROM dba_objects
      WHERE status != 'VALID'
      AND object_type != 'UNDEFINED'
      ORDER BY 1, 2, 3;
     
      COLUMN owner           format a10 heading 'Owner'
      COLUMN TABLE_NAME      format a30 heading 'Table'
      COLUMN trigger_name    format a35 heading 'Disabled Triggers'
      BREAK ON owner ON table_name

      SELECT OWNER, TABLE_NAME, TRIGGER_NAME 
      FROM dba_triggers
      WHERE status = 'DISABLED'
	  AND TABLE_OWNER IN ('HR','HXT','HXC','HRI','BEN')
      ORDER BY 1, 2, 3;



PROMPT
PROMPT
PROMPT
PROMPT  =========================================================================
PROMPT  CHECK FOR STATUS OF 'WHO' TRIGGERS for the following HR owned tables:
PROMPT  =========================================================================
PROMPT   'HR_ALL_ORGANIZATION_UNITS'
PROMPT   'HR_ALL_ORGANIZATION_UNITS_TL'
PROMPT   'HR_ALL_POSITIONS_F'
PROMPT   'HR_ALL_POSITIONS_F_TL'
PROMPT   'HR_LOCATIONS_ALL'
PROMPT   'HR_LOCATIONS_ALL_TL'
PROMPT   'PER_ADDRESSES'
PROMPT   'PER_ALL_ASSIGNMENTS_F'
PROMPT   'PER_ALL_PEOPLE_F'
PROMPT   'PER_ALL_POSITIONS'
PROMPT   'PER_JOBS'
PROMPT   'PER_JOBS_TL'
PROMPT   'PER_PERIODS_OF_SERVICE'
PROMPT

REM PROMPT
      COLUMN owner          format a8  heading 'Owner'
      COLUMN trigger_name   format a31 heading 'Trigger Name'
      COLUMN table_name     format a30 heading 'Table Name'
      COLUMN status         format a8  heading 'Status'
      BREAK ON owner ON table_name
      select OWNER, 
             TABLE_NAME,
             TRIGGER_NAME, 
             STATUS 
      from all_triggers 
      where UPPER(table_name) in 
         ( 'PER_ALL_PEOPLE_F'
         , 'PER_ALL_ASSIGNMENTS_F'
         , 'PER_PERIODS_OF_SERVICE'
         , 'PER_PERSON_TYPE_USAGES_F'
         , 'PER_ADDRESSES'
         , 'HR_LOCATIONS_ALL'
         , 'HR_LOCATIONS_ALL_TL'
         , 'HR_ALL_ORGANIZATION_UNITS'
         , 'HR_ALL_ORGANIZATION_UNITS_TL'
         , 'HR_ALL_POSITIONS_F'
         , 'HR_ALL_POSITIONS_F_TL'
         , 'PER_ALL_POSITIONS'
         , 'PER_JOBS'
         , 'PER_JOBS_TL')
      and TRIGGER_NAME like '%WHO%' 
      order by table_name, trigger_name;



PROMPT
PROMPT
PROMPT
PROMPT  =========================================================================
PROMPT  CHECK FOR STATUS OF 'OVN' TRIGGERS for all HR and PER owned tables:
PROMPT  =========================================================================
PROMPT  
PROMPT  
PROMPT  

REM PROMPT
      COLUMN owner          format a8  heading 'Owner'
      COLUMN trigger_name   format a31 heading 'Trigger Name'
      COLUMN table_name     format a30 heading 'Table Name'
      COLUMN status         format a8  heading 'Status'
      BREAK ON owner ON table_name
      select OWNER, 
             TABLE_NAME,
             TRIGGER_NAME, 
             STATUS 
      from all_triggers 
      where OWNER = 'APPS'
      and trigger_name like 'HR%OVN%' 
      or  trigger_name like 'PER%OVN%'
      order by owner, table_name;



PROMPT
PROMPT
PROMPT
PROMPT  =========================================================================
PROMPT  v$parameter settings for Instance Name = &v_sid
PROMPT  =========================================================================
PROMPT  
PROMPT  
PROMPT  


        COLUMN NAME       format a33    heading 'Name'
        COLUMN VALUE      format a42    heading 'Value'

        select NAME, VALUE 
        from   v$parameter
        order  by name;




REM   =========================================================================
REM   BUSINESS GROUP output
REM   =========================================================================

      PROMPT
      PROMPT
      PROMPT
      PROMPT
      PROMPT Business Group Details (HR_ALL_ORGANIZATION_UNITS )
      PROMPT ====================================================
      PROMPT This section lists the Business Group details for each owning Organization
      PROMPT


      COLUMN BUSINESS_GROUP_ID  format 999999      heading 'Bus|Grp|id '
      COLUMN ORGANIZATION_ID    format 999999      heading 'Org|id '
      COLUMN NAME               format a34         heading 'Organization Name'
      COLUMN LEGISLATION_CODE   format a6          heading 'Legis-|lation|Code  '
      COLUMN ENABLED_FLAG       format a4          heading 'Enab|-led|Flag'
      COLUMN DATE_FROM          format a11         heading 'Date From'
      COLUMN DATE_TO            format a11         heading 'Date To'



      select haou.BUSINESS_GROUP_ID, 
             haou.ORGANIZATION_ID, 
             haou.NAME, 
             pbg.LEGISLATION_CODE, 
             pbg.ENABLED_FLAG, 
             pbg.DATE_FROM, 
             pbg.DATE_TO
      from HR_ALL_ORGANIZATION_UNITS haou, 
           PER_BUSINESS_GROUPS pbg
      where haou.ORGANIZATION_ID = haou.BUSINESS_GROUP_ID 
      and   pbg.ORGANIZATION_ID  = haou.ORGANIZATION_ID
      order by haou.BUSINESS_GROUP_ID;




      PROMPT
      PROMPT
      PROMPT
      PROMPT
      PROMPT Business Group sub-Organizations and Classification Details 
      PROMPT      (HR_ALL_ORGANIZATION_UNITS and HR_ORGANIZATION_INFORMATION_V)
      PROMPT ===========================================================================
      PROMPT This section lists the Business Groups and the attached sub-Organizations 
      PROMPT and their Classifications and Statuses
      PROMPT


      COLUMN orgid        format 999999    heading 'OrgID'
      COLUMN bgid         format 999999    heading 'BG ID'
      COLUMN name1        format a29       heading 'Organization Name'
      COLUMN orginf1      format a28       heading 'Classifications'
      COLUMN orginf2      format a04       heading 'Enab|-led'


      BREAK ON bgid ON orgid ON name1


      select hou.BUSINESS_GROUP_ID bgid,
             hou.ORGANIZATION_ID orgid,
             hou.NAME name1,
             hoiv.ORG_INFORMATION1_MEANING orginf1,
             hoiv.ORG_INFORMATION2_MEANING orginf2
      from HR_ALL_ORGANIZATION_UNITS hou, 
           HR_ORGANIZATION_INFORMATION_V hoiv
      where hou.ORGANIZATION_ID = hoiv.ORGANIZATION_ID 
      and hoiv.ORG_INFORMATION1_MEANING IS NOT NULL 
      order by hou.BUSINESS_GROUP_ID, hou.ORGANIZATION_ID, hoiv.ORG_INFORMATION1_MEANING; 




PROMPT
PROMPT
PROMPT
PROMPT
REM   =========================================================================
REM   Display Test Footer
REM   =========================================================================

      COLUMN dateRun NEW_VALUE v_date NOPRINT
      SELECT TO_CHAR(SYSDATE,'DD-Mon-YYYY HH24:MI:SS') dateRun FROM DUAL;
      
      COLUMN elapsedTime NEW_VALUE v_time NOPRINT
      SELECT LTRIM(TO_CHAR(TO_NUMBER(TO_CHAR(SYSDATE,'SSSSS')) - &v_start)) elapsedTime FROM DUAL;
      
      PROMPT Summary of &v_fileName
      PROMPT ======================================================================
      PROMPT Date         = &v_date
      PROMPT Elapsed Time = &v_time seconds
      PROMPT
      PROMPT
      PROMPT For support issues, please log an iTar (Service Request).
      PROMPT
      PROMPT ======================================================================
      PROMPT ======================================================================
      PROMPT
      PROMPT
      PROMPT
      PROMPT instance &v_sid FORMS VERSION
      PROMPT =================================
      PROMPT



REM   =========================================================================
REM   Stop Spooling and Display Review Spool file message
REM   =========================================================================

REM   SET &v_setMarkupOff

      SPOOL OFF
      SET TERMOUT ON;
      
      PROMPT
      PROMPT =============================================================================
      PROMPT Please review the output file: &v_spoolFile
      PROMPT 
REM   PROMPT Please review the output file: HRMS12_output_file.txt
      PROMPT
      PROMPT =============================================================================
      PROMPT

REM   =========================================================================
REM   UNDEFINE Generic Test Variables used in all tests
REM   =========================================================================

      UNDEFINE            v_appVer
      UNDEFINE              v_char
      UNDEFINE            v_dbComp
      UNDEFINE             v_dbVer
      UNDEFINE          v_fileName
      UNDEFINE          v_HRStatus
      UNDEFINE   v_inputParameters
      UNDEFINE        v_lastUpdate
      UNDEFINE              v_lang
      UNDEFINE       v_legislation
      UNDEFINE         v_PayStatus
      UNDEFINE         v_PFbugDate
      UNDEFINE          v_platform
      UNDEFINE           v_product
      UNDEFINE            v_server
REM   UNDEFINE      v_setMarkupOff
REM   UNDEFINE       v_setMarkupOn
      UNDEFINE              v_ssdt
      UNDEFINE               v_sid
      UNDEFINE            v_crtddt
REM   UNDEFINE         v_spoolFile
      UNDEFINE    v_sqlplusVersion
      UNDEFINE          v_testDate      
      UNDEFINE          v_testDesc
      UNDEFINE    v_testNoteNumber
      UNDEFINE          v_userName
      UNDEFINE v_validAppsVersions
      UNDEFINE         v_wfVersion
      UNDEFINE        v_ATGbugDate
      UNDEFINE        v_TXKbugDate
      UNDEFINE        v_ALRbugDate
      UNDEFINE        v_XDObugDate
      UNDEFINE        v_CACbugDate
      UNDEFINE        v_UMXbugDate
      UNDEFINE         v_AKbugDate
      UNDEFINE        v_JTAbugDate
      UNDEFINE         v_ECbugDate
      UNDEFINE      v_MultiORGflag
      UNDEFINE        v_FNDbugDate
      UNDEFINE         v_ADbugDate
      UNDEFINE         v_HZbugDate
      UNDEFINE        v_FINbugDate
      UNDEFINE        v_ADIbugDate
      UNDEFINE        v_IRCbugDate
      UNDEFINE         v_LDbugDate
      UNDEFINE        v_OLMbugDate
      UNDEFINE        v_FRMbugDate
      UNDEFINE        v_AMEbugDate
      UNDEFINE       v_GeocodeDate
      UNDEFINE   v_GeocodeDate2009



REM   =========================================================================
REM   Reset SQL PLUS Environment Variables
REM   =========================================================================

      SET FEEDBACK ON
      SET VERIFY   ON
      SET TIMING   ON
      SET ECHO     ON


REM   =========================================================================
REM   append frmbld to display instance FORMS VERSION
REM   =========================================================================


!frmbld \? | grep Forms | grep Version | awk '{print $6}' >> &v_spoolFile


EXIT