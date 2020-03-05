prompt Importing table LMCalMode...
set feedback off
set define off
insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162009', '10162000', 'V', 'select case when exists (select * from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'') then (select 1 from dual where (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) else 1 end from dual', '当附加“幸福附加定期寿险”时，附加险的基本保险金额应小于等于主险基本保险金额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162010', '10162000', 'E', 'select 0 from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162011', '10162000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162012', '10162000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) * (select amnt from lcpol where polno = ''?PolNo?'') / amnt end from cv_1620 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (?Interval? +1)) else (select cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt from cv_1620 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162013', '10162000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end *?Amnt?/ amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) *?Amnt?/ amnt end from CV_1620 WHERE payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' + 1)) else (select cv_end *?Amnt?/amnt from cv_1620 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '减保退费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162014', '10162000', 'V', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=10000 and mod(?Amnt?,1000)=0', '本险种减保后的基本保险金额不低于1万元，且超过1万元的保险金额须为1000元的整数倍');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162015', '10162000', 'V', 'select case when exists (select 1 from lppol where edorno = ''?EdorNo?'' and edortype = ''?EdorType?'' and contno=''?ContNo?'' and riskcode=''10031000'') then (select 1 from lcpol a where contno=''?ContNo?'' and riskcode=''10162000'' and (a.amnt - ?Amnt?) >= NVL((select amnt from lppol WHERE edorno = ''?EdorNo?''  and edortype = ''?EdorType?'' and contno=''?ContNo?'' and riskcode=''10031000''), 0))  else (select 1 from lcpol a where contno=''?ContNo?'' and riskcode=''10162000'' and (a.amnt - ?Amnt?) >= NVL((SELECT amnt from lcpol where contno=''?ContNo?'' and riskcode=''10031000''), 0))  end  from dual', '本险种减保时，本险种附加“幸福附加定期寿险”附加险基本保险金额不得超过主险基本保险金额；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162016', '10162000', 'V', 'select case when not exists (select 1 from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'') then 1 else (case when exists (select 1 from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10031000'') then (case when exists (select 1 from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') then (select 1 from dual where (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10031000'')) else (select 1 from dual where (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10031000'')) end) else (case when exists (select 1 from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') then (select 1 from dual where (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) else (select 1 from dual where (select nvl(amnt, 0) from lcpol  where contno = ''?ContNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) end) end) end from dual', '本险种减保时，本险种附加“幸福附加定期寿险”附加险基本保险金额不得超过主险基本保险金额；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0162', '10162000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180)) then 0 else 1 end from dual', '被保险人自本主险合同生效日或最后复效日起180天内出险，请注意!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL1621', '10162000', 'C', 'select case when (select count(distinct getdutycode) from llclaimdetail where clmno =''?ClmNo?'' and riskcode =''10162000'' and getdutycode in(''162040'',''162041'',''162042'',''162043'') and GiveType=''0'') >1  then 0 else 1 end from dual', '重大疾病保险金、身故保险金、全残保险金与疾病终末期保险金，同时只能领取一项。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162018', '10162000', 'C', 'select case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180)   then ''?TotalPrem?''  else ''?Je_gf?'' end from dual', '因疾病导致重大疾病，身故，全残，疾病终末期保险金给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162019', '10162000', 'C', 'select ''?Je_gf?'' from dual', '因意外事故导致重大疾病，身故，全残，疾病终末期保险金给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162020', '10162000', 'C', 'select  ?Je_gf? from dual', '意外早期治疗保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162021', '10162000', 'C', 'select  case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180)  then ?TotalPrem? else ?Je_gf? End from dual', '疾病早期治疗保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162022', '10162000', 'C', 'select case when (select count(*) from LLSeriousDisease where  diseasetype = ''Early'' and diseasecode in  (''ET007'', ''ET008'', ''ET009'',''ET010'', ''ET011'', ''ET012'', ''ET013'', ''ET014'', ''ET015'', ''ET016'', ''ET017'', ''ET018'', ''ET019'', ''ET020'', ''ET021'')  and  clmno = ''?CaseNo?'' and caseno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' ) = 0 then 0 else 1 end from dual
', '早期治疗过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162023', '10162000', 'G', 'select ?Get?*0.2 from LDSysvar where sysvar=''onerow''', '早期治疗保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162024', '10162000', 'G', 'select a.* from LCPrem a where 1=1  and (trim(FreeFlag) = ''0'' or trim(FreeFlag) is null) and urgepayflag =''Y'' and a.contno = ''?Contno?'' and polno in (select polno from lcpol where contno = ''?Contno?'' and riskcode = ''10162000'')', '早期治疗豁免保险费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162025', '10162000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' > 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 180)) and (select distinct 1 from LLSeriousDisease  where diseasetype = ''Early''  and diseasecode in (''ET007'', ''ET008'', ''ET009'',''ET010'', ''ET011'', ''ET012'', ''ET013'', ''ET014'', ''ET015'', ''ET016'', ''ET017'', ''ET018'', ''ET019'', ''ET020'', ''ET021'') and clmno = ''?CaseNo?'' and caseno = ''?CaseNo?'' and customerno = ''?InsuredNo?'') = 1 then 1 else 0 end  from dual


', '疾病早期治疗豁免过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162002', '10162000', 'P', 'select ?Get?/?VPU?*extra_premium from rt_1620addfee a where a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear? and ''?SuppRiskScore?'' Between min_EM and max_EM', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162003', '10162000', 'P', 'select case when ?Job?=5 then (select ?Get? / 10000 * 20 from dual) when ?Job? = 6 then (select ?Get? / 10000 *50 from dual) else 0 end from dual', '职业加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162001', '10162000', 'P', 'select ?Get?/?VPU?*prem from rt_1620 a where a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear?', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162004', '10162000', 'V', 'select 1 from dual where ''?Amnt?''>=10000 AND MOD(''?Amnt?'',1000)=0', '幸福人生终身重大疾病保险保额不符合投保规则（最低1万元,且超出部分为1000元的整数倍）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162005', '10162000', 'E', 'select cv_end from cv_1620 a where  (a.appage+a.year)<106 AND a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear? order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162006', '10162000', 'E', 'select a.paid_up_sum from cv_1620 a where  (a.appage+a.year)<106 AND a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear? order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162007', '10162000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''
', '客户重要资料变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1162', '10162000', 'O', 'select ?Get? From dual', '基本保险金额的1倍计入被保险人的寿险风险保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX2162', '10162000', 'O', 'select ?Get? From dual', '基本保险金额的1倍计入被保险人的重大疾病风险保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162008', '10162000', 'A', 'select ?Get? from LDSysvar where sysvar=''onerow''', '保额算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183001', '10183000', 'G', 'SELECT ?Get? FROM dual', '保额算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183053', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501034'' and i.contno=''?contno?''', '百万安心保被保险人职业为救护车司机（0501034），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183002', '10183000', 'A', 'select ?Get? from dual', '保额算法(疾病身故或全残保险金)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183003', '10183000', 'A', 'SELECT 10*?Get? FROM dual', '保额算法（自驾车意外身故或全残保险金、高铁意外身故或全残保险金）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183004', '10183000', 'A', 'SELECT 5*?Get? FROM dual', '保额算法（水陆公共交通工具意外身故或全残保险金、重大自然灾害意外身故或全残保险金、电梯意外身故或全残保险金、法定节假日意外身故或全残保险金）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183005', '10183000', 'A', 'SELECT 20*?Get? FROM dual', '保额算法(航空公共交通工具意外身故或全残保险金)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183006', '10183000', 'A', 'SELECT ?payEndYear?*?Get?/amnt*prem FROM rt_1830 WHERE age=?AppAge? and sex=''?Sex?'' AND insuyear=?InsuYear? AND PayEndYear=?PayEndYear?', '保额算法（满期保险金）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183007', '10183000', 'A', 'select ?Get? From dual', '保额算法（一般意外身故或全残保险金）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183008', '10183000', 'C', 'select case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180) then ?SumPrem? else (case when to_Date(''?InjuryDate?'', ''YYYY-MM-DD'')>= add_months((Select birthday From lcinsured lc Where lc.contno in (select contno from lcpol where polno = ''?PolNo?'') And lc.Insuredno = ''?InsuredNo?''), 61 * 12) then greatest(1.2*?SumPrem?,?cashvalue?) when to_Date(''?InjuryDate?'', ''YYYY-MM-DD'')< add_months((Select birthday From lcinsured lc Where lc.contno in (select contno from lcpol where polno = ''?PolNo?'') And lc.Insuredno = ''?InsuredNo?''), 41 * 12) then greatest(1.6*?SumPrem?,?cashvalue?) else greatest(1.4*?SumPrem?,?cashvalue?) end) end from dual', '疾病身故或全残保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183009', '10183000', 'C', 'select ?je_gf? from  dual', '理赔算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183010', '10183000', 'G', 'select ?SumPrem? From ldsysvar where sysvar=''onerow''', '满期保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183011', '10183000', 'V', 'select case when count(*)>0 then 1 else 0 end from dual where ?AppAge?>=18 and ?AppAge?<=55', '被保险人超出最大/最小投保年龄');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183012', '10183000', 'V', 'select 1 from LDSysvar where sysvar=''onerow'' and ?Amnt?>=50000 and mod(?Amnt?,10000)=0', '保额不符合投保规则（最低5万元,且超出部分为1万元的整数倍）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183013', '10183000', 'V', 'select 1 from dual where ?PayIntv? = 12', '交费方式录入错误，百万安心保两全保险的交费方式为年交');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183015', '10183000', 'V', 'select 1 from dual where (?payEndYear? = 5 and ''?payendyearFlag?''=''Y'') or (?payEndYear? = 10 and ''?payendyearFlag?''=''Y'')', '交费期间录入错误，百万安心保两全保险的交费期间为5年、10年');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183014', '10183000', 'V', 'select 1 from dual where (?InsuYear? = 20 and ''?InsuYearFlag?'' = ''Y'') or (?InsuYear? = 30 and ''?InsuYearFlag?'' = ''Y'')', '保险期间录入错误，百万安心保两全保险的保险期间为20年、30年');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183030', '10183000', 'U', 'select count(1) from ldsysvar where sysvar=''onerow'' and ?Job?>=5', '百万安心保被保险人职业限1-4类');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183031', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501032'' and i.contno=''?contno?''', '百万安心保被保险人职业为大客车司机（0501032），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183032', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501033'' and i.contno=''?contno?''', '百万安心保被保险人职业为计程车司机（0501033），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183033', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501007'' and i.contno=''?contno?''', '百万安心保被保险人职业为游览车司机及服务员（0501007），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183034', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501008'' and i.contno=''?contno?''', '百万安心保被保险人职业为客运车司机及服务员（0501008），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183035', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501010'' and i.contno=''?contno?''', '百万安心保被保险人职业为自用货车司机，随车工人（0501010），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183036', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501011'' and i.contno=''?contno?''', '百万安心保被保险人职业为人力三轮车夫（0501011），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183037', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501022'' and i.contno=''?contno?''', '百万安心保被保险人职业为货柜车司机，随车工人（0501022），为拒保职业');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183038', '10183000', 'U', 'SELECT CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>2000000 THEN 1 ELSE 0 END FROM dual where substr(''?ManageCom?'', 0, 4) IN (''8601'', ''8607'', ''8610'' ,''8619'',''8624'',''8637'') or substr(''?ManageCom?'', 0, 6) IN (''861100'',''861200'',''862300'')', '百万安心保自驾车意外险风险保额上限超200万（北京、大连、上海、青岛、深圳、苏州分公司；江苏、浙江、广东分公司本部）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183039', '10183000', 'U', 'SELECT CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>1500000 THEN 1 ELSE 0 END FROM dual where substr(''?ManageCom?'', 0, 6) IN (''862700'',''860300'',''860400'',''860600'',''860604'',''861400'',''861500'',''861800'',''862000'',''862100'',''862200'',''862800'',''863200'',''863300'',''863204'')
', '百万安心保自驾车意外险风险保额上限超150万（重庆、河北、山西、辽宁、安徽、福建、山东、河南、湖北、湖南、四川、陕西、甘肃分公司本部）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183040', '10183000', 'U', 'SELECT CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>1000000 THEN 1 ELSE 0 END FROM dual where substr(''?ManageCom?'', 0, 4) not IN (''8601'', ''8607'', ''8610'' ,''8619'',''8624'',''8637'') and substr(''?ManageCom?'', 0, 6) not IN (''860300'',''860400'',''860600'',''860604'',''861400'',''861500'',''861800'',''862000'',''862100'',''862200'',''862700'',''862800'',''863200'',''863300'',''861100'',''861200'',''862300'',''863204'')
', '百万安心保自驾车意外险风险保额上限超100万（其他地区）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183041', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101004'' and i.contno=''?contno?''', '百万安心保被保险人职业为果农（0101004），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183042', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101005'' and i.contno=''?contno?''', '百万安心保被保险人职业为苗圃栽培人员（0101005），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183043', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101006'' and i.contno=''?contno?''', '百万安心保被保险人职业为花圃栽培人员（0101006），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183044', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101012'' and i.contno=''?contno?''', '百万安心保被保险人职业为天然橡胶\剑麻种植人员（0101012），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183045', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501004'' and i.contno=''?contno?''', '百万安心保被保险人职业为花卉商（1501004），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183046', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501005'' and i.contno=''?contno?''', '百万安心保被保险人职业为米商（1501005），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183047', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501008'' and i.contno=''?contno?''', '百万安心保被保险人职业为果菜商（1501008），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183048', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501026'' and i.contno=''?contno?''', '百万安心保被保险人职业为服饰买卖商（1501026），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183049', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501027'' and i.contno=''?contno?''', '百万安心保被保险人职业为鱼贩（1501027），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183050', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501028'' and i.contno=''?contno?''', '百万安心保被保险人职业为肉贩（1501028），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183052', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501034'' and i.contno=''?contno?''', '百万安心保被保险人职业为手工艺品买卖商（1501034），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX7183', '10183000', '0', 'select ?Get? From dual', '基本保险金额的1倍计入被保险人的寿险风险保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX8101', '10183000', '0', 'select 10*?Get? From dual', '以基本保险金额的10倍计入被保险人的自驾车意外险风险保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183060', '10183000', 'E', 'select cv_end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183061', '10183000', 'E', 'select paid_up_sum from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183051', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501032'' and i.contno=''?contno?''', '百万安心保被保险人职业为化学原料商（1501032），自驾车意外险风险保额上限超50万');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183062', '10183000', 'E', 'select case when a.payendyear = 1000 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''', '客户重要资料变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183063', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183064', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end ) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? and year = (?Interval? +1)', '现金价值计算保单现金价值（退保金、协议退保、减保退费、贷款时计算现价）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183065', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? and year = (?Interval? +1)', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT1830', '10183000', 'E', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=50000 and mod(?Amnt?,10000)=0', '本险种减保后的最低保额为5万元，超过5万元的保额必须是1万元的整数倍');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183066', '10183000', 'E', 'select 0 from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183067', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*?Amnt?/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? and year = (?Interval? +1)', '减保退费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL1830', '10183000', 'C', 'select case  when (to_date(''?DangerDate?'', ''YYYY-MM-DD'') - to_date(''?AccDate?'', ''YYYY-MM-DD'') > 180) and substr(''?GetDutyKind?'',0,1) = ''1'' then 0 else 1 end  from dual', '出险日期-事故日期>180天，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183000', '10183000', 'P', 'SELECT ?Get?/amnt*prem FROM rt_1830 WHERE age=?AppAge? and sex=''?Sex?'' AND insuyear=?InsuYear? AND PayEndYear=?PayEndYear? AND insuyearflag=''?InsuYearFlag?'' AND PayEndYearflag=''?PayEndYearFlag?''
', '保费算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197017', '10197000', 'V', 'select case (select bonusgetmode from lcpol where contno=''?ContNo?''and riskcode=''10197000'') when ''1'' then 1 when ''2'' then 1 when ''3'' then 1 else null end from dual', '无效的红利领取方式');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197018', '10197000', 'C', 'select greatest(?SumPrem?, ?CashValue?)from LDSysvar where sysvar = ''onerow''', '身故保险金(意外)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197015', '10197000', 'C', 'select (select ?Prem?/1000*amnt FROM RT_1970 where AppAge = ''?AppAge?'' and Sex = ''?Sex?'' and PayEndYear = ''?PayEndYear?'')*0.2 from dual', '年金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197014', '10197000', 'V', 'SELECT 1 FROM lcinsured WHERE contno=''?ContNo?'' AND insuredno=''?InsuredNo?'' AND (to_date(''?PolApplyDate?'',''yyyy-mm-dd'')-birthday)>=7 AND ''?AppAge?''<=70', '被保险人超出最大/最小投保年龄');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197013', '10197000', 'C', 'select sumprem *0.2 from lcpol where contno = ''?ContNo?'' and polno = mainpolno', '关爱金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197012', '10197000', 'C', 'SELECT (''?Prem?''/1000)*SB FROM CV_1970 where AppAge=''?AppAge?'' and Sex=''?Sex?'' and PayEndYear=''?PayEndYear?''and Year=''?Interval?''', '生存金（周年日领取）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197011', '10197000', 'E', 'select 1 from lcpol where polno=''?PolNo?'' and ?Prem? >=5000 and mod(?Prem?,1000)=0
', '本险种减保后的保险费不低于5000元，超过5000元的保险费必须是1000元的整数倍');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197010', '10197000', 'E', 'select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (''?Prem?''/1000) else ((cv_end+ sb) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?))/365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?)))/365) * (''?Prem?''/1000) end from CV_1970 WHERE  payendyear = ''?PayEndYear?'' and appage =''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' +1)
', '减保退费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197009', '10197000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197008', '10197000', 'E', 'select 0 from dual', '退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197007', '10197000', 'E', 'select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (select amnt from lcpol where polno = ''?PolNo?'') / Amnt else ((cv_end + sb) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ''?Interval?'')) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ''?Interval?''))) / 365) * (select amnt from lcpol where polno = ''?PolNo?'') / amnt end from CV_1970 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' + 1)', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197006', '10197000', 'C', 'select case when (?RgtDays? <= 180 or ?LRDays? <= 180) then ?SumPrem? else (select greatest(?SumPrem?, ?CashValue?)from LDSysvar where sysvar = ''onerow'') end from dual', '身故保险金(疾病)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197001', '10197000', 'G', 'select ?Prem?/1000*amnt FROM RT_1970 where AppAge = ''?AppAge?'' and Sex = ''?Sex?'' and PayEndYear = ''?PayEndYear?'' AND PayEndYearflag=''?PayEndYearFlag?''', '保费算保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197000', '10197000', 'P', 'select  ''?Prem?'' from dual', '保费算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197005', '10197000', 'E', 'select ?Prem?/1000*cv_end from CV_1970 where payendyear = ''?PayEndYear?'' and appage =''?AppAge?'' and sex = ''?Sex?''  order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197004', '10197000', 'E', 'select paid_up_sum from CV_1970 where payendyear = ''?PayEndYear?'' and appage =''?AppAge?'' and sex = ''?Sex?''  order by YEAR', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197003', '10197000', 'V', 'select 1 from dual where ''?Prem?''>=5000 AND MOD(''?Prem?'',1000)=0', '幸福鑫悦一生B款终身年金保险保费不符合投保规则（最低为5000元，超过5000元的保险费必须是1000元的整数倍）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197002', '10197000', 'E', 'select sb * ''?Amnt?'' / amnt from CV_1970 where appage = ''?AppAge?'' and Sex = ''?Sex?'' and PayEndYear = ''?PayEndYear?'' AND payendyearflag = ''?PayEndYearFlag?'' AND YEAR = ''?Interval?''
', '年金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197016', '10197000', 'C', 'select case when (''?PayEndYear?'' = 1000 ) then (select ''?Prem?''*1*0.2 from dual) else (select ''?Prem?''*''?PayEndYear?''*0.2 from dual) end from dual', '关爱金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199006', '10199000', 'E', 'select case when (select payintv from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1'')) = ''0'' and ((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'')) - (select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'') - nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0) - nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0)) < ''?Prem?'' then null else 1 end from dual', '被关联险种交费方式为一次交清时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额=被关联险种趸交保险费的1倍-趸交保费-累计已追加保费＋部分领取累计金额。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199005', '10199000', 'E', 'select case when (select distinct 1 from lccontrelated where contno = ''?ContNo?'' and relationship=''1'')=1 then 1 else null end from dual', '幸福稳盈一生年金保险（万能型）在保单关联后，才可追加保费。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199004', '10199000', 'G', 'select ?Get? from dual', '年金保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199003', '10199000', 'E', 'select case when ((((select sum(money) from lcinsureacctrace where moneytype = ''BF'' and contno = ''?ContNo?'') / (1 - 0.03))+nvl(((select sum(money) from lcinsureacctrace where moneytype = ''AI'' and contno = ''?ContNo?'') / (1 - 0.01)),0)) * 0.2) >= (?Money? - (select sum(getmoney) / (case when ?Interval? >= 5 then 1 else (1 - ((5 - ?Interval?) * 0.01)) end) from lpedoritem where edortype = ''PD'' and edorvalidate BETWEEN (SELECT add_months((SELECT cvalidate FROM lccont WHERE contno = ''?ContNo?''), 12 * ?Interval?) FROM dual) AND (SELECT add_months((SELECT cvalidate FROM lccont WHERE contno = ''?ContNo?''), 12 * (?Interval? +1)) from dual) and contno = ''?ContNo?'')) then 1 else 0 end from dual', '部分领取每个保单年度部分领取金额不得超过所交保险费的百分之二十。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199002', '10199000', 'G', 'select least(''?Get?'',(select prem from lcpol where contno = ''?ContNo?'' and polno = mainpolno)) from LDSysvar where sysvar = ''onerow''', '年金保险金(重算)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199001', '10199000', 'V', 'select 1 from LDSysvar where sysvar=''onerow'' and ''?Prem?''>=100  and mod(''?Prem?'',100) = 0', '投保本险种每份投保单的最低保险费为100元，最高保险费为1000元，超过100元的保险费必须为100元的整数倍');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199000', '10199000', 'P', 'select case when ''?CalType?'' in (''AA'',''PT'') then (select 0 from dual) else (select ?Mult?*?Prem? from LDSysvar where sysvar=''onerow'') end  from dual', '保费算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199017', '10199000', 'E', 'select ?AliveGetRate?*?CashValue? from dual', '年金保险金(重算)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199016', '10199000', 'E', 'select case when ((((select sum(money) from lcinsureacctrace where moneytype = ''BF'' and contno = ''?ContNo?'') / (1 - 0.03))+nvl(((select sum(money) from lcinsureacctrace where moneytype = ''AI'' and contno = ''?ContNo?'') / (1 - 0.01)),0)) * 0.2) >= ?CashValue?*?AliveGetRate? then 1 else 0 end from dual', '稳盈一生年金保险（万能型）给付生存金不得超过已交保费的20%或个人账户价值。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PDI199', '10199000', 'E', 'select case WHEN EXISTS(select distinct 1 from lccontstate where statetype =''Loan'' and state =''1'' and contno=''?contno?'' and enddate is null) then 0 else 1 end from dual', '存在未清偿贷款的保单不允许受理该保全!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LN1991', '10199000', 'E', 'select insuaccbala  from lcinsureacc where contno=''?ContNo?''and acctype = ''002''', '万能现价');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199031', '10199000', 'E', 'select 1 from dual', '保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('F99092', '10199000', 'F', 'select 1 from dual where ?Intv?<30', '退保时结算期间大于或等于30天扣除管理费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199015', '10199000', 'E', 'select case ?Interval? when 0 then ?Money? * (1 - 0.05) when 1 then ?Money? * (1 - 0.04) when 2 then ?Money? * (1 - 0.03) when 3 then ?Money? * (1 - 0.02) when 4 then ?Money? * (1 - 0.01) else ?Money? end from dual', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('NM1990', '10199000', 'E', 'select case ?Interval? when 0 then ?Money? * (1 - 0.05) when 1 then ?Money? * (1 - 0.04) when 2 then ?Money? * (1 - 0.03) when 3 then ?Money? * (1 - 0.02) when 4 then ?Money? * (1 - 0.01) else ?Money? end from dual', '部分领取');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199012', '10199000', 'C', 'select greatest(?CashValue?, (select (?Prem? +nvl(((select sum(money) from lcinsureacctrace where moneytype = ''AI'' and contno = ''?ContNo?'') / (1 - 0.01)),0)+nvl((select sum(getmoney) from ljagetendorse where feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0) - nvl((select sum(getmoney) from ljagetdraw where feefinatype = ''YF'' and otherno = ''?ContNo?''), 0)) from dual)) from dual', '身故保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199010', '10199000', 'E', 'select ?Prem? * (1-0.01) from dual', '追加保险费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199007', '10199000', 'E', 'select case when (select payendyear from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1''))=''3'' and (((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?''))*20)-(select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'')-nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0)-nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0))<''?Prem?'' then null else 1 end from dual', '被关联险种交费期间为3年时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额=被关联险种年交保险费的20倍-趸交保费-累计已追加保费＋部分领取累计金额。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199008', '10199000', 'E', 'select case when (select payendyear from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1''))=''5'' and (((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?''))*30)-(select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'')-nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0)-nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0))<''?Prem?'' then null else 1 end from dual', '被关联险种交费期间为5年时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额=被关联险种年交保险费的30倍-趸交保费-累计已追加保费＋部分领取累计金额。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199009', '10199000', 'E', 'select case when (select payendyear from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1''))=''10'' and (((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?''))*50)-(select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'')-nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0)-nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0))<''?Prem?'' then null else 1 end from dual', '被关联险种交费期间为10年时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额=被关联险种年交保险费的50倍-趸交保费-累计已追加保费＋部分领取累计金额。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208000', '10208000', 'P', 'select case when ''?CalType?''! =''CS'' then (select ''?ExemptAmnt?'' / ?VPU? * prem from RT_2080 a where a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and a.insuyear = ?InsuYear? and a.sex = (select appntsex from lcappnt where contno = ''?ContNo?'')) else case when exists (select * from lpappnt where edorno=''?EdorNo?'') then (select  nvl(?ExemptAmnt?,0)/?VPU? * prem from RT_2080 a where a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lpappnt where edorno = ''?EdorNo?'') and a.insuyear = ?InsuYear? and a.sex = (select appntsex from lpappnt where EdorNo = ''?EdorNo?'')) else (select nvl(?ExemptAmnt?,0)/?VPU?*prem from RT_2080 a where a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and a.insuyear = ?InsuYear? and a.sex = (select appntsex from lcappnt where contno = ''?ContNo?'')) end end  from dual', '计算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2080', '10208000', 'C', 'select  case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) and ''?GetDutyKind?'' in(''202'',''209'',''203'') then 0 else 1 end case  from dual', '幸福附加投保人豁免保险费定期寿险,自本附加险合同生效日或最后复效日起90天内疾病出险，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208003', '10208000', 'A', 'SELECT nvl(?ExemptAmnt?,0) from dual', '计算保额(基本保险金额为本附加险合同所保障保险合同的年交保险费金额 )');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1208', '10208000', 'O', 'select ?Get? *0.5* (payyears - (select nvl(max(paycount), 1) paycount from ljapayperson where contno = ''?ContNo?'' and paytype = ''ZC'')) from lcpol where contno = ''?ContNo?'' and appflag in (''0'', ''1'') and payintv = 12 and polno = mainpolno and rownum = 1', '被保险人寿险风险保额=基本保险金额×交费期间');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208031', '10208000', 'V', 'select 1 from lcpol where insuredno<>appntno and contno=''?ContNo?''', '投保人、被保险人为同一人不可投保附加投保人豁免定期寿险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208032', '10208000', 'V', 'select 1 from dual where ?InsuYear?+1 = (select payyears from lcpol where contno = ''?ContNo?'' and polno = mainpolno)', '保险期间须为所保障合同的交费年期-1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208033', '10208000', 'V', 'select 1 from dual where ?PayEndYear?+1 = (select payyears from lcpol where contno = ''?ContNo?'' and polno = mainpolno)', '交费期间须为所保障合同的交费年期-1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208034', '10208000', 'V', 'select 1 from dual where ?PayIntv?<>''0''', '本险种所保障的主险及附加险的交费方式为趸交，不可投保附加投保人豁免定期寿险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208035', '10208000', 'V', 'SELECT 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM LCPOL WHERE RISKCODE <> ''10208000'' AND CONTNO = ''?ContNo?'' AND PAYINTV = 12 AND POLNO <> MAINPOLNO AND PAYENDYEAR <> (SELECT PAYENDYEAR FROM LCPOL WHERE CONTNO = ''?ContNo?'' AND POLNO = MAINPOLNO)) AND NOT EXISTS (SELECT 1 FROM LCPOL WHERE RISKCODE <> ''10208000'' AND CONTNO = ''?ContNo?'' AND PAYINTV = 12 AND POLNO <> MAINPOLNO AND PAYENDYEARFLAG <> (SELECT PAYENDYEARFLAG FROM LCPOL WHERE CONTNO = ''?ContNo?'' AND POLNO = MAINPOLNO))', '主险及长期附加险交费期间不一致，不可投保附加投保人豁免定期寿险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208036', '10208000', 'V', 'select 1 from dual where ?InsuYear?+(select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'')<=70', '投保年龄+保险期间超过70');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208020', '10208000', 'E', 'select cv_end from CV_2080 where appyear =(select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and Sex = (select appntsex from lcappnt where contno = ''?ContNo?'') and InsuYear = ?InsuYear?  order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208021', '10208000', 'E', 'select paid_up_sum  from CV_2080 where appyear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'')  and Sex = (select appntsex from lcappnt where contno = ''?ContNo?'') and InsuYear = ?InsuYear? order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208045', '10208000', 'U', 'select 1 from lcappnt a where a.contno=''?ContNo?'' and a.occupationtype not in (''1'', ''2'', ''3'', ''4'')', '被保险人为五、六类职业，本公司不予承保附加投保人豁免定期寿险');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('CVS105', '10208000', 'E', 'select  cv_start * (SELECT NVL(SUM(PREM),0) FROM LCPOL WHERE CONTNO = (select contno from lcpol where polno=''?PolNo?'') AND PAYINTV = 12 AND RISKCODE <> ''10208000'')/amnt  from CV_2080 where payendyear = ?PayEndYear? and appyear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and sex = (select appntsex from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and year = (?Interval? +1) and insuyear = ?InsuYear?', '期初现金价值');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208025', '10208000', 'E', 'select decode(''?EdorType?'',''CT'',nvl((select sum(prem) from lcpol a where a.contno=''?ContNo?'' and a.payintv = 12 and a.appflag=''1'' and a.polno not in (select polno from lppol where edorno=''?EdorNo?'') and exists (select * from lmriskapp where nvl(risktypedetail,''0'')!=''E'' and riskcode=a.riskcode and riskperiod=''L'')),0),(select nvl((select sum(prem) from lppol b where b.edorno=''?EdorNo?'' and b.payintv = 12 and b.appflag=''1'' and exists(select * from lmriskapp where nvl(risktypedetail,''0'')!=''E'' and riskcode=b.riskcode and riskperiod=''L'')),0)+nvl((select sum(prem) from lcpol d where d.contno=''?ContNo?'' and d.payintv = 12 and d.appflag=''1'' and not exists (select * from lppol where polno=d.polno and edorno=''?EdorNo?'') and exists(select * from lmriskapp where nvl(risktypedetail,0)!=''E'' and riskcode=d.riskcode and riskperiod=''L'' )),0) from dual)) from dual', '计算豁免险保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208024', '10208000', 'E', 'select case when exists (select * from lpedoritem where contno =''?ContNo?'' and edortype=''PU'' and edorstate=''0'') then (select trunc(Months_between(to_date(''?ZTPoint?''),edorvalidate) / 12) from lpedoritem where contno=''?ContNo?'' and edortype=''PU'') when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208010', '10208000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(SELECT SUM(PREM) FROM LCPOL WHERE CONTNO = (select contno from lcpol where polno=''?PolNo?'') AND PAYINTV = 12 AND RISKCODE <> ''10208000'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(SELECT SUM(PREM) FROM LCPOL WHERE CONTNO = (select contno from lcpol where polno=''?PolNo?'') AND PAYINTV = 12 AND RISKCODE <> ''10208000'')/amnt end from CV_2080 where payendyear = ?PayEndYear? and appyear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and sex = (select appntsex from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and year = (?Interval? +1) and insuyear = ?InsuYear?
', '现金价值');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208040', '10208000', 'E', 'select case when (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode in (''102'',''103''))=1 then 1  else 0 end from dual', '意外豁免');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208041', '10208000', 'E', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90)) and (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode in (''202'',''203''))=1  then 1  else 0 end from dual', '疾病豁免');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208042', '10208000', 'E', 'select ?SumPrem? From dual', '疾病退保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208043', '10208000', 'E', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90))  then (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode =''203'')  else 0 end from dual', '疾病残疾赔付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208044', '10208000', 'E', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90))  then (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode =''202'') else 0 end from dual', '疾病死亡赔付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208001', '10208000', 'P', 'select ExPrem * ?Get? / ?VPU?  from rt_2080addfee a where a.Sex = (select appntsex from lcappnt where contno = ''?ContNo?'') and a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and a.InsuYear = ?InsuYear? and ?SuppRiskScore? Between a.min_EM and a.max_EM', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210022', '10210000', 'V', 'SELECT CASE WHEN ''?GetYear?'' is not NULL THEN 1 ELSE null END FROM dual', '幸福附加两全保险未填写生存金领取年龄');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210023', '10210000', 'V', 'SELECT CASE WHEN ''?GetYear?'' IN (''28'',''65'',''70'',''80'') THEN 1 ELSE NULL END FROM dual', '幸福附加两全保险生存金领取年龄非28周岁、65周岁、70周岁、80周岁中的一种');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210024', '10210000', 'V', 'SELECT CASE WHEN ''?GetYear?'' in (SELECT distinct LIVEGETYEAR FROM rt_2100 WHERE InsuYear=''?InsuYear?'') THEN 1 ELSE NULL END FROM dual', '幸福附加两全保险保险期间非终身，生存金领取年龄需为被保险人满期年龄');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210002', '10210000', 'P', 'select ''?Get?'' from dual', '保额算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210003', '10210000', 'V', 'select 1 from dual where ''?PayIntv?'' = 12', '交费方式录入错误，幸福附加两全保险的交费方式为年交');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT2101', '10210000', 'E', 'select 1 from dual where ((select amnt from lcpol where polno=''?PolNo?'')-''?Amnt?'')>=1000', '减保比例需与主线相同');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210004', '10210000', 'C', 'select case when (select calroundage(to_date(substr((select distinct insuredbirthday from lcpol where  contno = ''?ContNo?'' and appflag = ''1''),1,10), ''YYYY-MM-DD''),to_date(''?AccidentDate?'', ''YYYY-MM-DD'')) from dual) >= 61 then  greatest(1.2 * ?SumPrem?, ?cashvalue?) when (select calroundage(to_date(substr((select distinct insuredbirthday from lcpol where contno = ''?ContNo?'' and appflag = ''1''),1,10), ''YYYY-MM-DD''),to_date(''?AccidentDate?'', ''YYYY-MM-DD'')) from dual) >= 41 then greatest(1.4 * ?SumPrem?, ?cashvalue?) when (select calroundage(to_date(substr((select distinct insuredbirthday from lcpol where contno = ''?ContNo?'' and appflag = ''1''),1,10), ''YYYY-MM-DD''),to_date(''?AccidentDate?'', ''YYYY-MM-DD'')) from dual) >= 18 then greatest(1.6 * ?SumPrem?, ?cashvalue?) else greatest(?SumPrem?, ?cashvalue?) end from dual', '身故保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210005', '10210000', 'E', 'select 0 from dual', '退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210006', '10210000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210007', '10210000', 'E', 'select cv_end from CV_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?'' and (appage+year)<106 order by year', '现金价值');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210008', '10210000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''210040'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then endbail*?Amnt?/amnt else ((endbail) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + startbail * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_2100 where insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND LIVEGETYEAR=''?GetYear?'' and year = (?Interval? +1)) end from dual
', '现金价值(减保退保)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210009', '10210000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''210040'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then endbail*?Amnt?/amnt else ((endbail) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + startbail * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_2100 where insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND LIVEGETYEAR=''?GetYear?'' and year = (?Interval? +1)) end from dual

', '减保退费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210010', '10210000', 'E', 'select (select prem from lcpol where polno = ''?PolNo?'') *(((select enddate from lcpol where polno = ''?PolNo?'') -(date ''?ZTPoint?'')) /(select enddate - cvalidate from lcpol where polno = ''?PolNo?'')) from dual
', null);

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210011', '10210000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''', '性别年龄变更加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210025', '10210000', 'C', 'select case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else (case when ''?GetAge?''>=61 then greatest(1.2*?SumPrem?,?cashvalue?) when ''?GetAge?''>=41 then greatest(1.4*?SumPrem?,?cashvalue?) when ''?GetAge?''>=18 then greatest(1.6*?SumPrem?,?cashvalue?) else greatest(?SumPrem?,?cashvalue?) end) end from dual', '疾病身故保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210026', '10210000', 'V', 'SELECT 1 FROM lcpol WHERE payendyear=''?PayEndYear?'' AND payendyearflag=''?PayEndYearFlag?'' AND contno=''?ContNo?'' AND polno=''?MainPolNo?''', '本附加险的交费期间应与主险的交费期间相同');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1210', '10210000', 'O', 'select case when insuredappage>=18 then prem*payendyear*0.2 else 0 end from lcpol where contno=''?ContNo?'' and riskcode=''10210000''
', '本险种年交保险费*交费期间*20%；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210000', '10210000', 'P', 'select ''?Get?''*prem/1000 from RT_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?''', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210001', '10210000', 'P', 'select ''?Get?''*prem/1000 from RT_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?''

', '身故保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210020', '10210000', 'P', 'select cv_end from CV_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?'' and (appage+year)<106 order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210021', '10210000', 'P', 'select paid_up_sum from CV_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?'' and (appage+year)<106 order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212013', '10212000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end *?Amnt?/ amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) *?Amnt?/ amnt end from CV_2120 WHERE payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' + 1)) else (select cv_end *?Amnt?/amnt from cv_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '减保退费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212014', '10212000', 'V', 'SELECT CASE WHEN SUM(AMNT) > 1000000 THEN 1 ELSE 0 END FROM LCPOL WHERE RISKCODE = ''10212000'' AND LCPOL.APPFLAG IN (''0'', ''1'') AND LCPOL.UWFLAG NOT IN (''a'', ''1'', ''2'') AND LCPOL.CONTNO IN (SELECT CONTNO FROM LCCONT A  WHERE A.APPFLAG IN (''0'', ''1'')  AND A.UWFLAG NOT IN (''a'', ''1'', ''2'') AND A.INSUREDNO = ''?InsuredNo?'') AND ?AppAge? < 18', '被保险人＜18周岁，传世金生终身寿险累计基本保险金额不超过100万元');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212003', '10212000', 'P', 'select case when ?payintv?=0 then (select case when ?Job?=5 then (select ?Get? / 10000 * 200 from dual) when ?Job? = 6 then (select ?Get? / 10000 *500 from dual) else 0 end from dual) when ?payintv?=12 then (select case when ?Job?=5 then (select ?Get? / 10000 * 20 from dual) when ?Job? = 6 then (select ?Get? / 10000 *50 from dual) else 0 end from dual) else 0 end from dual', '职业加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212020', '10212000', 'E', 'select trunc(''?OldAmnt?'' / ''?VPU?'' * paid_up_sum, 2) from CV_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' AND insuyear = ''?InsuYear?'' and year = ''?Interval?''', '减额缴清后保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212019', '10212000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) then ?SumPrem? else (select case when ''?GetAge?''>=61 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.3*?SumPrem?,?cashvalue?) when ''?GetAge?''>=41 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.5*?SumPrem?,?cashvalue?) when ''?GetAge?''>=18 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.7*?SumPrem?,?cashvalue?) else  greatest(?SumPrem?,?cashvalue?) end from dual) end from dual', '疾病身故或者全残保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212018', '10212000', 'C', 'select case when ''?GetAge?''>=61 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.3*?SumPrem?,?cashvalue?) when ''?GetAge?''>=41 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.5*?SumPrem?,?cashvalue?) when ''?GetAge?''>=18 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.7*?SumPrem?,?cashvalue?) else  greatest(?SumPrem?,?cashvalue?) end from dual', '意外身故或者全残保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0212', '10212000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) then 0 else 1 end from dual', '被保险人自本主险合同生效日或最后复效日起90天内出险，请注意!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212012', '10212000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) * (select amnt from lcpol where polno = ''?PolNo?'') / amnt end from cv_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (?Interval? +1)) else (select cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt from cv_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212011', '10212000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212010', '10212000', 'E', 'select 0 from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212009', '10212000', 'V', 'select case when exists (select * from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'') then (select 1 from dual where (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10212000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) else 1 end from dual', '当附加“幸福附加定期寿险”时，附加险的基本保险金额应小于等于主险基本保险金额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212008', '10212000', 'A', 'select ?Get? from LDSysvar where sysvar=''onerow''', '保额算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1212', '10212000', 'O', 'select case when calroundage(InsuredBirthday, ''?CurrentDate?'')>=18 then amnt Else 0 end from lcpol where insuredno = ''?InsuredNo?'' and riskcode =''10212000'' and appflag in (''0'',''1'',''2'') and  LCPol.Uwflag not in (''1'',''2'',''a'') and polno=''?PolNo?''', '基本保险金额的1倍计入被保险人的寿险风险保额');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212007', '10212000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''
', '客户重要资料变更');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212006', '10212000', 'E', 'select a.paid_up_sum from cv_2120 a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?'' AND (a.appage+a.year)<106 order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212002', '10212000', 'P', 'select ?Get?/?VPU?*extra_premium from rt_2120addfee a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?'' and ''?SuppRiskScore?'' Between min_EM and max_EM', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212001', '10212000', 'P', 'select ?Get?/?VPU?*prem from rt_2120 a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?''', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212015', '10212000', 'V', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=5000 and mod(?Amnt?,1000)=0', '减保后的基本保险金额不低于5000元，且超过5000元的保险金额须为1000元的整数倍。');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212005', '10212000', 'E', 'select cv_end from cv_2120 a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?'' AND (a.appage+a.year)<106 order by YEAR', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212004', '10212000', 'V', 'select 1 from dual where ''?Amnt?''>=50000 AND MOD(''?Amnt?'',1000)=0', '幸福传世金生终身寿险保额不符合投保规则（最低5万元,且超出部分为1000元的整数倍）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT2150', '10215000', 'E', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=10000 and mod(?Amnt?,1000)=0', '本险种减保后的基本保险金额不低于1万元，且超过1万元的保险金额须为1000元的整数倍');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215044', '10215000', 'G', 'select ?Get?*0.2 From dual', '轻症疾病领取金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215017', '10215000', 'C', 'select  case ''?GetDutyKind?'' when ''102'' then (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end) else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end)  end) end from dual', '身故保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215030', '10215000', 'E', 'select a.paid_up_sum from cv_2150 a where a.dutycode in (SELECT dutycode FROM lcduty WHERE contno=''?ContNo?'') and a.insuyear=''?InsuYear?'' and a.insuyearflag=''?InsuYearFlag?'' and a.payendyear=''?PayEndYear?'' and a.payendyearflag=''?PayEndYearFlag?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?'' and (a.appage+a.year)<106 order by year

', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215031', '10215000', 'E', 'select cv_end from cv_2150 a where a.dutycode in (SELECT dutycode FROM lcduty WHERE contno=''?ContNo?'') and a.insuyear=''?InsuYear?'' and a.insuyearflag=''?InsuYearFlag?'' and a.payendyear=''?PayEndYear?'' and a.payendyearflag=''?PayEndYearFlag?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?'' and (a.appage+a.year)<106 order by year
', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215033', '10215000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''215042'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*?Amnt?/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_2150 where dutycode=''?DutyCode?'' and insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? and year = (?Interval? +1)) end from dual', '减保退费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215034', '10215000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''215042'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end ) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_2150 where dutycode=''?DutyCode?'' and insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? and year = (?Interval? +1)) end from dual', '现金价值计算保单现金价值（退保金、协议退保、减保退费、贷款时计算现价）');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215035', '10215000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '计算保单年度');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215036', '10215000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''', '性别年龄变更加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215041', '10215000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''215042'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end ) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_2150 where dutycode=''?DutyCode?'' and insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? and year = (?Interval? +1)) end from dual', '退保金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2150', '10215000', 'C', 'select case (select 1 from lcpol where  ''?GetAge?''>=80 and riskcode=''10215000'' and contno=''?ContNo?'' and exists(select 1 from lcduty b where dutycode=''215001'' and contno = ''?ContNo?'')) when 1 then 0 else 1 end from dual', '本主险合同的保险期间，再次确诊患恶性肿瘤时被保险人须处于80周岁保险单周年日（不含）之前');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2151', '10215000', 'C', 'select case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215042'' and b.givetype=''0'' and b.contno=''?ContNo?'')) >= 1 then (case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215042'' and b.givetype=''0'' and b.contno=''?ContNo?'')) < 5 then 0 else 1 end) else (case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215040'' and b.givetype=''0'' and b.contno=''?ContNo?'')) >= 1 then (case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215040'' and b.givetype=''0'' and b.contno=''?ContNo?'')) < 5 then 0 else 1 end) else 1 end) end from dual', '请注意出险疾病是否满足疾病组别和相关时间限制要求');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215042', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease where diseasetype = ''Middle'' and clmno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' ) then (case ''?GetDutyKind?'' when ''104'' then ?Je_gf? else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else ?Je_gf? end) end) else 0 end from dual', '中症疾病保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215046', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Middle'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and substr(c.diseasecode, 3, 3) between 1 and 20) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutykind in (''109'',''209'') and b.givetype = ''0'' and b.polno = ''?PolNo?'')) when 0 then (case  when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''204'') then (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then 1 else 0 end) else (case when exists (select distinct 1 from LLAppClaimReason a  where a.caseno = ''?CaseNo?'' and a.reasoncode = ''104'') then 1  else 0 end) end) else 0 end) else 0 end from dual', '中症疾病豁免保险费过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2152', '10215000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) and ''?GetDutyKind?'' in (''204'',''202'') then 0 else 1 end from dual', '被保险人自本主险合同生效日或最后复效日起90天内疾病出险，请注意!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215043', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Middle'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?''and substr(c.diseasecode, 3, 3) between 1 and 20  and not exists (select 1 from Llclaimdiseasedetail where riskcode=''10215000'' and diseasetype = ''Middle'' and customerno = ''?InsuredNo?'' and diseasecode = c.diseasecode)) then ( case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215041'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) < 2 then (case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''214042'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) > 0 then 0 else 1 end) else 0 end ) else  0 end from dual', '中症疾病保险金过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215045', '10215000', 'G', 'select ?Get?*0.5 From dual', '中症疾病领取金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2153', '10215000', 'C', 'select case when (select count(distinct getdutycode) from llclaimdetail where clmno =''?ClmNo?'' and riskcode =''10215000'' and getdutycode in(''215040'',''215041'',''215042'') and GiveType=''0'') >1  then 0 else 1 end from dual', '本赔案同一理赔类型匹配出：“轻症疾病责任”,“中症疾病责任”，“重大疾病责任”中的多种责任，请注意！');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2154', '10215000', 'C', 'select case when exists (select 1  from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and substr(c.diseasecode, length(c.diseasecode) - 2, 3) between 1 and 105 and exists (select 1 from LLDiseaseGroup a where a.riskcode = ''10215000'' and a.diseasetype = ''General'' and a.diseasecode = c.diseasecode) and not exists (select 1 from LLSeriousDisease  where diseasetype = ''General'' and clmno <> ''?CaseNo?'' and customerno = ''?InsuredNo?'' and diseasecode = c.diseasecode)) and exists (select distinct 1 from llclaim b, llclaimdetail c where b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.contno = (select a.contno from lcpol a where a.polno = ''?PolNo?''))and exists (SELECT 1 FROM lldiseasegroup WHERE riskcode = ''10215000'' and diseasegroup not in (SELECT distinct diseasegroup FROM lldiseasegroup WHERE riskcode = ''10215000'' and diseasecode in (select diseasecode from llseriousdisease WHERE caseno <> ''?CaseNo?'' and customerno = ''?InsuredNo?'' and diseasetype = ''General'')) and diseasecode in (select diseasecode from llseriousdisease where diseasetype = ''General'' and caseno = ''?CaseNo?'')) then (case when nvl((select accdate - (select max(accdate) from llcase a where a.caseno <> ''?CaseNo?'' and exists (select 1 from llclaim b, llclaimdetail c where a.caseno = b.clmno and b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.contno = (select a.contno from lcpol a where a.polno = ''?PolNo?''))) from llcase where caseno = ''?CaseNo?''), 181) > 180 then 0 else 1 end) else 1 end from dual', '在本主险合同有效期内，若被保险人在确诊首次患本主险合同所指的重大疾病中的一种之日起不满180日后（不含第180日），经认可医院的专科医生再次确诊首次患本主险合同所指的重大疾病中的另外一种（不包括已确诊的重大疾病所属组别的重大疾病）,请注意');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215032', '10215000', 'E', 'select 0 from dual', '退保、协议退保手续费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215016', '10215000', 'C', 'select a.* from LCPrem a where 1=1  and (trim(FreeFlag) = ''0'' or trim(FreeFlag) is null) and urgepayflag =''Y'' and a.contno = ''?Contno?'' and polno in (select polno from lcpol where contno = ''?Contno?'' and riskcode = ''10215000'')', '轻症疾病豁免保险费、中症疾病豁免保险费、重大疾病豁免保险费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215015', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''GT001'', ''GT047'')) and exists (select distinct 1 from LLAppClaimReason where ReasonType = ''01'' and caseno = ''?CaseNo?'') then (case when (select count(1) from lcduty b where dutycode = ''215001'' and contno = (select contno from lcpol a where a.polno = ''?PolNo?'')) >= 1 then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.givetype = ''0'' and b.clmno = a.clmno and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?'')) and exists ( select 1 from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno <> ''?CaseNo?'' and c.clmno = a.clmno and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''GT001'', ''GT047'')) and exists (select 1 from LLAppClaimReason c where c.caseno = a.clmno and c.reasontype = ''01'')) when 1 then (case when ((select to_date(to_char(add_months((select max(accdate)  from llcase a  where a.caseno <> ''?CaseNo?'' and exists (select 1 from llclaim b, llclaimdetail c where a.caseno = b.clmno and b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))), 36), ''yyyy-mm-dd''), ''yyyy-mm-dd'') from dual) < (select accdate from llcase where caseno = ''?CaseNo?'')) then 1 else 0 end) else 0 end)  else 0 end) else 0 end from dual', '可选责任给付过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215014', '10215000', 'C', 'select case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?CaseNo?'' and b.clmno=a.clmno and b.getdutycode in(''215042'',''215043'') and b.givetype=''0'' and b.contno=(select contno from lcpol a where a.polno=''?PolNo?''))) > 0 then 0 else 1 end from dual', '身故保险金过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215013', '10215000', 'C', 'select case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?CaseNo?'' and b.clmno=a.clmno and b.getdutycode=''215042'' and b.givetype=''0'' and b.contno=(select contno from lcpol a where a.polno=''?PolNo?''))) > 0 then 0 else 1 end from dual', '疾病终末期保险金过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215012', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and exists (SELECT 1 FROM lldiseasegroup b WHERE b.riskcode = ''10215000'' and b.diseasetype = ''General'' and b.diseasecode = c.diseasecode and not exists (select 1 from Llclaimdiseasedetail where riskcode = ''10215000'' and diseasetype = ''General'' and polno = ''?PolNo?'' and diseasegroup = b.diseasegroup))) then (case when nvl((select accdate - (select max(accdate) from llcase a where a.caseno <> ''?CaseNo?'' and exists (select 1 from llclaim b, llclaimdetail c where a.caseno = b.clmno and b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.polno = ''?PolNo?'')) from llcase where caseno = ''?CaseNo?''), 181) > 180 then (case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.polno = ''?PolNo?'')) < 5 then 1 else 0 end) else 0 end) else 0 end from dual', '重大疾病保险金过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215011', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Slight'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''ST005'',''ST011'',''ST015'',''ST023'',''ST026'',''ST031'',''ST035'',''ST036'',''ST037'',''ST038'',''ST039'',''ST040'',''ST041'',''ST042'',''ST043'',''ST045'',''ST047'',''ST050'',''ST052'',''ST053'',''ST054'',''ST055'',''ST057'',''ST059'',''ST060'',''ST064'',''ST065'',''ST066'',''ST067'',''ST068'',''ST069'',''ST074'',''ST075'',''ST076'',''ST077'') and not exists (select 1 from Llclaimdiseasedetail where riskcode=''10215000'' and diseasetype = ''Slight'' and customerno = ''?InsuredNo?'' and diseasecode = c.diseasecode)) then ( case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215040'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) < 3 then (case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b  where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) > 0 then 0 else 1 end) else 0 end ) else 0 end from dual', '轻症疾病保险金过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215010', '10215000', 'C', 'select case  when exists (select 1  from LLSeriousDisease where diseasetype = ''General'' and clmno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' and diseasecode in (''GT001'', ''GT047'')) and ''?GetAge?''<80 then (case  when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1  from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.givetype = ''0'' and b.clmno = a.clmno and b.contno = ''?ContNo?'' and exists (select 1  from LLAppClaimReason c where c.caseno = a.clmno and c.reasontype = ''01'') and exists (select 1 from llclaimdiseasedetail where  diseasecode in (''GT001'', ''GT047'') and clmno = a.clmno)))  when 1 then ?Amnt?  else 0 end) else 0 end) else 0 end  from dual', '可选责任给付');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1215', '10215000', 'O', 'SELECT case when ''?AppAge?''>=18 then (SELECT ''?Get?''*1 FROM dual) else 0 end FROM dual', '1）被保险人＜18周岁，本险种不计算寿险风险保额；
2）被保险人≥18周岁，以基本保险金额的1倍计入被保险人的寿险风险保额；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215006', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease where diseasetype = ''General''  and clmno = ''?CaseNo?'' and customerno = ''?InsuredNo?'') then (select case ''?GetDutyKind?'' when ''104'' then (case (select count(1)  from llclaim a  where clmstate in (''50'', ''60'') and exists (select 1  from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.contno = ''?ContNo?'')) when 0 then greatest(?SumPrem?, ?Amnt?, ?cashvalue?)  else  ?Amnt?  end) else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then  ?SumPrem? else (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.contno = ''?ContNo?'')) when 0 then greatest(?SumPrem?, ?Amnt?, ?cashvalue?) else ?Amnt? end) end) end from dual) else 0 end from dual', '重大疾病保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215005', '10215000', 'C', 'select case when exists(select 1 from LLSeriousDisease where diseasetype = ''Slight'' and clmno=''?CaseNo?'' and customerno = ''?InsuredNo?'') then ( case ''?GetDutyKind?'' when ''104'' then ?Je_gf? else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else ?Je_gf?  end) end ) else 0 end from dual', '轻症疾病保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215004', '10215000', 'V', 'select 1 from dual where ''?PayIntv?'' = ''12''', '交费方式录入错误，幸福健康人生尊享版重大疾病保险的交费方式为年交');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215003', '10215000', 'P', 'select case when ?Job?=5 then (select ?Get? / 10000 * 20 from dual) when ?Job? = 6 then (select ?Get? / 10000 *50 from dual) else 0 end from dual', '职业加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215002', '10215000', 'P', 'select ?Get?/1000*prem from rt_2150addfee a where a.dutycode=''?DutyCode?'' and a.insuyear=''?InsuYear?'' and a.payendyear=''?PayEndYear?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?'' and ''?SuppRiskScore?'' Between min_EM and max_EM
', '健康加费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215001', '10215000', 'P', 'SELECT ?Get?/1000*prem FROM rt_2150 a WHERE a.dutycode=''?DutyCode?'' and a.insuyear=''?InsuYear?'' and a.insuyearflag=''?InsuYearFlag?'' and a.payendyear=''?PayEndYear?'' and a.payendyearflag=''?PayEndYearFlag?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?''', '保额算保费');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215000', '10215000', 'G', 'select ?Get? From dual', '保额算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215020', '10215000', 'V', 'select 1 from dual where ''?Amnt?''>=10000 AND MOD(''?Amnt?'',1000)=0', '投保本险种每份投保单的最低基本保险金额为1万元，超过1万元的保险金额须为1000元的整数倍
');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX2215', '10215000', 'O', 'SELECT case when ''?DutyCode?''=215000 then (SELECT ''?Get?''*1.3 FROM dual) else (SELECT ''?Get?''*1.6 FROM dual) end FROM dual
', '3）不含可选责任，以基本保险金额的1.5倍计入被保险人的重大疾病风险保额；
4）含可选责任，以基本保险金额的1.8倍计入被保险人的重大疾病风险保额；
5）产品推动期重大疾病风险保额的计算（产品推动期为产品起售3个月内）：
a）不含可选责任，以基本保险金额的1.3倍计入被保险人的重大疾病风险保额；
b）含可选责任，以基本保险金额的1.6倍计入被保险人的重大疾病风险保额；');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215009', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c  where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and exists (select 1 from LLDiseaseGroup a where a.riskcode = ''10215000'' and a.diseasetype = ''General'' and a.diseasecode = c.diseasecode)) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b  where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutykind in (''109'',''209'') and b.givetype = ''0'' and b.polno = ''?PolNo?'')) when 0 then (case when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''204'') then (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then 1 else 0 end) else (case when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''104'') then 1 else 0 end) end) else 0 end) else 0 end from dual', '重大疾病豁免保险费过滤算法');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215007', '10215000', 'C', 'select  case ''?GetDutyKind?'' when ''104'' then (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end) else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end)  end) end from dual', '疾病终末期保险金');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215008', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Slight'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''ST005'',''ST011'',''ST015'',''ST023'',''ST026'',''ST031'',''ST035'',''ST036'',''ST037'',''ST038'',''ST039'',''ST040'',''ST041'',''ST042'',''ST043'',''ST045'',''ST047'',''ST050'',''ST052'',''ST053'',''ST054'',''ST055'',''ST057'',''ST059'',''ST060'',''ST064'',''ST065'',''ST066'',''ST067'',''ST068'',''ST069'',''ST074'',''ST075'',''ST076'',''ST077'')) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutykind in (''109'',''209'') and b.givetype = ''0'' and b.polno = ''?PolNo?'')) when 0 then (case when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''204'') then (case  when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then 1 else 0 end) else (case when exists (select distinct 1 from LLAppClaimReason a  where a.caseno = ''?CaseNo?'' and a.reasoncode = ''104'') then 1 else 0 end) end) else 0 end) else 0 end from dual', '轻症疾病豁免保险费过滤算法');

prompt Done.
