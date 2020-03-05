prompt Importing table LMCalMode...
set feedback off
set define off
insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099000', '10099000', 'P', 'select (case when ''?ReneWal?''=''S'' then 0.95 else 1 end)*(case when ?Get? > 20000 then (((select prem from rt_0990 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 20000) + (select (?Get? - 20000) / 1000 * prem from rt_0990 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 99999)) * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'')) else (select prem * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'') from rt_0990 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = ?Get?) end)  from dual', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099063', '10099000', 'V', 'SELECT CASE WHEN (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) <> ''10126000'' then 1 else (select case when ''?Amnt?'' > 20000 then (select 1 from lcpol where prem >= 200 and contno = ''?contno?'' and polno = ''?mainpolno?'' and riskcode = ''10126000'') else 1 end from dual) END FROM dual', '幸福乐盈盈个人意外伤害保险（2013）保费达到200元的，可投保幸福住院费用补偿医疗保险基本保险金额2万元以上');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099002', '10099000', 'P', 'SELECT (select suppriskscore from lcprem  where polno=''?PolNo?'' AND dutycode=''?DutyCode?'' AND payplancode=''?PayPlanCode?'')/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '健康加费比例计算');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099020', '10099000', 'V', 'select case when ?Amnt? between 3000 and 50000 then (select case when mod(?Amnt?, 1000) = 0 then 1 else null end from dual) else null end from dual', '投保本险种每份投保单的最低基本保险金额为3000元，超过3000元的保险金额必须为1000元的整数倍，最高基本保险金额上限为5万元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099021', '10099000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then 1 else (select 1 from lcpol where payintv = ''12'' and polno = mainpolno and contno = ''?contno?'' and riskcode in (select riskcode from lmriskapp where riskperiod = ''L'' and riskcode = lcpol.riskcode )) end from dual', '1年期以上主险交费方式为期交时方可与本险种组合销售');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099023', '10099000', 'V', 'select case when ((select riskcode from lcpol where contno=''?contno?'' and polno=mainpolno) = ''10012000'') then (SELECT CASE WHEN (''?AppAge?'' >= 18) THEN (select 1 from lcpol where prem >= 100 and riskcode = ''10012000'' and contno = ''?contno?'') ELSE (select 1 from lcpol where prem >= 50 and riskcode = ''10012000'' and contno = ''?contno?'') END FROM dual) else 1 end from dual', '被保险人≥18周岁，每份投保单幸福乐盈盈个人意外伤害 
保险保险费达到100元的，方可与本险种组合销售；
被保险人＜18周岁，每份投保单幸福乐盈盈个人意外伤害 
保险保险费达到50元的，方可与本险种组合销售
');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099024', '10099000', 'V', 'select case when ''''?Amnt?'''' > 20000 then (select 1 from lcpol where prem >= 200 and contno = ''''?contno?'''' and polno = ''''?mainpolno?'''' and riskcode in (''''10012000'''',''''10126000'''')) else 1 end from dual', '每份投保单幸福乐盈盈个人意外伤害保险保险费达到200元的，本险种方可投保基本保险金额2万元以上');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099030', '10099000', 'U', 'select case when ?Get? > 20000 then (select 1 from lcpol where InsuredAppAge between 46 and 50 and polno = ''?polno?'') else 0 end from dual', '被保人年龄在46（含）－50（含）周岁期间，购买该险种的基本保险金额大于2万元，需体检，应做体检项目A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099031', '10099000', 'U', 'select 1 from lcpol where InsuredAppAge>=51 and polno=''?polno?''', '被保人年龄大于等于51周岁，需体检，应做体检项目A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099032', '10099000', 'U', 'select 1 from lcpol where riskcode = ''10099000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum=1', '每一被保险人在我公司只能投保一份“幸福住院费用补偿医疗保险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099033', '10099000', 'U', 'select 1 from lcpol where riskcode in( ''10018000'',''10040000'') and (appflag = 1 or (appflag in (''0'',''2'') and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1', '每一被保险人不可同时执有我公司“幸福附加住院费用补偿医疗保险”、“幸福附加住院费用补偿医疗保险（2009）”及“幸福住院费用补偿医疗保险”');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099034', '10099000', 'U', 'select case when not exists (select * from lpedoritem where edorno = ''?EdorNo?'' and edortype <> ''NS'') then (select distinct 1 from lcinsured where insuredno=''?InsuredNo?'' and ?Get?>20000 and (occupationcode in (''2147002'',''2147003'',''1700001'',''1201002'' ) or ?appage?<18)) else (select distinct 1 from lpinsured where insuredno=''?InsuredNo?'' and edorno=''?EdorNo?'' and ?Get?>20000 and (occupationcode in (''2147002'',''2147003'',''1700001'',''1201002'' ) or ?appage?<18)) end from dual', '未成年人、待业人员、退休人员、家庭主妇、在校学生最高投保基本保险金额不得超过20000元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099035', '10099000', 'U', 'select case when not exists (select * from lpedoritem where edorno = ''?EdorNo?'' and edortype <> ''NS'') then (select distinct 1 from lcappnt where contno=''?contno?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) else (select distinct 1 from lpappnt where contno=''?contno?'' and edorno=''?EdorNo?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) end from dual', '医疗系统从业人员作为投保人的，最高投保基本保险金额不得超过20000元；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099022', '10099000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in ( ''10012000'',''10126000'')  then 1 else (select case when ?Amnt? > 20000 then (select case when prem >= 4000 then 1 else null end from lcpol where polno = mainpolno and contno = ''?contno?'') else 1 end from dual) end from dual', '1年期以上主险每份投保单的期交保险费达到4000元的，本险种方可投保基本保险金额2万元以上');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099036', '10099000', 'U', 'select case when not exists (select * from lpedoritem where edorno = ''?EdorNo?'' and edortype <> ''NS'') then (select distinct 1 from lcinsured where insuredno = ''?InsuredNo?''and contno=''?contno?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) else (select distinct 1 from lpinsured where insuredno = ''?InsuredNo?''and contno=''?contno?'' and edorno=''?EdorNo?'' and ?Get?>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')) end from dual', '医疗系统从业人员作为被保险人的，最高投保基本保险金额不得超过20000元；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099037', '10099000', 'U', 'select 1 from lcpol where polno=''?polno?'' and insuredappage>64', '续保时被保险人年龄不能超过64周岁');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099040', '10099000', 'E', 'select(''?NewPrem?'' - ''?Prem?'')*(1-(to_date(''?EdorValiDate?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365) from dual', '职业类别变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099041', '10099000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else (select round((select prem from lcpol where polno = ''?PolNo?'')*0.65*(1 - (to_date(''?ZTPoint?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365),2)+round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) from dual) end from dual', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099042', '10099000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?''  and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) end from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099043', '10099000', 'E', 'select (''?NewPrem?''-''?Prem?'') from dual', '客户重要资料变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT0990', '10099000', 'V', 'select case when ?Amnt? between 3000 and 50000 then (select case when mod(?Amnt?, 1000) = 0 then 1 else 0 end from dual) 1 else 0 end from dual', '投保本险种每份投保单的最低基本保险金额为3000元，超过3000元的保险金额必须为1000元的整数倍，最高基本保险金额上限为5万元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0137', '10099000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=30) and ''?GetDutyKind?'' like ''2%'')then 0 else 1 end from dual', '幸福住院费用补偿医疗保险中被保险人自本合同生效之日起30日内(含30日)出现疾病，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0138', '10099000', 'C', 'select case when  to_date(''?EndFeeDate?'',''YYYY-MM-DD'')<(select getenddate from lcget where polno=''?PolNo?'' and getdutycode in (''099040'',''099041'')) then 1 else 0 end from dual', '被保险人经医院诊断必须住院治疗，到本主险合同保险期满仍未结束，需注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099050', '10099000', 'C', 'SELECT CASE WHEN PATIENTDATE BETWEEN to_date(''?CVALIDATE?'') AND to_date(''?LCGETENDDATE?'') then ?JE_GF? ELSE 0 END FROM (SELECT A.FEEDATE PATIENTDATE FROM LLFEEMAIN A, LLCASERECEIPT B WHERE A.CLMNO = B.CLMNO AND A.MAINFEENO = B.MAINFEENO AND A.FEETYPE = B.FEEITEMTYPE AND A.CLMNO = ''?CaseNo?'' AND A.CUSTOMERNO = ''?CustomerNo?'' AND A.FEETYPE = ''A'' AND B.FEEDETAILNO = ''?DutyFeeStaNo?'' and exists ( SELECT 1 FROM LLFEEMAIN WHERE CUSTOMERNO = ''?CustomerNo?'' AND FEETYPE = ''B'' AND EXISTS (SELECT * FROM LLAPPCLAIMREASON WHERE CASENO = LLFEEMAIN.CLMNO AND CUSTOMERNO = ''?CustomerNo?'' AND REASONCODE = ''?GetDutyKind?'') and not exists (select 1 from llregister where rgtno = LLFEEMAIN.clmno and clmstate = ''70'') and A.FEEDATE between ( HOSPSTARTDATE - 7 ) and (HOSPendDATE + 7)))', '门急诊账单金额计算');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099051', '10099000', 'C', 'select ?Je_gf? from dual', '账单金额计算');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099052', '10099000', 'C', 'select ?GetRate?*?Je_gf? from dual', '意外出险理赔金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099053', '10099000', 'C', 'select ?Get?*0.1 from dual', '住院前、后门急诊费用保险金不超过约定的基本保险金额的10%');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099060', '10099000', 'C', 'select case when ?GetRate? =''0.0'' then (least(((?Je_gf?-?BSocPay?)*0.7),(?BSumFee?-?BSocPay?-?BOthPay?))) else  (least(((?Je_gf?-?BSocPay?)*?GetRate?),(?BSumFee?-?BSocPay?-?BOthPay?))) end from dual', '住院第三方给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099061', '10099000', 'C', 'select case when ?GetRate? =''0.0'' then (least(((?Je_gf?-?ASocPay?)*0.7),(?ASumFee?-?ASocPay?-?AOthPay?))) else  (least(((?Je_gf?-?ASocPay?)*?GetRate?),(?ASumFee?-?ASocPay?-?AOthPay?))) end from dual', '门诊第三方给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099062', '10099000', 'V', 'select case when ((select riskcode from lcpol where contno=''?contno?'' and polno=mainpolno) = ''10126000'') then (SELECT CASE WHEN (''?AppAge?'' >= 18) THEN (select 1 from lcpol where prem >= 100 and riskcode = ''10126000'' and contno = ''?contno?'') ELSE (select 1 from lcpol where prem >= 50 and riskcode = ''10126000'' and contno = ''?contno?'') END FROM dual) else 1 end from dual', '被保险人≥18周岁，幸福乐盈盈个人意外伤害保险（2013）保险费达到100元的，可投保附加险；被保险人＜18周岁，幸福乐盈盈个人意外伤害保险（2013）保险费达到50元的，可投保附加险。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('099001', '10099000', 'P', 'SELECT standprem*?SuppRiskScore?/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164035', '10164000', 'U', 'SELECT CASE WHEN 1 IN (SELECT 1 FROM LCAPPNT WHERE APPNTNO = ''?AppntNo?'' AND OCCUPATIONCODE IN (''1001001'', ''1001002'', ''1001003'', ''1001008'', ''1001009'', ''1001010'', ''1001011'', ''1001012'', ''1001013'', ''1001014'', ''1001015'', ''1002001'', ''1002002'', ''1002003'', ''1002004'', ''1002005'', ''1002006'', ''1002007'')) THEN (SELECT CASE WHEN SUM(MULT) > 10 THEN 1 ELSE 0 END FROM LCPOL WHERE APPFLAG IN (''0'', ''1'') AND UWFLAG NOT IN (''a'', ''1'', ''2'') AND RISKCODE = ''10164000'' AND insuredno = ''?InsuredNo?'') ELSE 0 END FROM DUAL', '医疗系统从业人员作为投保人，本单被保险人最高投保安心住院津贴医疗保险10份');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164036', '10164000', 'U', 'SELECT CASE WHEN 1 IN (SELECT 1 FROM lcinsured WHERE insuredno = ''?InsuredNo?'' AND OCCUPATIONCODE IN (''1001001'', ''1001002'', ''1001003'', ''1001008'', ''1001009'', ''1001010'', ''1001011'', ''1001012'', ''1001013'', ''1001014'', ''1001015'', ''1002001'', ''1002002'', ''1002003'', ''1002004'', ''1002005'', ''1002006'', ''1002007'')) THEN (SELECT CASE WHEN SUM(MULT) > 10 THEN 1 ELSE 0 END FROM LCPOL WHERE APPFLAG IN (''0'', ''1'') AND UWFLAG NOT IN (''a'', ''1'', ''2'') AND RISKCODE = ''10164000'' AND insuredno = ''?InsuredNo?'') ELSE 0 END FROM DUAL', '医疗系统从业人员作为被保险人，本单被保险人最高投保安心住院津贴医疗保险10份');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164037', '10164000', 'U', 'select 1 from lcpol where polno=''?polno?'' and insuredappage>64', '续保时被保险人年龄不能超过64周岁');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164041', '10164000', 'U', 'select distinct 1 from lcinsured where insuredno = ''?InsuredNo?'' and occupationcode = ''2147002'' and contno = ''?ContNo?''', '被保险人为待业人员，不能承保安心住院津贴医疗保险。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164042', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE ''?AppAge?''<18 AND appflag in (''0'',''1'') and UWFlag not in (''a'',''1'',''2'') AND riskcode=''10164000'' AND insuredno=''?InsuredNo?''', '被保险人为未成年人，安心住院津贴医疗保险最高投保10份。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164011', '10164000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) end from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164040', '10164000', 'U', 'select case when exists (select 1 from lcpol where polno = mainpolno and contno = ''?contno?'' and prem >= 6000) then (select case when substr(''?ManageCom?'', 0, 4) in (''8601'', ''8610'', ''8624'', ''8611'', ''8612'', ''8637'' ,''8623'') then (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 30 then 0 else 1 end from dual) else (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 20 then 0 else 1 end from dual) end from dual) else 0 end from dual', '主险期交大于等于6000元，在北京，上海，深圳，广州，江苏，浙江，苏州最大投保30份（包含30），其他地区最大投保20分（包含20）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164043', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE appflag in (''0'', ''1'') and UWFlag not in (''a'', ''1'', ''2'') AND riskcode = ''10164000'' AND insuredno IN (SELECT DISTINCT insuredno FROM lcinsured WHERE insuredno = ''?InsuredNo?'' and occupationcode IN(''2147003''))', '被保险人为退休人员，安心住院津贴医疗保险最高投保10份。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164044', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE appflag in (''0'', ''1'') and UWFlag not in (''a'', ''1'', ''2'') AND riskcode = ''10164000'' AND insuredno IN (SELECT DISTINCT insuredno FROM lcinsured WHERE insuredno = ''?InsuredNo?'' and occupationcode IN(''1700001''))', '被保险人为家庭主妇，安心住院津贴医疗保险最高投保10份。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164010', '10164000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else (select round((select prem from lcpol where polno = ''?PolNo?'')*0.65*(1 - (to_date(''?ZTPoint?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365),2)+round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) from dual) end from dual', '退保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164013', '10164000', 'E', 'select(''?NewPrem?'' - ''?Prem?'')*(1-(to_date(''?EdorValiDate?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365) from dual', '职业类别变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0164', '10164000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=30) and ''?GetDutyKind?'' =''208'')then 0 else 1 end from dual', '幸福安心住院津贴医疗保险中被保险人自本合同生效之日起30日内(含30日)出现疾病，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0165', '10164000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=90) and ''?GetDutyKind?'' =''208'' and ''?GetDutyCode?'' =''164041'')then 0 else 1 end from dual', '幸福安心住院津贴医疗保险中被保险人自本合同生效之日起90日内(含90日)出现疾病，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164050', '10164000', 'C', 'select least(180 * ?Oamnt?- (select lcget.summoney from lcget where polno = ''?Polno?'' and dutycode = ''?DutyCode?'' and insuredno = ''?insuredno?''and GetDutyCode =''?GetDutyCode?''),?je_gf?) from dual
', '意外住院日额津贴理赔金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164051', '10164000', 'C', 'select ?Oamnt?*least(least((case when ?InPeriodDays? = 0 then 0 else ?InPeriodDays?+30 end), ?DaysInHos?),90) from dual', '意外住院日额津贴账单计算公式');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164052', '10164000', 'C', 'select least(180 * ?Oamnt?- (select lcget.summoney from lcget where polno = ''?Polno?'' and dutycode = ''?DutyCode?'' and insuredno = ''?insuredno?''and GetDutyCode =''?GetDutyCode?''),?je_gf?) from dual
', '疾病住院日额津贴理赔金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164053', '10164000', 'C', 'select ?Oamnt?*least(least((case when ?InPeriodDays? = 0 then 0 else ?InPeriodDays?+30-3 end), (case when ?DaysInHos?-3 > 0 then ?DaysInHos?-3 else 0 end )),90) from dual', '疾病住院日额津贴账单计算公式');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164054', '10164000', 'C', 'select least(180 * ?Oamnt?- (select lcget.summoney from lcget where polno = ''?Polno?'' and dutycode = ''?DutyCode?'' and insuredno = ''?insuredno?''and GetDutyCode =''?GetDutyCode?''),?je_gf?) from dual
', '重大疾病住院日额津贴理赔金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164055', '10164000', 'C', 'select ?Oamnt?*least((case when ?InPeriodDays? = 0 then 0 else ?InPeriodDays?+30 end), ?DaysInHos?) from dual', '重大疾病住院日额津贴账单计算公式');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164056', '10164000', 'C', 'select case when (select count(*) from llallowance where  allowtype = ''A'' and allowitemcode in (''PA001'',''PA002'',''PA003'',''PA004'',''PA005'',''PA006'',''PA007'',''PA008'',''PA009'',''PA010'',''PA011'',''PA012'',''PA013'',''PA014'',''PA015'',''PA016'',''PA017'',''PA018'',''PA019'',''PA020'',''PA021'',''PA022'',''PA023'',''PA024'',''PA025'',''PA026'',''PA027'',''PA028'',''PA029'',''PA030'') and  clmno = ''?CaseNo?'' and caseno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' ) = 0 then 0 else 1 end from dual', '重大疾病住院日额津贴过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164061', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select count(1) from lcpol where riskcode = ''10164000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', '每一被保险人在我公司只能投保一份“幸福安心住院津贴医疗保险”，不得重复新增');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164062', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select 1 from lcpol where riskcode in (''10038000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', '每一被保险人不可同时持有我公司“幸福安心住院津贴医疗保险”及“幸福附加住院津贴医疗保险”，不得重复新增');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164063', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (SELECT DISTINCT 1 FROM lcpol WHERE paytodate >= payenddate AND conttype = ''1''  AND polno =mainpolno and payintv = ''12'' and contno = ''?ContNo?'') = 1 then null else 1 end from dual) else 1 end from dual', '1年期以上主险交费期满，不可新增本险种');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164067', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL  ) else (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL) end from dual', '被保险人≥18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到100元的，方可与本险种组合销售.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164068', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end from  dual', '被保险人<18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到50元的，方可与本险种组合销售.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164069', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?Mult? > 10 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?Mult? > 10 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end  from dual', '幸福乐盈盈2013个人意外伤害保险保险费达到200元的，方可投保10份（不含）以上。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164038', '10164000', 'U', 'select case when exists (select 1 from lcpol where polno = mainpolno and contno = ''?contno?'' and prem >= 1000 and prem < 4000) then (select case when substr(''?ManageCom?'', 0, 4) in (''8601'', ''8610'', ''8624'', ''8611'', ''8612'', ''8637'' ,''8623'') then (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 10 then 0 else 1 end from dual) else (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 5 then 0 else 1 end from dual) end from dual) else 0 end from dual', '主险期交小于4000元大于等于1000元，在北京，上海，深圳，广州，江苏，浙江，苏州最大投保10份（包含10），其他地区最大投保5分（包含5）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164039', '10164000', 'U', 'select case when exists (select 1 from lcpol where polno = mainpolno and contno = ''?contno?'' and prem >= 4000 and prem < 6000) then (select case when substr(''?ManageCom?'', 0, 4) in (''8601'', ''8610'', ''8624'', ''8611'', ''8612'', ''8637'' ,''8623'') then (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 20 then 0 else 1 end from dual) else (select case when nvl((select sum(mult) from lcpol where insuredno = ''?insuredno?'' and appflag in (''0'', ''1'', ''2'') and UWFlag not in (''a'', ''1'', ''2'') and riskcode = ''10164000'' and contno <> ''?contno?''), 0) + ''?Mult?'' <= 10 then 0 else 1 end from dual) end from dual) else 0 end from dual', '主险期交小于6000元大于等于4000元，在北京，上海，深圳，广州，江苏，浙江，苏州最大投保20份（包含20），其他地区最大投保10分（包含10）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164001', '10164000', 'P', 'select (case when ''?ReneWal?''=''S'' then 0.95 else 1 end)*?Mult? * rate * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'') from rt_1640 where ?AppAge? >= minage and ?AppAge? <= maxage', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164003', '10164000', 'P', 'SELECT standprem*?SuppRiskScore?/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164004', '10164000', 'P', 'SELECT (select suppriskscore from lcprem  where polno=''?PolNo?'' AND dutycode=''?DutyCode?'' AND payplancode=''?PayPlanCode?'')/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '健康加费比例计算');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164002', '10164000', 'C', 'select ?Mult?*?VPU? From dual', '保额算保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164020', '10164000', 'V', 'select case when ''?EdorType?'' = ''NS'' then 1 else (select case when mod (?Mult?,1) = 0 then 1 else null end from dual) end from dual', '本险种每份日额保险金为10元，需整数份投保');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164024', '10164000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then 1 else (select 1 from lcpol where payintv = ''12'' and polno = mainpolno and contno = ''?contno?'' and riskcode in (select riskcode from lmriskapp where riskperiod = ''L'' and riskcode = lcpol.riskcode )) end from dual', '1年期以上主险交费方式为期交时方可与本险种组合销售');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164022', '10164000', 'V', 'select case when exists(select 1 from lmriskapp where riskcode in (select riskcode from lcpol where polno = mainpolno and contno = ''?contno?'' ) and riskperiod= ''L'') then (select  case  when ((select prem  from  lcpol a where a.polno = a.mainpolno and a.contno = ''?contno?'') >= 1000)  then  1 else null end from dual) else 1 end from dual', '1年期以上主险每份投保单的期交保险费达到1000元的，方可与本险种组合销售');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164023', '10164000', 'V', 'SELECT 1 FROM lcinsured WHERE contno=''?ContNo?'' AND insuredno=''?InsuredNo?'' AND (to_date(''?PolApplyDate?'',''yyyy-mm-dd'')-birthday)>=30 AND ''?AppAge?''<=55', '被保险人30天（含）- 55周岁（含）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164021', '10164000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then null else 1 end from dual', '乐盈盈不可与安心住院津贴医疗保险组合销售');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164030', '10164000', 'U', 'SELECT CASE WHEN NVL(SUM(Mult),0) > 20 THEN 1 ELSE 0 END FROM LCPOL WHERE RISKCODE = ''10164000'' AND LCPOL.APPFLAG IN (''0'',''1'') AND LCPOL.UWFLAG NOT IN (''a'', ''1'', ''2'') AND LCPOL.CONTNO IN (SELECT CONTNO FROM LCCONT A WHERE A.APPFLAG IN (''0'', ''1'') AND A.UWFLAG NOT IN (''a'', ''1'', ''2'') AND A.INSUREDNO = ''?InsuredNo?'') AND ''?AppAge?'' <= 50 AND ''?AppAge?'' >= 46', '被保人年龄在46（含）－50（含）周岁期间，投保幸福安心住院津贴医疗保险份数大于20份（不包含20），需体检，应做体检项目A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164031', '10164000', 'U', 'select 1 from lcpol where InsuredAppAge>=51 and polno=''?polno?''', '投保幸福安心住院津贴医疗保险，被保人年龄大于等于51周岁，需体检，应做体检项目A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164032', '10164000', 'U', 'select 1 from lcpol where riskcode = ''10164000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum=1', '每一被保险人在我公司只能投保一份“安心住院津贴医疗保险”');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164033', '10164000', 'U', 'select 1 from lcpol where riskcode in (''10038000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1', '每一被保险人不可同时执有我公司“幸福安心住院津贴医疗保险”及“幸福附加住院津贴医疗保险”');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164034', '10164000', 'U', 'SELECT CASE WHEN SUM(mult)>10 THEN 1 ELSE 0 END FROM lcpol WHERE appflag in (''0'', ''1'') and UWFlag not in (''a'', ''1'', ''2'') AND riskcode = ''10164000'' AND insuredno IN (SELECT DISTINCT insuredno FROM lcinsured WHERE insuredno = ''?InsuredNo?'' and occupationcode IN(''1201002'', ''1201006'', ''1201008'', ''1201011''))', '被保险人为在校学生最高投保10份。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('164012', '10164000', 'E', 'select (''?NewPrem?''-''?Prem?'') from dual', '客户重要资料变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165024', '10165000', 'V', 'select case when ?Amnt? between 5000 and 50000 then (select case when mod(?Amnt?, 1000) = 0 then 1 else null end from dual) else null end from dual', '安心A款住院费用补偿医疗保险保额不符合投保规则（最低5000元,且超出部分为1000元的整数倍，最高5万元）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165074', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?Amnt? > 20000 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?Amnt? > 20000 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=200 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end from dual', '每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到200 元的，本险种方可投保基本保险金额2万元以上。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165021', '10165000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then null else 1 end from dual', '乐盈盈不可与安心A款住院费用补偿医疗保险组合销售');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165030', '10165000', 'U', 'select case when ''?Get?'' > 20000 then (select 1 from lcpol where InsuredAppAge between 46 and 50 and polno = ''?polno?'') else 0 end from dual', '被保险人年龄46-50周岁，投保安心A款住院费用补偿医疗保险基本保额＞2万元，需体检A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165031', '10165000', 'U', 'select 1 from lcpol where InsuredAppAge>=51 and polno=''?polno?''', '被保人年龄大于等于51周岁，需体检，应做体检项目A+B');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165032', '10165000', 'U', 'select 1 from lcpol where riskcode = ''10165000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum=1', '每一被保险人在我公司只能投保一份安心A款住院费用补偿医疗保险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165033', '10165000', 'U', 'select 1 from lcpol where riskcode in(''10018000'',''10040000'',''10099000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1', '每一被保险人不可同时执有我公司“幸福安心A款住院费用补偿医疗保险”、“幸福附加住院费用补偿医疗保险”、“幸福附加住院费用补偿医疗保险（2009）”及“幸福住院费用补偿医疗保险”');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165034', '10165000', 'U', 'select distinct 1 from lcinsured where insuredno=''?InsuredNo?'' and ''?Get?''>20000 and (occupationcode in (''2147003'',''1700001'',''1201002'',''2147002'') or ?appage?<18)', '未成年人、待业人员、退休人员、家庭主妇、在校学生安心A款住院费用补偿医疗保险最高基本保险金额上限2万元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165035', '10165000', 'U', 'select distinct 1 from lcappnt where contno=''?contno?'' and ''?Get?''>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')', '医疗系统从业人员作为投保人，安心A款住院费用补偿医疗保险最高基本保险金额上限2万元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165036', '10165000', 'U', 'select distinct 1 from lcinsured where insuredno = ''?InsuredNo?''and contno=''?contno?'' and ''?Get?''>20000 and occupationcode in (''1001001'',''1001002'',''1001003'',''1001008'',''1001009'',''1001010'',''1001011'',''1001012'',''1001013'',''1001014'',''1001015'',''1002001'',''1002002'',''1002003'',''1002004'',''1002005'',''1002006'',''1002007'')', '医疗系统从业人员作为被保险人的，安心A款住院费用补偿医疗保险最高基本保险金额上限2万元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165037', '10165000', 'U', 'select 1 from lcpol where polno=''?polno?'' and insuredappage>64', '续保时被保险人年龄不能超过64周岁');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165023', '10165000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in ( ''10012000'',''10126000'')  then 1 else (select case when ?Amnt? > 20000 then (select case when prem >= 4000 then 1 else null end from lcpol where polno = mainpolno and contno = ''?contno?'') else 1 end from dual) end from dual', '1年期以上主险每份投保单的期交保险费不足4000元，安心A款住院费用补偿医疗保险不可投保基本保险金额2万元以上');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165010', '10165000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?'' and othernotype = ''5'' and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else (select round((select prem from lcpol where polno = ''?PolNo?'')*0.65*(1 - (to_date(''?ZTPoint?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365),2)+round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) from dual) end from dual', '退保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165013', '10165000', 'E', 'select(''?NewPrem?'' - ''?Prem?'')*(1-(to_date(''?EdorValiDate?'')-(select cvalidate from lcpol where polno = ''?PolNo?'')) / 365) from dual', '职业类别变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165012', '10165000', 'E', 'select case when exists (select ''1'' from ljagetclaim where polno = ''?PolNo?''  and feefinatype = ''PK'' having sum(pay)>0 group by polno) then 0 else round((select prem from lcpol where polno = ''?PolNo?'')*0.35,2) end from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165014', '10165000', 'E', 'SELECT DISTINCT 1 FROM lcpol WHERE paytodate>=payenddate AND conttype=''1'' AND polno IN (SELECT mainpolno FROM lcpol b WHERE b.polno=''?PolNo?'' AND b.contno=''?ContNo?'')', '1年期以上主险交费期满，不可新增本险种');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165042', '10165000', 'C', 'SELECT CASE WHEN PATIENTDATE BETWEEN to_date(''?CVALIDATE?'') AND to_date(''?LCGETENDDATE?'') then (select case when ?Je_gf? = ?ASumFee? then ?Je_gf? * 0.5 else ?Je_gf? end from dual) ELSE 0 END FROM (SELECT A.FEEDATE PATIENTDATE FROM LLFEEMAIN A, LLCASERECEIPT B WHERE A.CLMNO = B.CLMNO AND A.MAINFEENO = B.MAINFEENO AND A.FEETYPE = B.FEEITEMTYPE AND A.CLMNO = ''?CaseNo?'' AND A.CUSTOMERNO = ''?CustomerNo?'' AND A.FEETYPE = ''A'' AND B.FEEDETAILNO = ''?DutyFeeStaNo?'' and exists ( SELECT 1 FROM LLFEEMAIN WHERE CUSTOMERNO = ''?CustomerNo?'' AND FEETYPE = ''B'' AND EXISTS (SELECT * FROM LLAPPCLAIMREASON WHERE CASENO = LLFEEMAIN.CLMNO AND CUSTOMERNO = ''?CustomerNo?'' AND REASONCODE = ''?GetDutyKind?'') and not exists (select 1 from llregister where rgtno = LLFEEMAIN.clmno and clmstate = ''70'') and A.FEEDATE between ( HOSPSTARTDATE - 7 ) and (HOSPendDATE + 7)))', '门诊第三方给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0166', '10165000', 'C', 'select case when ((to_date(''?DangerDate?'',''YYYY-MM-DD'')-to_date(''?CValiDate?'',''YYYY-MM-DD'')<=30) and ''?GetDutyKind?'' like ''2%'')then 0 else 1 end from dual', '幸福安心A款住院费用补偿医疗保险中被保险人自本合同生效之日起30日内(含30日)出现疾病，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0167', '10165000', 'C', 'select case when  to_date(''?EndFeeDate?'',''YYYY-MM-DD'')-(select getenddate from lcget where polno=''?PolNo?'' and getdutycode in (''165040'')) < 30 then 1 else 0 end from dual', '被保险人经医院诊断必须住院治疗，到本主险合同保险期满仍未结束，需注意');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165041', '10165000', 'C', 'select case when ?BSocPay? = ''0.0'' and ?BOthPay? = ''0.0'' then (select case when ?Je_gf? - ?BSocPay? <= 40000 then least((?Je_gf? - ?BSocPay?) * 0.9, ?ValidAmnt?) else least(40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95, ?ValidAmnt?) end from dual) else least(least((?BSumFee? - ?BSocPay? - ?BOthPay?), (select case when ?Je_gf? - ?BSocPay? <= 40000 then ((?Je_gf? - ?BSocPay?) * 0.9) else (40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95) end from dual)), ?ValidAmnt?) end from dual', '住院社保给付账单');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165040', '10165000', 'C', 'select case when ?Je_gf? = ?BSumFee? then least(?Je_gf? * 0.5,?Amnt?) else least(?Je_gf?,?Amnt?) end from dual', '住院第三方给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165000', '10165000', 'P', 'select (case when ''?ReneWal?''=''S'' then 0.95 else 1 end)*(case when ?Get? > 20000 then (((select prem from rt_1650 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 20000) + (select (?Get? - 20000) / 1000 * prem from rt_1650 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = 99999)) * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'')) else (select prem * (select HOSIPRISK from ldoccupation where OccupationCode = ''?Occupation?'') from rt_1650 where ?AppAge? >= minage and ?AppAge? <= maxage and dutycode = ''?DutyCode?'' and amnt = ?Get?) end)  from dual', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165001', '10165000', 'C', 'select ?Get? From dual', '保额算保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165002', '10165000', 'C', 'select ?Get?*0.2 From dual', '住院费用保险金无理赔优惠*0.2');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165005', '10165000', 'C', 'select ?Get?*0.1 From dual', '住院前、后门急诊费用保险金*0.1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165006', '10165000', 'C', 'select ?Get?*0.1*0.2 From dual', '住院前、后门急诊费用保险金无理赔优惠*0.2*0.1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165003', '10165000', 'P', 'SELECT standprem*?SuppRiskScore?/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165004', '10165000', 'P', 'SELECT (select suppriskscore from lcprem  where polno=''?PolNo?'' AND dutycode=''?DutyCode?'' AND payplancode=''?PayPlanCode?'')/100 FROM lcduty WHERE polno=''?PolNo?'' AND dutycode=''?DutyCode?''', '健康加费比例计算');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165020', '10165000', 'V', 'SELECT 1 FROM lcinsured WHERE contno=''?ContNo?'' AND insuredno=''?InsuredNo?'' AND (to_date(''?PolApplyDate?'',''yyyy-mm-dd'')-birthday)>=30 AND ''?AppAge?''<=55', '被保险人超出最大/最小投保年龄');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165026', '10165000', 'V', 'select case when (select riskcode from lcpol where contno = ''?ContNo?'' and polno = mainpolno) in (''10012000'',''10126000'') then 1 else (select 1 from lcpol where payintv = ''12'' and polno = mainpolno and contno = ''?contno?'' and riskcode in (select riskcode from lmriskapp where riskperiod = ''L'' and riskcode = lcpol.riskcode )) end from dual', '1年期以上主险交费方式非期交不可与安心A款住院费用补偿医疗保险组合销售');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165022', '10165000', 'V', 'select case when exists(select 1 from lmriskapp where riskcode in (select riskcode from lcpol where polno = mainpolno and contno = ''?contno?'' ) and riskperiod= ''L'') then (select  case  when ((select prem  from  lcpol a where a.polno = a.mainpolno and a.contno = ''?contno?'') >= 1000)  then  1 else null end from dual) else 1 end from dual', '1年期以上主险每份投保单的期交保险费达到1000元的，方可投保安心A款住院费用补偿医疗保险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165011', '10165000', 'E', 'select (''?NewPrem?''-''?Prem?'') from dual', '客户重要资料变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165046', '10165000', 'C', 'select ?Je_gf? From dual', '住院，门诊无理赔过滤');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165044', '10165000', 'C', 'select case when (select case when ''?BSocPay?'' = ''0.0'' and ?BOthPay? = ''0.0'' then (select case when ?Je_gf? - ?BSocPay? <= 40000 then (?Je_gf? - ?BSocPay?) * 0.9 else 40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95 end from dual) else least((?BSumFee? - ?BSocPay? - ?BOthPay?), (select case when ?Je_gf? - ?BSocPay? <= 40000 then ((?Je_gf? - ?BSocPay?) * 0.9) else (40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95) end from dual)) end from dual)> (select actuget-summoney from lcget where getdutycode = ''165040'' and polno = ''?PolNo?'') then least((select case when ?BSocPay? = ''0.0'' and ?BOthPay? = ''0.0'' then (select case when ?Je_gf? - ?BSocPay? <= 40000 then (?Je_gf? - ?BSocPay?) * 0.9 else 40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95 end from dual) else least((?BSumFee? - ?BSocPay? - ?BOthPay?), (select case when ?Je_gf? - ?BSocPay? <= 40000 then ((?Je_gf? - ?BSocPay?) * 0.9) else (40000 * 0.9 + (?Je_gf? - ?BSocPay? -40000) * 0.95) end from dual)) end from dual)-(select actuget-summoney from lcget where getdutycode = ''165040'' and polno = ''?PolNo?''),?ValidAmnt?) else 0 end from dual', '住院给付无理赔优惠账单');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165043', '10165000', 'C', 'select case when ?AOthPay?= ''0.0'' and ?ASocPay?= ''0.0'' then least(?Je_gf?* 0.9,?ValidAmnt?) else least(least(?ASumFee?-?ASocPay?-?AOthPay?, ((?Je_gf?-?ASocPay?) * 0.9)),?ValidAmnt?) end from dual', '门诊社保给付账单');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165071', '10165000', 'C', 'select 1 from dual where exists (select 1 from lcget where contno = (select distinct contno from lcget where polno = ''?PolNo?'') and dutycode = ''165000'' and getstartdate = ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5))) and not exists (select * from llclaimdetail a, lmriskapp b where a.contno = (select distinct contno from lcget where polno = ''?PolNo?'') and a.riskcode = b.riskcode and a.getdutycode = ''165042'' and makedate between ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5)) and ((substr(''?LCGetEndDate?'', 1, 4) - 1) || substr(''?LCGetEndDate?'', 5)) and not exists (select 1 from llclaim where clmno = a.clmno and clmstate = ''70''))', '门急诊无理赔过滤');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165072', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL  ) else (SELECT CASE WHEN ?AppAge? >= 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?''  AND A.RISKCODE = ''10126000''  AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=100 ) THEN 1 ELSE NULL END from dual) ELSE  1  END  FROM DUAL) end from dual', '被保险人≥18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到100元的，方可与本险种组合销售.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165073', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 1 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 1 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) else (SELECT CASE WHEN ?AppAge? < 18 and exists(select 1 from lcpol where riskcode = ''10126000'' AND (appflag = 0 and UWFlag not in (''a'', ''1'', ''2'')) and contno = ''?ContNo?'') THEN (SELECT CASE WHEN EXISTS (SELECT 1 FROM LCPOL A WHERE A.CONTNO = ''?ContNo?'' AND A.RISKCODE = ''10126000'' AND (A.appflag = 0 and A.UWFlag not in (''a'', ''1'',''2'')) AND A.PREM >=50 ) THEN 1 ELSE NULL END from dual) ELSE 1 END FROM DUAL) end from dual', '被保险人＜18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到50元的，方可与本险种组合销售.');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165045', '10165000', 'C', 'select case when (select case when ?AOthPay? = ''0.0'' and ?ASocPay? = ''0.0'' then ?Je_gf? * 0.9 else least(?ASumFee? - ?ASocPay? - ?AOthPay?, ((?Je_gf? - ?ASocPay?) * 0.9)) end from dual)>(select actuget-summoney from lcget where getdutycode = ''165042'' and polno = ''?PolNo?'') then least((select case when ?AOthPay? = ''0.0'' and ?ASocPay? = ''0.0'' then ?Je_gf? * 0.9 else least(?ASumFee? - ?ASocPay? - ?AOthPay?, ((?Je_gf? - ?ASocPay?) * 0.9)) end from dual)-(select actuget-summoney from lcget where getdutycode = ''165042'' and polno = ''?PolNo?''),?ValidAmnt?) else 0 end from dual', '门诊给付无理赔优惠账单');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165061', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select count(1) from lcpol where riskcode = ''10165000'' and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', '每一被保险人在我公司只能投保一份“幸福安心A款住院费用补偿医疗保险，不能重复新增本险种');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165062', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (select 1 from lcpol where riskcode in (''10018000'', ''10040000'', ''10099000'') and (appflag = 1 or (appflag = 0 and UWFlag not in (''a'', ''1'',''2''))) and insuredno = ''?InsuredNo?'' and polno <> ''?PolNo?'' and rownum = 1) = 1 then null else 1 end from dual) else 1 end from dual', '每一被保险人不可同时持有我公司“幸福附加住院费用补偿医疗保险”、“幸福附加住院费用补偿医疗保险（2009）”、“幸福住院费用补偿医疗保险”及“幸福安心A款住院费用补偿医疗保险”');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165063', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then (select case when (SELECT DISTINCT 1 FROM lcpol WHERE paytodate >= payenddate AND conttype = ''1''  AND polno =mainpolno and payintv = ''12'' and contno = ''?ContNo?'') = 1 then null else 1 end from dual) else 1 end from dual', '1年期以上主险交费期满，不可新增本险种');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165070', '10165000', 'C', 'select 1 from dual where exists (select 1 from lcget where contno = (select distinct contno from lcget where polno = ''?PolNo?'') and dutycode = ''165000'' and getstartdate = ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5))) and not exists (select * from llclaimdetail a, lmriskapp b where a.contno = (select distinct contno from lcget where polno = ''?PolNo?'') and a.riskcode = b.riskcode and a.getdutycode = ''165040'' and makedate between ((substr(''?LCGetStartDate?'', 1, 4) - 1) || substr(''?LCGetStartDate?'', 5)) and ((substr(''?LCGetEndDate?'', 1, 4) - 1) || substr(''?LCGetEndDate?'', 5)) and not exists (select 1 from llclaim where clmno = a.clmno and clmstate = ''70''))', '住院无理赔过滤');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('165025', '10165000', 'V', 'select case when ''?EdorType?'' = ''NS'' then 1 else (select case when (select count(*) from LCCustomerImpartParams a where ImpartVer in (''01'', ''31'') and ImpartParamNo = ''1'' and CustomerNoType = ''1'' and (ImpartCode = ''004'' and ImpartParam = ''是'') and a.ContNo = ''?ContNo?'') > 0 then 1 else null end from dual) end from dual', '投保安心A款住院费用补偿医疗保险告知第4项是否拥有公费医疗及社会医疗保险须为“是”');

prompt Done.
