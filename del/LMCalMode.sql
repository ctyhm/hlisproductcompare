prompt Importing table LMCalMode...
set feedback off
set define off
insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099000', '10099000', 'P', 'select (case when ''?ReneWal?''=''S'' then 0.95 else 1 end)*(case when ?Get? > 20000 then (((select prem from rt_0990 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 20000) + (select (?Get? - 20000) / 1000 * prem from rt_0990 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 99999)) * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'')) else (select prem * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'') from rt_0990 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = ?Get?) end)  from dual', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099063', '10099000', 'V', 'SELECT CASE WHEN (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) <> ''10126000'' then 1 else (select case when ''?Amnt?'' > 20000 then (select 1 from lcpol where prem >= 200 and contno = ''?contno?'' and polno = ''?mainpolno?'' and riskcode = ''10126000'') else 1 end from dual) END FROM dual', '�Ҹ���ӯӯ���������˺����գ�2013�����Ѵﵽ200Ԫ�ģ���Ͷ���Ҹ�סԺ���ò���ҽ�Ʊ��ջ������ս��2��Ԫ����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099002', '10099000', 'P', 'SELECT (select suppriskscore from lcprem  where polno=''?PolNo?'' AND dutycode=''?DutyCode?'' AND payplancode=''?PayPlanCode?'')/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '�����ӷѱ�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099020', '10099000', 'V', 'select case when ?Amnt? between 3000 and 50000 then (select case when mod(?Amnt?, 1000) = 0 then 1 else null end from dual) else null end from dual', 'Ͷ��������ÿ��Ͷ��������ͻ������ս��Ϊ3000Ԫ������3000Ԫ�ı��ս�����Ϊ1000Ԫ������������߻������ս������Ϊ5��Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099021', '10099000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then 1 else (select 1 from lcpol where payintv = ''12'' and polno = mainpolno and contno = ''?contno?'' and riskcode in (select riskcode from lmriskapp where riskperiod = ''L'' and riskcode = lcpol.riskcode )) end from dual', '1�����������ս��ѷ�ʽΪ�ڽ�ʱ�����뱾�����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099023', '10099000', 'V', 'select case when ((select riskcode from lcpol where contno=''?contno?'' and polno=mainpolno) = ''10012000'') then (SELECT CASE WHEN (''?AppAge?'' >= 18) THEN (select 1 from lcpol where prem >= 100 and riskcode = ''10012000'' and contno = ''?contno?'') ELSE (select 1 from lcpol where prem >= 50 and riskcode = ''10012000'' and contno = ''?contno?'') END FROM dual) else 1 end from dual', '�������ˡ�18���꣬ÿ��Ͷ�����Ҹ���ӯӯ���������˺� 
���ձ��շѴﵽ100Ԫ�ģ������뱾����������ۣ�
�������ˣ�18���꣬ÿ��Ͷ�����Ҹ���ӯӯ���������˺� 
���ձ��շѴﵽ50Ԫ�ģ������뱾�����������
');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099024', '10099000', 'V', 'select case when ''''?Amnt?'''' > 20000 then (select 1 from lcpol where prem >= 200 and contno = ''''?contno?'''' and polno = ''''?mainpolno?'''' and riskcode in (''''10012000'''',''''10126000'''')) else 1 end from dual', 'ÿ��Ͷ�����Ҹ���ӯӯ���������˺����ձ��շѴﵽ200Ԫ�ģ������ַ���Ͷ���������ս��2��Ԫ����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099030', '10099000', 'U', 'select case when ?Get? > 20000 then (select 1 from lcpol where InsuredAppAge between 46 and 50 and polno = ''?polno?'') else 0 end from dual', '������������46��������50�����������ڼ䣬��������ֵĻ������ս�����2��Ԫ������죬Ӧ�������ĿA+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099031', '10099000', 'U', 'select 1 from lcpol where InsuredAppAge>=51 and polno=''?polno?''', '������������ڵ���51���꣬����죬Ӧ�������ĿA+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099032', '10099000', 'U', 'select 1 from lcpol where riskcode = ''10099000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum=1', 'ÿһ�����������ҹ�˾ֻ��Ͷ��һ�ݡ��Ҹ�סԺ���ò���ҽ�Ʊ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099033', '10099000', 'U', 'select 1 from lcpol where riskcode in( ''10018000'',''10040000'') and (appflag = 1 or (appflag in (''0'',''2'') and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1', 'ÿһ�������˲���ͬʱִ���ҹ�˾���Ҹ�����סԺ���ò���ҽ�Ʊ��ա������Ҹ�����סԺ���ò���ҽ�Ʊ��գ�2009���������Ҹ�סԺ���ò���ҽ�Ʊ��ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099034', '10099000', 'U', 'select case when not exists (select * from lpedoritem where edorno = ''?EdorNo?'' and edortype <> ''NS'') then (select distinct 1 from lcinsured where insuredno=''?InsuredNo?'' and ?Get?>20000 and (occupationcode in (''2147002'',''2147003'',''1700001'',''1201002'' ) or ?appage?<18)) else (select distinct 1 from lpinsured where insuredno=''?InsuredNo?'' and edorno=''?EdorNo?'' and ?Get?>20000 and (occupationcode in (''2147002'',''2147003'',''1700001'',''1201002'' ) or ?appage?<18)) end from dual', 'δ�����ˡ���ҵ��Ա��������Ա����ͥ��������Уѧ�����Ͷ���������ս��ó���20000Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099035', '10099000', 'U', 'select case when not exists (select * from lpedoritem where edorno = ''?EdorNo?'' and edortype <> ''NS'') then (select distinct 1 from lcappnt where contno=''?contno?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) else (select distinct 1 from lpappnt where contno=''?contno?'' and edorno=''?EdorNo?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) end from dual', 'ҽ��ϵͳ��ҵ��Ա��ΪͶ���˵ģ����Ͷ���������ս��ó���20000Ԫ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099022', '10099000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in ( ''10012000'',''10126000'')  then 1 else (select case when ?Amnt? > 20000 then (select case when prem >= 4000 then 1 else null end from lcpol where polno = mainpolno and contno = ''?contno?'') else 1 end from dual) end from dual', '1������������ÿ��Ͷ�������ڽ����շѴﵽ4000Ԫ�ģ������ַ���Ͷ���������ս��2��Ԫ����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099036', '10099000', 'U', 'select case when not exists (select * from lpedoritem where edorno = ''?EdorNo?'' and edortype <> ''NS'') then (select distinct 1 from lcinsured where insuredno = ''?InsuredNo?''and contno=''?contno?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) else (select distinct 1 from lpinsured where insuredno = ''?InsuredNo?''and contno=''?contno?'' and edorno=''?EdorNo?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) end from dual', 'ҽ��ϵͳ��ҵ��Ա��Ϊ�������˵ģ����Ͷ���������ս��ó���20000Ԫ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099037', '10099000', 'U', 'select 1 from lcpol where polno=''?polno?'' and insuredappage>64', '����ʱ�����������䲻�ܳ���64����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099040', '10099000', 'E', 'select(''?NewPrem?'' - ''?Prem?'')*(1-(to_date(''?EdorValiDate?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365) from dual', 'ְҵ�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099041', '10099000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else (select round((select prem from lcpol where polno = ''?PolNo?'')*0.65*(1 - (to_date(''?ZTPoint?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365),2)+round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) from dual) end from dual', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099042', '10099000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?''  and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) end from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099043', '10099000', 'E', 'select (''?NewPrem?''-''?Prem?'') from dual', '�ͻ���Ҫ���ϱ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT0990', '10099000', 'V', 'select case when ?Amnt? between 3000 and 50000 then (select case when mod(?Amnt?, 1000) = 0 then 1 else 0 end from dual) 1 else 0 end from dual', 'Ͷ��������ÿ��Ͷ��������ͻ������ս��Ϊ3000Ԫ������3000Ԫ�ı��ս�����Ϊ1000Ԫ������������߻������ս������Ϊ5��Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0137', '10099000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=30) and ''?GetDutyKind?'' like ''2%'')then 0 else 1 end from dual', '�Ҹ�סԺ���ò���ҽ�Ʊ����б��������Ա���ͬ��Ч֮����30����(��30��)���ּ�������ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0138', '10099000', 'C', 'select case when  to_date(''?EndFeeDate?'',''YYYY-MM-DD'')<(select getenddate from lcget where polno=''?PolNo?'' and getdutycode in (''099040'',''099041'')) then 1 else 0 end from dual', '�������˾�ҽԺ��ϱ���סԺ���ƣ��������պ�ͬ����������δ��������ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099050', '10099000', 'C', 'SELECT CASE WHEN PATIENTDATE BETWEEN to_date(''?CVALIDATE?'') AND to_date(''?LCGETENDDATE?'') then ?JE_GF? ELSE 0 END FROM (SELECT A.FEEDATE PATIENTDATE FROM LLFEEMAIN A, LLCASERECEIPT B WHERE A.CLMNO = B.CLMNO AND A.MAINFEENO = B.MAINFEENO AND A.FEETYPE = B.FEEITEMTYPE AND A.CLMNO = ''?CaseNo?'' AND A.CUSTOMERNO = ''?CustomerNo?'' AND A.FEETYPE = ''A'' AND B.FEEDETAILNO = ''?DutyFeeStaNo?'' and exists ( SELECT 1 FROM LLFEEMAIN WHERE CUSTOMERNO = ''?CustomerNo?'' AND FEETYPE = ''B'' AND EXISTS (SELECT * FROM LLAPPCLAIMREASON WHERE CASENO = LLFEEMAIN.CLMNO AND CUSTOMERNO = ''?CustomerNo?'' AND REASONCODE = ''?GetDutyKind?'') and not exists (select 1 from llregister where rgtno = LLFEEMAIN.clmno and clmstate = ''70'') and A.FEEDATE between ( HOSPSTARTDATE - 7 ) and (HOSPendDATE + 7)))', '�ż����˵�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099051', '10099000', 'C', 'select ?Je_gf? from dual', '�˵�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099052', '10099000', 'C', 'select ?GetRate?*?Je_gf? from dual', '������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099053', '10099000', 'C', 'select ?Get?*0.1 from dual', 'סԺǰ�����ż�����ñ��ս𲻳���Լ���Ļ������ս���10%');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099060', '10099000', 'C', 'select case when ?GetRate? =''0.0'' then (least(((?Je_gf?-?BSocPay?)*0.7),(?BSumFee?-?BSocPay?-?BOthPay?))) else  (least(((?Je_gf?-?BSocPay?)*?GetRate?),(?BSumFee?-?BSocPay?-?BOthPay?))) end from dual', 'סԺ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099061', '10099000', 'C', 'select case when ?GetRate? =''0.0'' then (least(((?Je_gf?-?ASocPay?)*0.7),(?ASumFee?-?ASocPay?-?AOthPay?))) else  (least(((?Je_gf?-?ASocPay?)*?GetRate?),(?ASumFee?-?ASocPay?-?AOthPay?))) end from dual', '�������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099062', '10099000', 'V', 'select case when ((select riskcode from lcpol where contno=''?contno?'' and polno=mainpolno) = ''10126000'') then (SELECT CASE WHEN (''?AppAge?'' >= 18) THEN (select 1 from lcpol where prem >= 100 and riskcode = ''10126000'' and contno = ''?contno?'') ELSE (select 1 from lcpol where prem >= 50 and riskcode = ''10126000'' and contno = ''?contno?'') END FROM dual) else 1 end from dual', '�������ˡ�18���꣬�Ҹ���ӯӯ���������˺����գ�2013�����շѴﵽ100Ԫ�ģ���Ͷ�������գ��������ˣ�18���꣬�Ҹ���ӯӯ���������˺����գ�2013�����շѴﵽ50Ԫ�ģ���Ͷ�������ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099001', '10099000', 'P', 'SELECT standprem*?SuppRiskScore?/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164035', '10164000', 'U', 'SELECT CASE WHEN 1 IN (SELECT 1 FROM LCAPPNT WHERE APPNTNO = ''?AppntNo?'' AND OCCUPATIONCODE IN (''1001001'', ''1001002'', ''1001003'', ''1001008'', ''1001009'', ''1001010'', ''1001011'', ''1001012'', ''1001013'', ''1001014'', ''1001015'', ''1002001'', ''1002002'', ''1002003'', ''1002004'', ''1002005'', ''1002006'', ''1002007'')) THEN (SELECT CASE WHEN SUM(MULT) > 10 THEN 1 ELSE 0 END FROM LCPOL WHERE APPFLAG IN (''0'', ''1'') AND UWFLAG NOT IN (''a'', ''1'', ''2'') AND RISKCODE = ''10164000'' AND insuredno = ''?InsuredNo?'') ELSE 0 END FROM DUAL', 'ҽ��ϵͳ��ҵ��Ա��ΪͶ���ˣ����������������Ͷ������סԺ����ҽ�Ʊ���10��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164036', '10164000', 'U', 'SELECT CASE WHEN 1 IN (SELECT 1 FROM lcinsured WHERE insuredno = ''?InsuredNo?'' AND OCCUPATIONCODE IN (''1001001'', ''1001002'', ''1001003'', ''1001008'', ''1001009'', ''1001010'', ''1001011'', ''1001012'', ''1001013'', ''1001014'', ''1001015'', ''1002001'', ''1002002'', ''1002003'', ''1002004'', ''1002005'', ''1002006'', ''1002007'')) THEN (SELECT CASE WHEN SUM(MULT) > 10 THEN 1 ELSE 0 END FROM LCPOL WHERE APPFLAG IN (''0'', ''1'') AND UWFLAG NOT IN (''a'', ''1'', ''2'') AND RISKCODE = ''10164000'' AND insuredno = ''?InsuredNo?'') ELSE 0 END FROM DUAL', 'ҽ��ϵͳ��ҵ��Ա��Ϊ�������ˣ����������������Ͷ������סԺ����ҽ�Ʊ���10��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164037', '10164000', 'U', 'select 1 from lcpol where polno=''?polno?'' and insuredappage>64', '����ʱ�����������䲻�ܳ���64����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164041', '10164000', 'U', 'select distinct 1 from lcinsured where insuredno = ''?InsuredNo?'' and occupationcode = ''2147002'' and contno = ''?ContNo?''', '��������Ϊ��ҵ��Ա�����ܳб�����סԺ����ҽ�Ʊ��ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164042', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE ''?AppAge?''<18 AND appflag in (''0'',''1'') and UWFlag not in (''a'',''1'',''2'') AND riskcode=''10164000'' AND insuredno=''?InsuredNo?''', '��������Ϊδ�����ˣ�����סԺ����ҽ�Ʊ������Ͷ��10�ݡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164011', '10164000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) end from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164040', '10164000', 'U', 'select case when exists (select 1 from lcpol where polno = mainpolno and contno = ''?contno?'' and prem >= 6000) then (select case when substr(''?ManageCom?'', 0, 4) in (''8601'', ''8610'', ''8624'', ''8611'', ''8612'', ''8637'' ,''8623'') then (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 30 then 0 else 1 end from dual) else (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 20 then 0 else 1 end from dual) end from dual) else 0 end from dual', '�����ڽ����ڵ���6000Ԫ���ڱ������Ϻ������ڣ����ݣ����գ��㽭���������Ͷ��30�ݣ�����30���������������Ͷ��20�֣�����20��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164043', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE appflag in (''0'', ''1'') and UWFlag not in (''a'', ''1'', ''2'') AND riskcode = ''10164000'' AND insuredno IN (SELECT DISTINCT insuredno FROM lcinsured WHERE insuredno = ''?InsuredNo?'' and occupationcode IN(''2147003''))', '��������Ϊ������Ա������סԺ����ҽ�Ʊ������Ͷ��10�ݡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164044', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE appflag in (''0'', ''1'') and UWFlag not in (''a'', ''1'', ''2'') AND riskcode = ''10164000'' AND insuredno IN (SELECT DISTINCT insuredno FROM lcinsured WHERE insuredno = ''?InsuredNo?'' and occupationcode IN(''1700001''))', '��������Ϊ��ͥ����������סԺ����ҽ�Ʊ������Ͷ��10�ݡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164010', '10164000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else (select round((select prem from lcpol where polno = ''?PolNo?'')*0.65*(1 - (to_date(''?ZTPoint?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365),2)+round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) from dual) end from dual', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164013', '10164000', 'E', 'select(''?NewPrem?'' - ''?Prem?'')*(1-(to_date(''?EdorValiDate?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365) from dual', 'ְҵ�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0164', '10164000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=30) and ''?GetDutyKind?'' =''208'')then 0 else 1 end from dual', '�Ҹ�����סԺ����ҽ�Ʊ����б��������Ա���ͬ��Ч֮����30����(��30��)���ּ�������ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0165', '10164000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=90) and ''?GetDutyKind?'' =''208'' and ''?GetDutyCode?'' =''164041'')then 0 else 1 end from dual', '�Ҹ�����סԺ����ҽ�Ʊ����б��������Ա���ͬ��Ч֮����90����(��90��)���ּ�������ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164050', '10164000', 'C', 'select least(180 * ?Oamnt?- (select lcget.summoney from lcget where polno = ''?Polno?'' and dutycode = ''?DutyCode?'' and insuredno = ''?insuredno?''and GetDutyCode =''?GetDutyCode?''),?je_gf?) from dual
', '����סԺ�ն���������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164051', '10164000', 'C', 'select ?Oamnt?*least(least((case when ?InPeriodDays? = 0 then 0 else ?InPeriodDays?+30 end), ?DaysInHos?),90) from dual', '����סԺ�ն�����˵����㹫ʽ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164052', '10164000', 'C', 'select least(180 * ?Oamnt?- (select lcget.summoney from lcget where polno = ''?Polno?'' and dutycode = ''?DutyCode?'' and insuredno = ''?insuredno?''and GetDutyCode =''?GetDutyCode?''),?je_gf?) from dual
', '����סԺ�ն���������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164053', '10164000', 'C', 'select ?Oamnt?*least(least((case when ?InPeriodDays? = 0 then 0 else ?InPeriodDays?+30-3 end), (case when ?DaysInHos?-3 > 0 then ?DaysInHos?-3 else 0 end )),90) from dual', '����סԺ�ն�����˵����㹫ʽ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164054', '10164000', 'C', 'select least(180 * ?Oamnt?- (select lcget.summoney from lcget where polno = ''?Polno?'' and dutycode = ''?DutyCode?'' and insuredno = ''?insuredno?''and GetDutyCode =''?GetDutyCode?''),?je_gf?) from dual
', '�ش󼲲�סԺ�ն���������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164055', '10164000', 'C', 'select ?Oamnt?*least((case when ?InPeriodDays? = 0 then 0 else ?InPeriodDays?+30 end), ?DaysInHos?) from dual', '�ش󼲲�סԺ�ն�����˵����㹫ʽ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164056', '10164000', 'C', 'select case when (select count(*) from llallowance where  allowtype = ''A'' and allowitemcode in (''PA001'',''PA002'',''PA003'',''PA004'',''PA005'',''PA006'',''PA007'',''PA008'',''PA009'',''PA010'',''PA011'',''PA012'',''PA013'',''PA014'',''PA015'',''PA016'',''PA017'',''PA018'',''PA019'',''PA020'',''PA021'',''PA022'',''PA023'',''PA024'',''PA025'',''PA026'',''PA027'',''PA028'',''PA029'',''PA030'') and  clmno = ''?CaseNo?'' and caseno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' ) = 0 then 0 else 1 end from dual', '�ش󼲲�סԺ�ն���������㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164061', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select count(1) from lcpol where riskcode = ''10164000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', 'ÿһ�����������ҹ�˾ֻ��Ͷ��һ�ݡ��Ҹ�����סԺ����ҽ�Ʊ��ա��������ظ�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164062', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select 1 from lcpol where riskcode in (''10038000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', 'ÿһ�������˲���ͬʱ�����ҹ�˾���Ҹ�����סԺ����ҽ�Ʊ��ա������Ҹ�����סԺ����ҽ�Ʊ��ա��������ظ�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164063', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (SELECT DISTINCT 1 FROM lcpol WHERE paytodate >= payenddate AND conttype = ''1''  AND polno =mainpolno and payintv = ''12'' and contno = ''?ContNo?'') = 1 then null else 1 end from dual) else 1 end from dual', '1�����������ս�����������������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164067', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL  ) else (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL) end from dual', '�������ˡ�18���꣬ÿ��Ͷ�����Ҹ���ӯӯ2013���������˺����ձ��շѴﵽ100Ԫ�ģ������뱾�����������.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164068', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end from  dual', '��������<18���꣬ÿ��Ͷ�����Ҹ���ӯӯ2013���������˺����ձ��շѴﵽ50Ԫ�ģ������뱾�����������.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164069', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?Mult? > 10 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?Mult? > 10 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end  from dual', '�Ҹ���ӯӯ2013���������˺����ձ��շѴﵽ200Ԫ�ģ�����Ͷ��10�ݣ����������ϡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164038', '10164000', 'U', 'select case when exists (select 1 from lcpol where polno = mainpolno and contno = ''?contno?'' and prem >= 1000 and prem < 4000) then (select case when substr(''?ManageCom?'', 0, 4) in (''8601'', ''8610'', ''8624'', ''8611'', ''8612'', ''8637'' ,''8623'') then (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 10 then 0 else 1 end from dual) else (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 5 then 0 else 1 end from dual) end from dual) else 0 end from dual', '�����ڽ�С��4000Ԫ���ڵ���1000Ԫ���ڱ������Ϻ������ڣ����ݣ����գ��㽭���������Ͷ��10�ݣ�����10���������������Ͷ��5�֣�����5��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164039', '10164000', 'U', 'select case when exists (select 1 from lcpol where polno = mainpolno and contno = ''?contno?'' and prem >= 4000 and prem < 6000) then (select case when substr(''?ManageCom?'', 0, 4) in (''8601'', ''8610'', ''8624'', ''8611'', ''8612'', ''8637'' ,''8623'') then (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 20 then 0 else 1 end from dual) else (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 10 then 0 else 1 end from dual) end from dual) else 0 end from dual', '�����ڽ�С��6000Ԫ���ڵ���4000Ԫ���ڱ������Ϻ������ڣ����ݣ����գ��㽭���������Ͷ��20�ݣ�����20���������������Ͷ��10�֣�����10��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164001', '10164000', 'P', 'select (case when ''?ReneWal?''=''S'' then 0.95 else 1 end)*?Mult? * rate * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'') from rt_1640 where ?AppAge? >= minage and ?AppAge? <= maxage', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164003', '10164000', 'P', 'SELECT standprem*?SuppRiskScore?/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164004', '10164000', 'P', 'SELECT (select suppriskscore from lcprem  where polno=''?PolNo?'' AND dutycode=''?DutyCode?'' AND payplancode=''?PayPlanCode?'')/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '�����ӷѱ�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164002', '10164000', 'C', 'select ?Mult?*?VPU? From dual', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164020', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then 1 else (select case when mod (?Mult?,1) = 0 then 1 else null end from dual) end from dual', '������ÿ���ն�ս�Ϊ10Ԫ����������Ͷ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164024', '10164000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then 1 else (select 1 from lcpol where payintv = ''12'' and polno = mainpolno and contno = ''?contno?'' and riskcode in (select riskcode from lmriskapp where riskperiod = ''L'' and riskcode = lcpol.riskcode )) end from dual', '1�����������ս��ѷ�ʽΪ�ڽ�ʱ�����뱾�����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164022', '10164000', 'V', 'select case when exists(select 1 from lmriskapp where riskcode in (select riskcode from lcpol where polno = mainpolno and contno = ''?contno?'' ) and riskperiod= ''L'') then (select  case  when ((select prem  from  lcpol a where a.polno = a.mainpolno and a.contno = ''?contno?'') >= 1000)  then  1 else null end from dual) else 1 end from dual', '1������������ÿ��Ͷ�������ڽ����շѴﵽ1000Ԫ�ģ������뱾�����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164023', '10164000', 'V', 'SELECT 1 FROM lcinsured WHERE contno=''?ContNo?'' AND insuredno=''?InsuredNo?'' AND (to_date(''?PolApplyDate?'',''yyyy-mm-dd'')-birthday)>=30 AND ''?AppAge?''<=55', '��������30�죨����- 55���꣨����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164021', '10164000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then null else 1 end from dual', '��ӯӯ�����밲��סԺ����ҽ�Ʊ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164030', '10164000', 'U', 'SELECT CASE WHEN NVL(SUM(Mult),0) > 20 THEN 1 ELSE 0 END FROM LCPOL WHERE RISKCODE = ''10164000'' AND LCPOL.APPFLAG IN (''0'',''1'') AND LCPOL.UWFLAG NOT IN (''a'', ''1'', ''2'') AND LCPOL.CONTNO IN (SELECT CONTNO FROM LCCONT A WHERE A.APPFLAG IN (''0'', ''1'') AND A.UWFLAG NOT IN (''a'', ''1'', ''2'') AND A.INSUREDNO = ''?InsuredNo?'') AND ''?AppAge?'' <= 50 AND ''?AppAge?'' >= 46', '������������46��������50�����������ڼ䣬Ͷ���Ҹ�����סԺ����ҽ�Ʊ��շ�������20�ݣ�������20��������죬Ӧ�������ĿA+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164031', '10164000', 'U', 'select 1 from lcpol where InsuredAppAge>=51 and polno=''?polno?''', 'Ͷ���Ҹ�����סԺ����ҽ�Ʊ��գ�������������ڵ���51���꣬����죬Ӧ�������ĿA+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164032', '10164000', 'U', 'select 1 from lcpol where riskcode = ''10164000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum=1', 'ÿһ�����������ҹ�˾ֻ��Ͷ��һ�ݡ�����סԺ����ҽ�Ʊ��ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164033', '10164000', 'U', 'select 1 from lcpol where riskcode in (''10038000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1', 'ÿһ�������˲���ͬʱִ���ҹ�˾���Ҹ�����סԺ����ҽ�Ʊ��ա������Ҹ�����סԺ����ҽ�Ʊ��ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164034', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE appflag in (''0'', ''1'') and UWFlag not in (''a'', ''1'', ''2'') AND riskcode = ''10164000'' AND insuredno IN (SELECT DISTINCT insuredno FROM lcinsured WHERE insuredno = ''?InsuredNo?'' and occupationcode IN(''1201002'', ''1201006'', ''1201008'', ''1201011''))', '��������Ϊ��Уѧ�����Ͷ��10�ݡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164012', '10164000', 'E', 'select (''?NewPrem?''-''?Prem?'') from dual', '�ͻ���Ҫ���ϱ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165024', '10165000', 'V', 'select case when ?Amnt? between 5000 and 50000 then (select case when mod(?Amnt?, 1000) = 0 then 1 else null end from dual) else null end from dual', '����A��סԺ���ò���ҽ�Ʊ��ձ������Ͷ���������5000Ԫ,�ҳ�������Ϊ1000Ԫ�������������5��Ԫ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165074', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?Amnt? > 20000 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?Amnt? > 20000 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end from dual', 'ÿ��Ͷ�����Ҹ���ӯӯ2013���������˺����ձ��շѴﵽ200 Ԫ�ģ������ַ���Ͷ���������ս��2��Ԫ���ϡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165021', '10165000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then null else 1 end from dual', '��ӯӯ�����밲��A��סԺ���ò���ҽ�Ʊ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165030', '10165000', 'U', 'select case when ''?Get?'' > 20000 then (select 1 from lcpol where InsuredAppAge between 46 and 50 and polno = ''?polno?'') else 0 end from dual', '������������46-50���꣬Ͷ������A��סԺ���ò���ҽ�Ʊ��ջ������2��Ԫ�������A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165031', '10165000', 'U', 'select 1 from lcpol where InsuredAppAge>=51 and polno=''?polno?''', '������������ڵ���51���꣬����죬Ӧ�������ĿA+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165032', '10165000', 'U', 'select 1 from lcpol where riskcode = ''10165000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum=1', 'ÿһ�����������ҹ�˾ֻ��Ͷ��һ�ݰ���A��סԺ���ò���ҽ�Ʊ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165033', '10165000', 'U', 'select 1 from lcpol where riskcode in(''10018000'',''10040000'',''10099000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1', 'ÿһ�������˲���ͬʱִ���ҹ�˾���Ҹ�����A��סԺ���ò���ҽ�Ʊ��ա������Ҹ�����סԺ���ò���ҽ�Ʊ��ա������Ҹ�����סԺ���ò���ҽ�Ʊ��գ�2009���������Ҹ�סԺ���ò���ҽ�Ʊ��ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165034', '10165000', 'U', 'select distinct 1 from lcinsured where insuredno=''?InsuredNo?'' and ''?Get?''>20000 and (occupationcode in (''2147003'',''1700001'',''1201002'',''2147002'') or ?appage?<18)', 'δ�����ˡ���ҵ��Ա��������Ա����ͥ��������Уѧ������A��סԺ���ò���ҽ�Ʊ�����߻������ս������2��Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165035', '10165000', 'U', 'select distinct 1 from lcappnt where contno=''?contno?'' and ''?Get?''>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')', 'ҽ��ϵͳ��ҵ��Ա��ΪͶ���ˣ�����A��סԺ���ò���ҽ�Ʊ�����߻������ս������2��Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165036', '10165000', 'U', 'select distinct 1 from lcinsured where insuredno = ''?InsuredNo?''and contno=''?contno?'' and ''?Get?''>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')', 'ҽ��ϵͳ��ҵ��Ա��Ϊ�������˵ģ�����A��סԺ���ò���ҽ�Ʊ�����߻������ս������2��Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165037', '10165000', 'U', 'select 1 from lcpol where polno=''?polno?'' and insuredappage>64', '����ʱ�����������䲻�ܳ���64����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165023', '10165000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in ( ''10012000'',''10126000'')  then 1 else (select case when ?Amnt? > 20000 then (select case when prem >= 4000 then 1 else null end from lcpol where polno = mainpolno and contno = ''?contno?'') else 1 end from dual) end from dual', '1������������ÿ��Ͷ�������ڽ����շѲ���4000Ԫ������A��סԺ���ò���ҽ�Ʊ��ղ���Ͷ���������ս��2��Ԫ����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165010', '10165000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else (select round((select prem from lcpol where polno = ''?PolNo?'')*0.65*(1 - (to_date(''?ZTPoint?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365),2)+round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) from dual) end from dual', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165013', '10165000', 'E', 'select(''?NewPrem?'' - ''?Prem?'')*(1-(to_date(''?EdorValiDate?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365) from dual', 'ְҵ�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165012', '10165000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?''  and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) end from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165014', '10165000', 'E', 'SELECT DISTINCT 1 FROM lcpol WHERE paytodate>=payenddate AND conttype=''1'' AND polno IN (SELECT mainpolno FROM lcpol b WHERE b.polno=''?PolNo?'' AND b.contno=''?ContNo?'')', '1�����������ս�����������������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165042', '10165000', 'C', 'SELECT CASE WHEN PATIENTDATE BETWEEN to_date(''?CVALIDATE?'') AND to_date(''?LCGETENDDATE?'') then (select case when ?Je_gf? = ?ASumFee? then ?Je_gf? * 0.5 else ?Je_gf? end from dual) ELSE 0 END FROM (SELECT A.FEEDATE PATIENTDATE FROM LLFEEMAIN A, LLCASERECEIPT B WHERE A.CLMNO = B.CLMNO AND A.MAINFEENO = B.MAINFEENO AND A.FEETYPE = B.FEEITEMTYPE AND A.CLMNO = ''?CaseNo?'' AND A.CUSTOMERNO = ''?CustomerNo?'' AND A.FEETYPE = ''A'' AND B.FEEDETAILNO = ''?DutyFeeStaNo?'' and exists ( SELECT 1 FROM LLFEEMAIN WHERE CUSTOMERNO = ''?CustomerNo?'' AND FEETYPE = ''B'' AND EXISTS (SELECT * FROM LLAPPCLAIMREASON WHERE CASENO = LLFEEMAIN.CLMNO AND CUSTOMERNO = ''?CustomerNo?'' AND REASONCODE = ''?GetDutyKind?'') and not exists (select 1 from llregister where rgtno = LLFEEMAIN.clmno and clmstate = ''70'') and A.FEEDATE between ( HOSPSTARTDATE - 7 ) and (HOSPendDATE + 7)))', '�������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0166', '10165000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=30) and ''?GetDutyKind?'' like ''2%'')then 0 else 1 end from dual', '�Ҹ�����A��סԺ���ò���ҽ�Ʊ����б��������Ա���ͬ��Ч֮����30����(��30��)���ּ�������ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0167', '10165000', 'C', 'select case when  to_date(''?EndFeeDate?'',''YYYY-MM-DD'')-(select getenddate from lcget where polno=''?PolNo?'' and getdutycode in (''165040'')) < 30 then 1 else 0 end from dual', '�������˾�ҽԺ��ϱ���סԺ���ƣ��������պ�ͬ����������δ��������ע��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165041', '10165000', 'C', 'select case when ?BSocPay? = ''0.0'' and ?BOthPay? = ''0.0'' then (select case when ?Je_gf? - ?BSocPay? <= 40000 then least((?Je_gf? - ?BSocPay?) * 0.9, ?ValidAmnt?) else least(40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95, ?ValidAmnt?) end from dual) else least(least((?BSumFee? - ?BSocPay? - ?BOthPay?), (select case when ?Je_gf? - ?BSocPay? <= 40000 then ((?Je_gf? - ?BSocPay?) * 0.9) else (40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95) end from dual)), ?ValidAmnt?) end from dual', 'סԺ�籣�����˵�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165040', '10165000', 'C', 'select case when ?Je_gf? = ?BSumFee? then least(?Je_gf? * 0.5,?Amnt?) else least(?Je_gf?,?Amnt?) end from dual', 'סԺ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165000', '10165000', 'P', 'select (case when ''?ReneWal?''=''S'' then 0.95 else 1 end)*(case when ?Get? > 20000 then (((select prem from rt_1650 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 20000) + (select (?Get? - 20000) / 1000 * prem from rt_1650 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 99999)) * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'')) else (select prem * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'') from rt_1650 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = ?Get?) end)  from dual', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165001', '10165000', 'C', 'select ?Get? From dual', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165002', '10165000', 'C', 'select ?Get?*0.2 From dual', 'סԺ���ñ��ս��������Ż�*0.2');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165005', '10165000', 'C', 'select ?Get?*0.1 From dual', 'סԺǰ�����ż�����ñ��ս�*0.1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165006', '10165000', 'C', 'select ?Get?*0.1*0.2 From dual', 'סԺǰ�����ż�����ñ��ս��������Ż�*0.2*0.1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165003', '10165000', 'P', 'SELECT standprem*?SuppRiskScore?/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165004', '10165000', 'P', 'SELECT (select suppriskscore from lcprem  where polno=''?PolNo?'' AND dutycode=''?DutyCode?'' AND payplancode=''?PayPlanCode?'')/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '�����ӷѱ�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165020', '10165000', 'V', 'SELECT 1 FROM lcinsured WHERE contno=''?ContNo?'' AND insuredno=''?InsuredNo?'' AND (to_date(''?PolApplyDate?'',''yyyy-mm-dd'')-birthday)>=30 AND ''?AppAge?''<=55', '�������˳������/��СͶ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165026', '10165000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then 1 else (select 1 from lcpol where payintv = ''12'' and polno = mainpolno and contno = ''?contno?'' and riskcode in (select riskcode from lmriskapp where riskperiod = ''L'' and riskcode = lcpol.riskcode )) end from dual', '1�����������ս��ѷ�ʽ���ڽ������밲��A��סԺ���ò���ҽ�Ʊ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165022', '10165000', 'V', 'select case when exists(select 1 from lmriskapp where riskcode in (select riskcode from lcpol where polno = mainpolno and contno = ''?contno?'' ) and riskperiod= ''L'') then (select  case  when ((select prem  from  lcpol a where a.polno = a.mainpolno and a.contno = ''?contno?'') >= 1000)  then  1 else null end from dual) else 1 end from dual', '1������������ÿ��Ͷ�������ڽ����շѴﵽ1000Ԫ�ģ�����Ͷ������A��סԺ���ò���ҽ�Ʊ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165011', '10165000', 'E', 'select (''?NewPrem?''-''?Prem?'') from dual', '�ͻ���Ҫ���ϱ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165046', '10165000', 'C', 'select ?Je_gf? From dual', 'סԺ���������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165044', '10165000', 'C', 'select case when (select case when ''?BSocPay?'' = ''0.0'' and ?BOthPay? = ''0.0'' then (select case when ?Je_gf? - ?BSocPay? <= 40000 then (?Je_gf? - ?BSocPay?) * 0.9 else 40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95 end from dual) else least((?BSumFee? - ?BSocPay? - ?BOthPay?), (select case when ?Je_gf? - ?BSocPay? <= 40000 then ((?Je_gf? - ?BSocPay?) * 0.9) else (40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95) end from dual)) end from dual)> (select actuget-summoney from lcget where getdutycode = ''165040'' and polno = ''?PolNo?'') then least((select case when ?BSocPay? = ''0.0'' and ?BOthPay? = ''0.0'' then (select case when ?Je_gf? - ?BSocPay? <= 40000 then (?Je_gf? - ?BSocPay?) * 0.9 else 40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95 end from dual) else least((?BSumFee? - ?BSocPay? - ?BOthPay?), (select case when ?Je_gf? - ?BSocPay? <= 40000 then ((?Je_gf? - ?BSocPay?) * 0.9) else (40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95) end from dual)) end from dual)-(select actuget-summoney from lcget where getdutycode = ''165040'' and polno = ''?PolNo?''),?ValidAmnt?) else 0 end from dual', 'סԺ�����������Ż��˵�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165043', '10165000', 'C', 'select case when ?AOthPay?= ''0.0'' and ?ASocPay?= ''0.0'' then least(?Je_gf?* 0.9,?ValidAmnt?) else least(least(?ASumFee?-?ASocPay?-?AOthPay?, ((?Je_gf?-?ASocPay?) * 0.9)),?ValidAmnt?) end from dual', '�����籣�����˵�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165071', '10165000', 'C', 'select 1 from dual where exists (select 1 from lcget where contno = (select distinct contno from lcget where polno = ''?PolNo?'') and dutycode = ''165000'' and getstartdate = ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5))) and not exists (select * from llclaimdetail a, lmriskapp b where a.contno = (select distinct contno from lcget where polno = ''?PolNo?'') and a.riskcode = b.riskcode and a.getdutycode = ''165042'' and makedate between ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5)) and ((substr(''?LCGetEndDate?'', 1, 4) - 1) || substr(''?LCGetEndDate?'', 5)) and not exists (select 1 from llclaim where clmno = a.clmno and clmstate = ''70''))', '�ż������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165072', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL  ) else (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL) end from dual', '�������ˡ�18���꣬ÿ��Ͷ�����Ҹ���ӯӯ2013���������˺����ձ��շѴﵽ100Ԫ�ģ������뱾�����������.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165073', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end from dual', '�������ˣ�18���꣬ÿ��Ͷ�����Ҹ���ӯӯ2013���������˺����ձ��շѴﵽ50Ԫ�ģ������뱾�����������.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165045', '10165000', 'C', 'select case when (select case when ?AOthPay? = ''0.0'' and ?ASocPay? = ''0.0'' then ?Je_gf? * 0.9 else least(?ASumFee? - ?ASocPay? - ?AOthPay?, ((?Je_gf? - ?ASocPay?) * 0.9)) end from dual)>(select actuget-summoney from lcget where getdutycode = ''165042'' and polno = ''?PolNo?'') then least((select case when ?AOthPay? = ''0.0'' and ?ASocPay? = ''0.0'' then ?Je_gf? * 0.9 else least(?ASumFee? - ?ASocPay? - ?AOthPay?, ((?Je_gf? - ?ASocPay?) * 0.9)) end from dual)-(select actuget-summoney from lcget where getdutycode = ''165042'' and polno = ''?PolNo?''),?ValidAmnt?) else 0 end from dual', '��������������Ż��˵�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165061', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select count(1) from lcpol where riskcode = ''10165000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', 'ÿһ�����������ҹ�˾ֻ��Ͷ��һ�ݡ��Ҹ�����A��סԺ���ò���ҽ�Ʊ��գ������ظ�����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165062', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select 1 from lcpol where riskcode in (''10018000'', ''10040000'', ''10099000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', 'ÿһ�������˲���ͬʱ�����ҹ�˾���Ҹ�����סԺ���ò���ҽ�Ʊ��ա������Ҹ�����סԺ���ò���ҽ�Ʊ��գ�2009���������Ҹ�סԺ���ò���ҽ�Ʊ��ա������Ҹ�����A��סԺ���ò���ҽ�Ʊ��ա�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165063', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (SELECT DISTINCT 1 FROM lcpol WHERE paytodate >= payenddate AND conttype = ''1''  AND polno =mainpolno and payintv = ''12'' and contno = ''?ContNo?'') = 1 then null else 1 end from dual) else 1 end from dual', '1�����������ս�����������������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165070', '10165000', 'C', 'select 1 from dual where exists (select 1 from lcget where contno = (select distinct contno from lcget where polno = ''?PolNo?'') and dutycode = ''165000'' and getstartdate = ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5))) and not exists (select * from llclaimdetail a, lmriskapp b where a.contno = (select distinct contno from lcget where polno = ''?PolNo?'') and a.riskcode = b.riskcode and a.getdutycode = ''165040'' and makedate between ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5)) and ((substr(''?LCGetEndDate?'', 1, 4) - 1) || substr(''?LCGetEndDate?'', 5)) and not exists (select 1 from llclaim where clmno = a.clmno and clmstate = ''70''))', 'סԺ���������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165025', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then 1 else (select case when (select count(*) from LCCustomerImpartParams a where ImpartVer in (''01'', ''31'') and ImpartParamNo = ''1'' and CustomerNoType = ''1'' and (ImpartCode = ''004'' and ImpartParam = ''��'') and a.ContNo = ''?ContNo?'') > 0 then 1 else null end from dual) end from dual', 'Ͷ������A��סԺ���ò���ҽ�Ʊ��ո�֪��4���Ƿ�ӵ�й���ҽ�Ƽ����ҽ�Ʊ�����Ϊ���ǡ�');

prompt Done.
