prompt Importing table LMCalMode...
set feedback off
set define off
insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162009', '10162000', 'V', 'select case when exists (select * from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'') then (select 1 from dual where (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) else 1 end from dual', '�����ӡ��Ҹ����Ӷ������ա�ʱ�������յĻ������ս��ӦС�ڵ������ջ������ս��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162010', '10162000', 'E', 'select 0 from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162011', '10162000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162012', '10162000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) * (select amnt from lcpol where polno = ''?PolNo?'') / amnt end from cv_1620 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (?Interval? +1)) else (select cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt from cv_1620 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162013', '10162000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end *?Amnt?/ amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) *?Amnt?/ amnt end from CV_1620 WHERE payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' + 1)) else (select cv_end *?Amnt?/amnt from cv_1620 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '�����˷�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162014', '10162000', 'V', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=10000 and mod(?Amnt?,1000)=0', '�����ּ�����Ļ������ս�����1��Ԫ���ҳ���1��Ԫ�ı��ս����Ϊ1000Ԫ��������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162015', '10162000', 'V', 'select case when exists (select 1 from lppol where edorno = ''?EdorNo?'' and edortype = ''?EdorType?'' and contno=''?ContNo?'' and riskcode=''10031000'') then (select 1 from lcpol a where contno=''?ContNo?'' and riskcode=''10162000'' and (a.amnt - ?Amnt?) >= NVL((select amnt from lppol WHERE edorno = ''?EdorNo?''  and edortype = ''?EdorType?'' and contno=''?ContNo?'' and riskcode=''10031000''), 0))  else (select 1 from lcpol a where contno=''?ContNo?'' and riskcode=''10162000'' and (a.amnt - ?Amnt?) >= NVL((SELECT amnt from lcpol where contno=''?ContNo?'' and riskcode=''10031000''), 0))  end  from dual', '�����ּ���ʱ�������ָ��ӡ��Ҹ����Ӷ������ա������ջ������ս��ó������ջ������ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162016', '10162000', 'V', 'select case when not exists (select 1 from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'') then 1 else (case when exists (select 1 from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10031000'') then (case when exists (select 1 from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') then (select 1 from dual where (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10031000'')) else (select 1 from dual where (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10031000'')) end) else (case when exists (select 1 from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') then (select 1 from dual where (select nvl(amnt, 0) from lppol where contno = ''?ContNo?'' and edorno = ''?EdorNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) else (select 1 from dual where (select nvl(amnt, 0) from lcpol  where contno = ''?ContNo?'' and riskcode = ''10162000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) end) end) end from dual', '�����ּ���ʱ�������ָ��ӡ��Ҹ����Ӷ������ա������ջ������ս��ó������ջ������ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0162', '10162000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180)) then 0 else 1 end from dual', '���������Ա����պ�ͬ��Ч�ջ����Ч����180���ڳ��գ���ע��!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL1621', '10162000', 'C', 'select case when (select count(distinct getdutycode) from llclaimdetail where clmno =''?ClmNo?'' and riskcode =''10162000'' and getdutycode in(''162040'',''162041'',''162042'',''162043'') and GiveType=''0'') >1  then 0 else 1 end from dual', '�ش󼲲����ս���ʱ��ս�ȫ�б��ս��뼲����ĩ�ڱ��ս�ͬʱֻ����ȡһ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162018', '10162000', 'C', 'select case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180)   then ''?TotalPrem?''  else ''?Je_gf?'' end from dual', '�򼲲������ش󼲲�����ʣ�ȫ�У�������ĩ�ڱ��ս����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162019', '10162000', 'C', 'select ''?Je_gf?'' from dual', '�������¹ʵ����ش󼲲�����ʣ�ȫ�У�������ĩ�ڱ��ս����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162020', '10162000', 'C', 'select  ?Je_gf? from dual', '�����������Ʊ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162021', '10162000', 'C', 'select  case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180)  then ?TotalPrem? else ?Je_gf? End from dual', '�����������Ʊ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162022', '10162000', 'C', 'select case when (select count(*) from LLSeriousDisease where  diseasetype = ''Early'' and diseasecode in  (''ET007'', ''ET008'', ''ET009'',''ET010'', ''ET011'', ''ET012'', ''ET013'', ''ET014'', ''ET015'', ''ET016'', ''ET017'', ''ET018'', ''ET019'', ''ET020'', ''ET021'')  and  clmno = ''?CaseNo?'' and caseno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' ) = 0 then 0 else 1 end from dual
', '�������ƹ����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162023', '10162000', 'G', 'select ?Get?*0.2 from LDSysvar where sysvar=''onerow''', '�������Ʊ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162024', '10162000', 'G', 'select a.* from LCPrem a where 1=1  and (trim(FreeFlag) = ''0'' or trim(FreeFlag) is null) and urgepayflag =''Y'' and a.contno = ''?Contno?'' and polno in (select polno from lcpol where contno = ''?Contno?'' and riskcode = ''10162000'')', '�������ƻ��Ᵽ�շ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162025', '10162000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' > 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 180)) and (select distinct 1 from LLSeriousDisease  where diseasetype = ''Early''  and diseasecode in (''ET007'', ''ET008'', ''ET009'',''ET010'', ''ET011'', ''ET012'', ''ET013'', ''ET014'', ''ET015'', ''ET016'', ''ET017'', ''ET018'', ''ET019'', ''ET020'', ''ET021'') and clmno = ''?CaseNo?'' and caseno = ''?CaseNo?'' and customerno = ''?InsuredNo?'') = 1 then 1 else 0 end  from dual


', '�����������ƻ�������㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162002', '10162000', 'P', 'select ?Get?/?VPU?*extra_premium from rt_1620addfee a where a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear? and ''?SuppRiskScore?'' Between min_EM and max_EM', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162003', '10162000', 'P', 'select case when ?Job?=5 then (select ?Get? / 10000 * 20 from dual) when ?Job? = 6 then (select ?Get? / 10000 *50 from dual) else 0 end from dual', 'ְҵ�ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162001', '10162000', 'P', 'select ?Get?/?VPU?*prem from rt_1620 a where a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear?', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162004', '10162000', 'V', 'select 1 from dual where ''?Amnt?''>=10000 AND MOD(''?Amnt?'',1000)=0', '�Ҹ����������ش󼲲����ձ������Ͷ���������1��Ԫ,�ҳ�������Ϊ1000Ԫ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162005', '10162000', 'E', 'select cv_end from cv_1620 a where  (a.appage+a.year)<106 AND a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear? order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162006', '10162000', 'E', 'select a.paid_up_sum from cv_1620 a where  (a.appage+a.year)<106 AND a.sex=''?Sex?'' and a.appage=?AppAge? and a.payendyear=?PayEndYear? order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162007', '10162000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''
', '�ͻ���Ҫ���ϱ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1162', '10162000', 'O', 'select ?Get? From dual', '�������ս���1�����뱻�����˵����շ��ձ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX2162', '10162000', 'O', 'select ?Get? From dual', '�������ս���1�����뱻�����˵��ش󼲲����ձ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('162008', '10162000', 'A', 'select ?Get? from LDSysvar where sysvar=''onerow''', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183001', '10183000', 'G', 'SELECT ?Get? FROM dual', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183053', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501034'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�Ȼ���˾����0501034����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183002', '10183000', 'A', 'select ?Get? from dual', '�����㷨(������ʻ�ȫ�б��ս�)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183003', '10183000', 'A', 'SELECT 10*?Get? FROM dual', '�����㷨���Լݳ�������ʻ�ȫ�б��ս𡢸���������ʻ�ȫ�б��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183004', '10183000', 'A', 'SELECT 5*?Get? FROM dual', '�����㷨��ˮ½������ͨ����������ʻ�ȫ�б��ս��ش���Ȼ�ֺ�������ʻ�ȫ�б��ս𡢵���������ʻ�ȫ�б��ս𡢷����ڼ���������ʻ�ȫ�б��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183005', '10183000', 'A', 'SELECT 20*?Get? FROM dual', '�����㷨(���չ�����ͨ����������ʻ�ȫ�б��ս�)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183006', '10183000', 'A', 'SELECT ?payEndYear?*?Get?/amnt*prem FROM rt_1830 WHERE age=?AppAge? and sex=''?Sex?'' AND insuyear=?InsuYear? AND PayEndYear=?PayEndYear?', '�����㷨�����ڱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183007', '10183000', 'A', 'select ?Get? From dual', '�����㷨��һ��������ʻ�ȫ�б��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183008', '10183000', 'C', 'select case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 180) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 180) then ?SumPrem? else (case when to_Date(''?InjuryDate?'', ''YYYY-MM-DD'')>= add_months((Select birthday From lcinsured lc Where lc.contno in (select contno from lcpol where polno = ''?PolNo?'') And lc.Insuredno = ''?InsuredNo?''), 61 * 12) then greatest(1.2*?SumPrem?,?cashvalue?) when to_Date(''?InjuryDate?'', ''YYYY-MM-DD'')< add_months((Select birthday From lcinsured lc Where lc.contno in (select contno from lcpol where polno = ''?PolNo?'') And lc.Insuredno = ''?InsuredNo?''), 41 * 12) then greatest(1.6*?SumPrem?,?cashvalue?) else greatest(1.4*?SumPrem?,?cashvalue?) end) end from dual', '������ʻ�ȫ�б��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183009', '10183000', 'C', 'select ?je_gf? from  dual', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183010', '10183000', 'G', 'select ?SumPrem? From ldsysvar where sysvar=''onerow''', '���ڱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183011', '10183000', 'V', 'select case when count(*)>0 then 1 else 0 end from dual where ?AppAge?>=18 and ?AppAge?<=55', '�������˳������/��СͶ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183012', '10183000', 'V', 'select 1 from LDSysvar where sysvar=''onerow'' and ?Amnt?>=50000 and mod(?Amnt?,10000)=0', '�������Ͷ���������5��Ԫ,�ҳ�������Ϊ1��Ԫ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183013', '10183000', 'V', 'select 1 from dual where ?PayIntv? = 12', '���ѷ�ʽ¼����󣬰����ı���ȫ���յĽ��ѷ�ʽΪ�꽻');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183015', '10183000', 'V', 'select 1 from dual where (?payEndYear? = 5 and ''?payendyearFlag?''=''Y'') or (?payEndYear? = 10 and ''?payendyearFlag?''=''Y'')', '�����ڼ�¼����󣬰����ı���ȫ���յĽ����ڼ�Ϊ5�ꡢ10��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183014', '10183000', 'V', 'select 1 from dual where (?InsuYear? = 20 and ''?InsuYearFlag?'' = ''Y'') or (?InsuYear? = 30 and ''?InsuYearFlag?'' = ''Y'')', '�����ڼ�¼����󣬰����ı���ȫ���յı����ڼ�Ϊ20�ꡢ30��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183030', '10183000', 'U', 'select count(1) from ldsysvar where sysvar=''onerow'' and ?Job?>=5', '�����ı���������ְҵ��1-4��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183031', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501032'' and i.contno=''?contno?''', '�����ı���������ְҵΪ��ͳ�˾����0501032����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183032', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501033'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�Ƴ̳�˾����0501033����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183033', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501007'' and i.contno=''?contno?''', '�����ı���������ְҵΪ������˾��������Ա��0501007����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183034', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501008'' and i.contno=''?contno?''', '�����ı���������ְҵΪ���˳�˾��������Ա��0501008����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183035', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501010'' and i.contno=''?contno?''', '�����ı���������ְҵΪ���û���˾�����泵���ˣ�0501010����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183036', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501011'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�������ֳ���0501011����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183037', '10183000', 'U', 'select 1 from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0501022'' and i.contno=''?contno?''', '�����ı���������ְҵΪ����˾�����泵���ˣ�0501022����Ϊ�ܱ�ְҵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183038', '10183000', 'U', 'SELECT CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>2000000 THEN 1 ELSE 0 END FROM dual where substr(''?ManageCom?'', 0, 4) IN (''8601'', ''8607'', ''8610'' ,''8619'',''8624'',''8637'') or substr(''?ManageCom?'', 0, 6) IN (''861100'',''861200'',''862300'')', '�����ı��Լݳ������շ��ձ������޳�200�򣨱������������Ϻ����ൺ�����ڡ����ݷֹ�˾�����ա��㽭���㶫�ֹ�˾������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183039', '10183000', 'U', 'SELECT CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>1500000 THEN 1 ELSE 0 END FROM dual where substr(''?ManageCom?'', 0, 6) IN (''862700'',''860300'',''860400'',''860600'',''860604'',''861400'',''861500'',''861800'',''862000'',''862100'',''862200'',''862800'',''863200'',''863300'',''863204'')
', '�����ı��Լݳ������շ��ձ������޳�150�����졢�ӱ���ɽ�������������ա�������ɽ�������ϡ����������ϡ��Ĵ�������������ֹ�˾������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183040', '10183000', 'U', 'SELECT CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>1000000 THEN 1 ELSE 0 END FROM dual where substr(''?ManageCom?'', 0, 4) not IN (''8601'', ''8607'', ''8610'' ,''8619'',''8624'',''8637'') and substr(''?ManageCom?'', 0, 6) not IN (''860300'',''860400'',''860600'',''860604'',''861400'',''861500'',''861800'',''862000'',''862100'',''862200'',''862700'',''862800'',''863200'',''863300'',''861100'',''861200'',''862300'',''863204'')
', '�����ı��Լݳ������շ��ձ������޳�100������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183041', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101004'' and i.contno=''?contno?''', '�����ı���������ְҵΪ��ũ��0101004�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183042', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101005'' and i.contno=''?contno?''', '�����ı���������ְҵΪ����������Ա��0101005�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183043', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101006'' and i.contno=''?contno?''', '�����ı���������ְҵΪ����������Ա��0101006�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183044', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''0101012'' and i.contno=''?contno?''', '�����ı���������ְҵΪ��Ȼ��\������ֲ��Ա��0101012�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183045', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501004'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�����̣�1501004�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183046', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501005'' and i.contno=''?contno?''', '�����ı���������ְҵΪ���̣�1501005�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183047', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501008'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�����̣�1501008�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183048', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501026'' and i.contno=''?contno?''', '�����ı���������ְҵΪ���������̣�1501026�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183049', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501027'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�㷷��1501027�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183050', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501028'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�ⷷ��1501028�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183052', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501034'' and i.contno=''?contno?''', '�����ı���������ְҵΪ�ֹ���Ʒ�����̣�1501034�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX7183', '10183000', '0', 'select ?Get? From dual', '�������ս���1�����뱻�����˵����շ��ձ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX8101', '10183000', '0', 'select 10*?Get? From dual', '�Ի������ս���10�����뱻�����˵��Լݳ������շ��ձ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183060', '10183000', 'E', 'select cv_end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183061', '10183000', 'E', 'select paid_up_sum from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183051', '10183000', 'U', 'select CASE  WHEN healthyamnt2(''?InsuredNo?'', '''', ''81'', ''?CurrentDate?'')>500000 THEN 1 ELSE 0 end from LDSysvar s, lcinsured i where sysvar = ''onerow'' and i.insuredno = ''?InsuredNo?'' and i.occupationcode = ''1501032'' and i.contno=''?contno?''', '�����ı���������ְҵΪ��ѧԭ���̣�1501032�����Լݳ������շ��ձ������޳�50��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183062', '10183000', 'E', 'select case when a.payendyear = 1000 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''', '�ͻ���Ҫ���ϱ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183063', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183064', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end ) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? and year = (?Interval? +1)', '�ֽ��ֵ���㱣���ֽ��ֵ���˱���Э���˱��������˷ѡ�����ʱ�����ּۣ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183065', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? and year = (?Interval? +1)', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT1830', '10183000', 'E', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=50000 and mod(?Amnt?,10000)=0', '�����ּ��������ͱ���Ϊ5��Ԫ������5��Ԫ�ı��������1��Ԫ��������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183066', '10183000', 'E', 'select 0 from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183067', '10183000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*?Amnt?/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_1830 where Sex=?Sex? and insuyear=?InsuYear?  and PayEndYear=?PayEndYear? and appage=?AppAge? and year = (?Interval? +1)', '�����˷�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL1830', '10183000', 'C', 'select case  when (to_date(''?DangerDate?'', ''YYYY-MM-DD'') - to_date(''?AccDate?'', ''YYYY-MM-DD'') > 180) and substr(''?GetDutyKind?'',0,1) = ''1'' then 0 else 1 end  from dual', '��������-�¹�����>180�죬��ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('183000', '10183000', 'P', 'SELECT ?Get?/amnt*prem FROM rt_1830 WHERE age=?AppAge? and sex=''?Sex?'' AND insuyear=?InsuYear? AND PayEndYear=?PayEndYear? AND insuyearflag=''?InsuYearFlag?'' AND PayEndYearflag=''?PayEndYearFlag?''
', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197017', '10197000', 'V', 'select case (select bonusgetmode from lcpol where contno=''?ContNo?''and riskcode=''10197000'') when ''1'' then 1 when ''2'' then 1 when ''3'' then 1 else null end from dual', '��Ч�ĺ�����ȡ��ʽ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197018', '10197000', 'C', 'select greatest(?SumPrem?, ?CashValue?)from LDSysvar where sysvar = ''onerow''', '��ʱ��ս�(����)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197015', '10197000', 'C', 'select (select ?Prem?/1000*amnt FROM RT_1970 where AppAge = ''?AppAge?'' and Sex = ''?Sex?'' and PayEndYear = ''?PayEndYear?'')*0.2 from dual', '���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197014', '10197000', 'V', 'SELECT 1 FROM lcinsured WHERE contno=''?ContNo?'' AND insuredno=''?InsuredNo?'' AND (to_date(''?PolApplyDate?'',''yyyy-mm-dd'')-birthday)>=7 AND ''?AppAge?''<=70', '�������˳������/��СͶ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197013', '10197000', 'C', 'select sumprem *0.2 from lcpol where contno = ''?ContNo?'' and polno = mainpolno', '�ذ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197012', '10197000', 'C', 'SELECT (''?Prem?''/1000)*SB FROM CV_1970 where AppAge=''?AppAge?'' and Sex=''?Sex?'' and PayEndYear=''?PayEndYear?''and Year=''?Interval?''', '�������������ȡ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197011', '10197000', 'E', 'select 1 from lcpol where polno=''?PolNo?'' and ?Prem? >=5000 and mod(?Prem?,1000)=0
', '�����ּ�����ı��շѲ�����5000Ԫ������5000Ԫ�ı��շѱ�����1000Ԫ��������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197010', '10197000', 'E', 'select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (''?Prem?''/1000) else ((cv_end+ sb) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?))/365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?)))/365) * (''?Prem?''/1000) end from CV_1970 WHERE  payendyear = ''?PayEndYear?'' and appage =''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' +1)
', '�����˷�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197009', '10197000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197008', '10197000', 'E', 'select 0 from dual', '�˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197007', '10197000', 'E', 'select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (select amnt from lcpol where polno = ''?PolNo?'') / Amnt else ((cv_end + sb) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ''?Interval?'')) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ''?Interval?''))) / 365) * (select amnt from lcpol where polno = ''?PolNo?'') / amnt end from CV_1970 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' + 1)', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197006', '10197000', 'C', 'select case when (?RgtDays? <= 180 or ?LRDays? <= 180) then ?SumPrem? else (select greatest(?SumPrem?, ?CashValue?)from LDSysvar where sysvar = ''onerow'') end from dual', '��ʱ��ս�(����)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197001', '10197000', 'G', 'select ?Prem?/1000*amnt FROM RT_1970 where AppAge = ''?AppAge?'' and Sex = ''?Sex?'' and PayEndYear = ''?PayEndYear?'' AND PayEndYearflag=''?PayEndYearFlag?''', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197000', '10197000', 'P', 'select  ''?Prem?'' from dual', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197005', '10197000', 'E', 'select ?Prem?/1000*cv_end from CV_1970 where payendyear = ''?PayEndYear?'' and appage =''?AppAge?'' and sex = ''?Sex?''  order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197004', '10197000', 'E', 'select paid_up_sum from CV_1970 where payendyear = ''?PayEndYear?'' and appage =''?AppAge?'' and sex = ''?Sex?''  order by YEAR', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197003', '10197000', 'V', 'select 1 from dual where ''?Prem?''>=5000 AND MOD(''?Prem?'',1000)=0', '�Ҹ�����һ��B����������ձ��Ѳ�����Ͷ���������Ϊ5000Ԫ������5000Ԫ�ı��շѱ�����1000Ԫ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197002', '10197000', 'E', 'select sb * ''?Amnt?'' / amnt from CV_1970 where appage = ''?AppAge?'' and Sex = ''?Sex?'' and PayEndYear = ''?PayEndYear?'' AND payendyearflag = ''?PayEndYearFlag?'' AND YEAR = ''?Interval?''
', '���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('197016', '10197000', 'C', 'select case when (''?PayEndYear?'' = 1000 ) then (select ''?Prem?''*1*0.2 from dual) else (select ''?Prem?''*''?PayEndYear?''*0.2 from dual) end from dual', '�ذ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199006', '10199000', 'E', 'select case when (select payintv from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1'')) = ''0'' and ((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'')) - (select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'') - nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0) - nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0)) < ''?Prem?'' then null else 1 end from dual', '���������ֽ��ѷ�ʽΪһ�ν���ʱ���Ҹ���ӯһ������գ������ͣ�ÿ��׷�ӱ�������޶�=�����������������շѵ�1��-��������-�ۼ���׷�ӱ��ѣ�������ȡ�ۼƽ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199005', '10199000', 'E', 'select case when (select distinct 1 from lccontrelated where contno = ''?ContNo?'' and relationship=''1'')=1 then 1 else null end from dual', '�Ҹ���ӯһ������գ������ͣ��ڱ��������󣬲ſ�׷�ӱ��ѡ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199004', '10199000', 'G', 'select ?Get? from dual', '����ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199003', '10199000', 'E', 'select case when ((((select sum(money) from lcinsureacctrace where moneytype = ''BF'' and contno = ''?ContNo?'') / (1 - 0.03))+nvl(((select sum(money) from lcinsureacctrace where moneytype = ''AI'' and contno = ''?ContNo?'') / (1 - 0.01)),0)) * 0.2) >= (?Money? - (select sum(getmoney) / (case when ?Interval? >= 5 then 1 else (1 - ((5 - ?Interval?) * 0.01)) end) from lpedoritem where edortype = ''PD'' and edorvalidate BETWEEN (SELECT add_months((SELECT cvalidate FROM lccont WHERE contno = ''?ContNo?''), 12 * ?Interval?) FROM dual) AND (SELECT add_months((SELECT cvalidate FROM lccont WHERE contno = ''?ContNo?''), 12 * (?Interval? +1)) from dual) and contno = ''?ContNo?'')) then 1 else 0 end from dual', '������ȡÿ��������Ȳ�����ȡ���ó����������շѵİٷ�֮��ʮ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199002', '10199000', 'G', 'select least(''?Get?'',(select prem from lcpol where contno = ''?ContNo?'' and polno = mainpolno)) from LDSysvar where sysvar = ''onerow''', '����ս�(����)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199001', '10199000', 'V', 'select 1 from LDSysvar where sysvar=''onerow'' and ''?Prem?''>=100  and mod(''?Prem?'',100) = 0', 'Ͷ��������ÿ��Ͷ��������ͱ��շ�Ϊ100Ԫ����߱��շ�Ϊ1000Ԫ������100Ԫ�ı��շѱ���Ϊ100Ԫ��������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199000', '10199000', 'P', 'select case when ''?CalType?'' in (''AA'',''PT'') then (select 0 from dual) else (select ?Mult?*?Prem? from LDSysvar where sysvar=''onerow'') end  from dual', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199017', '10199000', 'E', 'select ?AliveGetRate?*?CashValue? from dual', '����ս�(����)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199016', '10199000', 'E', 'select case when ((((select sum(money) from lcinsureacctrace where moneytype = ''BF'' and contno = ''?ContNo?'') / (1 - 0.03))+nvl(((select sum(money) from lcinsureacctrace where moneytype = ''AI'' and contno = ''?ContNo?'') / (1 - 0.01)),0)) * 0.2) >= ?CashValue?*?AliveGetRate? then 1 else 0 end from dual', '��ӯһ������գ������ͣ���������𲻵ó����ѽ����ѵ�20%������˻���ֵ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PDI199', '10199000', 'E', 'select case WHEN EXISTS(select distinct 1 from lccontstate where statetype =''Loan'' and state =''1'' and contno=''?contno?'' and enddate is null) then 0 else 1 end from dual', '����δ�峥����ı�������������ñ�ȫ!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LN1991', '10199000', 'E', 'select insuaccbala  from lcinsureacc where contno=''?ContNo?''and acctype = ''002''', '�����ּ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199031', '10199000', 'E', 'select 1 from dual', '�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('F99092', '10199000', 'F', 'select 1 from dual where ?Intv?<30', '�˱�ʱ�����ڼ���ڻ����30��۳������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199015', '10199000', 'E', 'select case ?Interval? when 0 then ?Money? * (1 - 0.05) when 1 then ?Money? * (1 - 0.04) when 2 then ?Money? * (1 - 0.03) when 3 then ?Money? * (1 - 0.02) when 4 then ?Money? * (1 - 0.01) else ?Money? end from dual', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('NM1990', '10199000', 'E', 'select case ?Interval? when 0 then ?Money? * (1 - 0.05) when 1 then ?Money? * (1 - 0.04) when 2 then ?Money? * (1 - 0.03) when 3 then ?Money? * (1 - 0.02) when 4 then ?Money? * (1 - 0.01) else ?Money? end from dual', '������ȡ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199012', '10199000', 'C', 'select greatest(?CashValue?, (select (?Prem? +nvl(((select sum(money) from lcinsureacctrace where moneytype = ''AI'' and contno = ''?ContNo?'') / (1 - 0.01)),0)+nvl((select sum(getmoney) from ljagetendorse where feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0) - nvl((select sum(getmoney) from ljagetdraw where feefinatype = ''YF'' and otherno = ''?ContNo?''), 0)) from dual)) from dual', '��ʱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199010', '10199000', 'E', 'select ?Prem? * (1-0.01) from dual', '׷�ӱ��շ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199007', '10199000', 'E', 'select case when (select payendyear from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1''))=''3'' and (((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?''))*20)-(select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'')-nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0)-nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0))<''?Prem?'' then null else 1 end from dual', '���������ֽ����ڼ�Ϊ3��ʱ���Ҹ���ӯһ������գ������ͣ�ÿ��׷�ӱ�������޶�=�����������꽻���շѵ�20��-��������-�ۼ���׷�ӱ��ѣ�������ȡ�ۼƽ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199008', '10199000', 'E', 'select case when (select payendyear from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1''))=''5'' and (((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?''))*30)-(select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'')-nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0)-nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0))<''?Prem?'' then null else 1 end from dual', '���������ֽ����ڼ�Ϊ5��ʱ���Ҹ���ӯһ������գ������ͣ�ÿ��׷�ӱ�������޶�=�����������꽻���շѵ�30��-��������-�ۼ���׷�ӱ��ѣ�������ȡ�ۼƽ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('199009', '10199000', 'E', 'select case when (select payendyear from lcpol where polno = mainpolno and appflag = ''1'' and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?'' and relationship=''1''))=''10'' and (((select standprem from lcpol where polno = mainpolno and contno in (select relatedcontno from lccontrelated where contno = ''?ContNo?''))*50)-(select sumactupaymoney from ljapay where incomeno = ''?ContNo?'' and othernotype = ''6'')-nvl((select sum(getmoney) from lpedoritem where edortype = ''SP'' and edorstate = ''0'' and contno = ''?ContNo?''),0)-nvl((select sum(getmoney) from ljagetendorse where  feefinatype = ''TB'' and feeoperationtype = ''PD'' and contno = ''?ContNo?''),0))<''?Prem?'' then null else 1 end from dual', '���������ֽ����ڼ�Ϊ10��ʱ���Ҹ���ӯһ������գ������ͣ�ÿ��׷�ӱ�������޶�=�����������꽻���շѵ�50��-��������-�ۼ���׷�ӱ��ѣ�������ȡ�ۼƽ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208000', '10208000', 'P', 'select case when ''?CalType?''! =''CS'' then (select ''?ExemptAmnt?'' / ?VPU? * prem from RT_2080 a where a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and a.insuyear = ?InsuYear? and a.sex = (select appntsex from lcappnt where contno = ''?ContNo?'')) else case when exists (select * from lpappnt where edorno=''?EdorNo?'') then (select  nvl(?ExemptAmnt?,0)/?VPU? * prem from RT_2080 a where a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lpappnt where edorno = ''?EdorNo?'') and a.insuyear = ?InsuYear? and a.sex = (select appntsex from lpappnt where EdorNo = ''?EdorNo?'')) else (select nvl(?ExemptAmnt?,0)/?VPU?*prem from RT_2080 a where a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and a.insuyear = ?InsuYear? and a.sex = (select appntsex from lcappnt where contno = ''?ContNo?'')) end end  from dual', '���㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2080', '10208000', 'C', 'select  case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) and ''?GetDutyKind?'' in(''202'',''209'',''203'') then 0 else 1 end case  from dual', '�Ҹ�����Ͷ���˻��Ᵽ�շѶ�������,�Ա������պ�ͬ��Ч�ջ����Ч����90���ڼ������գ���ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208003', '10208000', 'A', 'SELECT nvl(?ExemptAmnt?,0) from dual', '���㱣��(�������ս��Ϊ�������պ�ͬ�����ϱ��պ�ͬ���꽻���շѽ�� )');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1208', '10208000', 'O', 'select ?Get? *0.5* (payyears - (select nvl(max(paycount), 1) paycount from ljapayperson where contno = ''?ContNo?'' and paytype = ''ZC'')) from lcpol where contno = ''?ContNo?'' and appflag in (''0'', ''1'') and payintv = 12 and polno = mainpolno and rownum = 1', '�����������շ��ձ���=�������ս��������ڼ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208031', '10208000', 'V', 'select 1 from lcpol where insuredno<>appntno and contno=''?ContNo?''', 'Ͷ���ˡ���������Ϊͬһ�˲���Ͷ������Ͷ���˻��ⶨ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208032', '10208000', 'V', 'select 1 from dual where ?InsuYear?+1 = (select payyears from lcpol where contno = ''?ContNo?'' and polno = mainpolno)', '�����ڼ���Ϊ�����Ϻ�ͬ�Ľ�������-1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208033', '10208000', 'V', 'select 1 from dual where ?PayEndYear?+1 = (select payyears from lcpol where contno = ''?ContNo?'' and polno = mainpolno)', '�����ڼ���Ϊ�����Ϻ�ͬ�Ľ�������-1');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208034', '10208000', 'V', 'select 1 from dual where ?PayIntv?<>''0''', '�����������ϵ����ռ������յĽ��ѷ�ʽΪ����������Ͷ������Ͷ���˻��ⶨ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208035', '10208000', 'V', 'SELECT 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM LCPOL WHERE RISKCODE <> ''10208000'' AND CONTNO = ''?ContNo?'' AND PAYINTV = 12 AND POLNO <> MAINPOLNO AND PAYENDYEAR <> (SELECT PAYENDYEAR FROM LCPOL WHERE CONTNO = ''?ContNo?'' AND POLNO = MAINPOLNO)) AND NOT EXISTS (SELECT 1 FROM LCPOL WHERE RISKCODE <> ''10208000'' AND CONTNO = ''?ContNo?'' AND PAYINTV = 12 AND POLNO <> MAINPOLNO AND PAYENDYEARFLAG <> (SELECT PAYENDYEARFLAG FROM LCPOL WHERE CONTNO = ''?ContNo?'' AND POLNO = MAINPOLNO))', '���ռ����ڸ����ս����ڼ䲻һ�£�����Ͷ������Ͷ���˻��ⶨ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208036', '10208000', 'V', 'select 1 from dual where ?InsuYear?+(select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'')<=70', 'Ͷ������+�����ڼ䳬��70');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208020', '10208000', 'E', 'select cv_end from CV_2080 where appyear =(select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and Sex = (select appntsex from lcappnt where contno = ''?ContNo?'') and InsuYear = ?InsuYear?  order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208021', '10208000', 'E', 'select paid_up_sum  from CV_2080 where appyear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'')  and Sex = (select appntsex from lcappnt where contno = ''?ContNo?'') and InsuYear = ?InsuYear? order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208045', '10208000', 'U', 'select 1 from lcappnt a where a.contno=''?ContNo?'' and a.occupationtype not in (''1'', ''2'', ''3'', ''4'')', '��������Ϊ�塢����ְҵ������˾����б�����Ͷ���˻��ⶨ������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('CVS105', '10208000', 'E', 'select  cv_start * (SELECT NVL(SUM(PREM),0) FROM LCPOL WHERE CONTNO = (select contno from lcpol where polno=''?PolNo?'') AND PAYINTV = 12 AND RISKCODE <> ''10208000'')/amnt  from CV_2080 where payendyear = ?PayEndYear? and appyear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and sex = (select appntsex from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and year = (?Interval? +1) and insuyear = ?InsuYear?', '�ڳ��ֽ��ֵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208025', '10208000', 'E', 'select decode(''?EdorType?'',''CT'',nvl((select sum(prem) from lcpol a where a.contno=''?ContNo?'' and a.payintv = 12 and a.appflag=''1'' and a.polno not in (select polno from lppol where edorno=''?EdorNo?'') and exists (select * from lmriskapp where nvl(risktypedetail,''0'')!=''E'' and riskcode=a.riskcode and riskperiod=''L'')),0),(select nvl((select sum(prem) from lppol b where b.edorno=''?EdorNo?'' and b.payintv = 12 and b.appflag=''1'' and exists(select * from lmriskapp where nvl(risktypedetail,''0'')!=''E'' and riskcode=b.riskcode and riskperiod=''L'')),0)+nvl((select sum(prem) from lcpol d where d.contno=''?ContNo?'' and d.payintv = 12 and d.appflag=''1'' and not exists (select * from lppol where polno=d.polno and edorno=''?EdorNo?'') and exists(select * from lmriskapp where nvl(risktypedetail,0)!=''E'' and riskcode=d.riskcode and riskperiod=''L'' )),0) from dual)) from dual', '��������ձ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208024', '10208000', 'E', 'select case when exists (select * from lpedoritem where contno =''?ContNo?'' and edortype=''PU'' and edorstate=''0'') then (select trunc(Months_between(to_date(''?ZTPoint?''),edorvalidate) / 12) from lpedoritem where contno=''?ContNo?'' and edortype=''PU'') when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208010', '10208000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(SELECT SUM(PREM) FROM LCPOL WHERE CONTNO = (select contno from lcpol where polno=''?PolNo?'') AND PAYINTV = 12 AND RISKCODE <> ''10208000'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(SELECT SUM(PREM) FROM LCPOL WHERE CONTNO = (select contno from lcpol where polno=''?PolNo?'') AND PAYINTV = 12 AND RISKCODE <> ''10208000'')/amnt end from CV_2080 where payendyear = ?PayEndYear? and appyear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and sex = (select appntsex from lcappnt where contno = (select distinct contno from lcpol where polno = ''?PolNo?'')) and year = (?Interval? +1) and insuyear = ?InsuYear?
', '�ֽ��ֵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208040', '10208000', 'E', 'select case when (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode in (''102'',''103''))=1 then 1  else 0 end from dual', '�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208041', '10208000', 'E', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90)) and (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode in (''202'',''203''))=1  then 1  else 0 end from dual', '��������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208042', '10208000', 'E', 'select ?SumPrem? From dual', '�����˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208043', '10208000', 'E', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90))  then (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode =''203'')  else 0 end from dual', '�����м��⸶');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208044', '10208000', 'E', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90))  then (select distinct 1 from LLAppClaimReason where caseno=''?CaseNo?'' and reasoncode =''202'') else 0 end from dual', '���������⸶');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('208001', '10208000', 'P', 'select ExPrem * ?Get? / ?VPU?  from rt_2080addfee a where a.Sex = (select appntsex from lcappnt where contno = ''?ContNo?'') and a.AppYear = (select calroundage(appntbirthday, ''?CValiDate?'') from lcappnt where contno = ''?ContNo?'') and a.InsuYear = ?InsuYear? and ?SuppRiskScore? Between a.min_EM and a.max_EM', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210022', '10210000', 'V', 'SELECT CASE WHEN ''?GetYear?'' is not NULL THEN 1 ELSE null END FROM dual', '�Ҹ�������ȫ����δ��д�������ȡ����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210023', '10210000', 'V', 'SELECT CASE WHEN ''?GetYear?'' IN (''28'',''65'',''70'',''80'') THEN 1 ELSE NULL END FROM dual', '�Ҹ�������ȫ�����������ȡ�����28���ꡢ65���ꡢ70���ꡢ80�����е�һ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210024', '10210000', 'V', 'SELECT CASE WHEN ''?GetYear?'' in (SELECT distinct LIVEGETYEAR FROM rt_2100 WHERE InsuYear=''?InsuYear?'') THEN 1 ELSE NULL END FROM dual', '�Ҹ�������ȫ���ձ����ڼ�������������ȡ������Ϊ����������������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210002', '10210000', 'P', 'select ''?Get?'' from dual', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210003', '10210000', 'V', 'select 1 from dual where ''?PayIntv?'' = 12', '���ѷ�ʽ¼������Ҹ�������ȫ���յĽ��ѷ�ʽΪ�꽻');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT2101', '10210000', 'E', 'select 1 from dual where ((select amnt from lcpol where polno=''?PolNo?'')-''?Amnt?'')>=1000', '������������������ͬ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210004', '10210000', 'C', 'select case when (select calroundage(to_date(substr((select distinct insuredbirthday from lcpol where  contno = ''?ContNo?'' and appflag = ''1''),1,10), ''YYYY-MM-DD''),to_date(''?AccidentDate?'', ''YYYY-MM-DD'')) from dual) >= 61 then  greatest(1.2 * ?SumPrem?, ?cashvalue?) when (select calroundage(to_date(substr((select distinct insuredbirthday from lcpol where contno = ''?ContNo?'' and appflag = ''1''),1,10), ''YYYY-MM-DD''),to_date(''?AccidentDate?'', ''YYYY-MM-DD'')) from dual) >= 41 then greatest(1.4 * ?SumPrem?, ?cashvalue?) when (select calroundage(to_date(substr((select distinct insuredbirthday from lcpol where contno = ''?ContNo?'' and appflag = ''1''),1,10), ''YYYY-MM-DD''),to_date(''?AccidentDate?'', ''YYYY-MM-DD'')) from dual) >= 18 then greatest(1.6 * ?SumPrem?, ?cashvalue?) else greatest(?SumPrem?, ?cashvalue?) end from dual', '��ʱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210005', '10210000', 'E', 'select 0 from dual', '�˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210006', '10210000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210007', '10210000', 'E', 'select cv_end from CV_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?'' and (appage+year)<106 order by year', '�ֽ��ֵ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210008', '10210000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''210040'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then endbail*?Amnt?/amnt else ((endbail) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + startbail * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_2100 where insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND LIVEGETYEAR=''?GetYear?'' and year = (?Interval? +1)) end from dual
', '�ֽ��ֵ(�����˱�)');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210009', '10210000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''210040'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then endbail*?Amnt?/amnt else ((endbail) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + startbail * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_2100 where insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND LIVEGETYEAR=''?GetYear?'' and year = (?Interval? +1)) end from dual

', '�����˷�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210010', '10210000', 'E', 'select (select prem from lcpol where polno = ''?PolNo?'') *(((select enddate from lcpol where polno = ''?PolNo?'') -(date ''?ZTPoint?'')) /(select enddate - cvalidate from lcpol where polno = ''?PolNo?'')) from dual
', null);

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210011', '10210000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''', '�Ա��������ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210025', '10210000', 'C', 'select case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else (case when ''?GetAge?''>=61 then greatest(1.2*?SumPrem?,?cashvalue?) when ''?GetAge?''>=41 then greatest(1.4*?SumPrem?,?cashvalue?) when ''?GetAge?''>=18 then greatest(1.6*?SumPrem?,?cashvalue?) else greatest(?SumPrem?,?cashvalue?) end) end from dual', '������ʱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210026', '10210000', 'V', 'SELECT 1 FROM lcpol WHERE payendyear=''?PayEndYear?'' AND payendyearflag=''?PayEndYearFlag?'' AND contno=''?ContNo?'' AND polno=''?MainPolNo?''', '�������յĽ����ڼ�Ӧ�����յĽ����ڼ���ͬ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1210', '10210000', 'O', 'select case when insuredappage>=18 then prem*payendyear*0.2 else 0 end from lcpol where contno=''?ContNo?'' and riskcode=''10210000''
', '�������꽻���շ�*�����ڼ�*20%��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210000', '10210000', 'P', 'select ''?Get?''*prem/1000 from RT_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?''', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210001', '10210000', 'P', 'select ''?Get?''*prem/1000 from RT_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?''

', '��ʱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210020', '10210000', 'P', 'select cv_end from CV_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?'' and (appage+year)<106 order by year', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('210021', '10210000', 'P', 'select paid_up_sum from CV_2100 where INSUYEAR=''?InsuYear?'' AND LIVEGETYEAR=''?GetYear?'' AND sex=''?Sex?'' AND PAYENDYEAR=''?PayEndYear?'' AND APPAGE=''?AppAge?'' AND INSUYEARFLAG=''?InsuYearFlag?'' AND LIVEGETYEARFLAG=''?GetYearFlag?'' AND PAYENDYEARFLAG=''?PayEndYearFlag?'' and (appage+year)<106 order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212013', '10212000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end *?Amnt?/ amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) *?Amnt?/ amnt end from CV_2120 WHERE payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (''?Interval?'' + 1)) else (select cv_end *?Amnt?/amnt from cv_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '�����˷�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212014', '10212000', 'V', 'SELECT CASE WHEN SUM(AMNT) > 1000000 THEN 1 ELSE 0 END FROM LCPOL WHERE RISKCODE = ''10212000'' AND LCPOL.APPFLAG IN (''0'', ''1'') AND LCPOL.UWFLAG NOT IN (''a'', ''1'', ''2'') AND LCPOL.CONTNO IN (SELECT CONTNO FROM LCCONT A  WHERE A.APPFLAG IN (''0'', ''1'')  AND A.UWFLAG NOT IN (''a'', ''1'', ''2'') AND A.INSUREDNO = ''?InsuredNo?'') AND ?AppAge? < 18', '�������ˣ�18���꣬�����������������ۼƻ������ս�����100��Ԫ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212003', '10212000', 'P', 'select case when ?payintv?=0 then (select case when ?Job?=5 then (select ?Get? / 10000 * 200 from dual) when ?Job? = 6 then (select ?Get? / 10000 *500 from dual) else 0 end from dual) when ?payintv?=12 then (select case when ?Job?=5 then (select ?Get? / 10000 * 20 from dual) when ?Job? = 6 then (select ?Get? / 10000 *50 from dual) else 0 end from dual) else 0 end from dual', 'ְҵ�ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212020', '10212000', 'E', 'select trunc(''?OldAmnt?'' / ''?VPU?'' * paid_up_sum, 2) from CV_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' AND insuyear = ''?InsuYear?'' and year = ''?Interval?''', '�������󱣶�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212019', '10212000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) then ?SumPrem? else (select case when ''?GetAge?''>=61 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.3*?SumPrem?,?cashvalue?) when ''?GetAge?''>=41 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.5*?SumPrem?,?cashvalue?) when ''?GetAge?''>=18 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.7*?SumPrem?,?cashvalue?) else  greatest(?SumPrem?,?cashvalue?) end from dual) end from dual', '������ʻ���ȫ�б��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212018', '10212000', 'C', 'select case when ''?GetAge?''>=61 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.3*?SumPrem?,?cashvalue?) when ''?GetAge?''>=41 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.5*?SumPrem?,?cashvalue?) when ''?GetAge?''>=18 then greatest(?Je_gf?*power(1+0.036,?RgtYears?),1.7*?SumPrem?,?cashvalue?) else  greatest(?SumPrem?,?cashvalue?) end from dual', '������ʻ���ȫ�б��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL0212', '10212000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) then 0 else 1 end from dual', '���������Ա����պ�ͬ��Ч�ջ����Ч����90���ڳ��գ���ע��!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212012', '10212000', 'E', 'select case when (?AppAge?+?Interval?) < 105 then (select case when exists (select * from lcpol where paytodate <= to_date(''?ZTPoint?'') and paytodate < payenddate and polno = ''?PolNo?'') then cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt else ((cv_end) * (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365 - (to_date(''?ZTPoint?'') - add_months(''?CValiDate?'', 12 *?Interval?))) / 365) * (select amnt from lcpol where polno = ''?PolNo?'') / amnt end from cv_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and year = (?Interval? +1)) else (select cv_end * (select amnt from lcpol where polno = ''?PolNo?'')/amnt from cv_2120 where payendyear = ''?PayEndYear?'' and appage = ''?AppAge?'' and sex = ''?Sex?'' and (appage + year) = 106) end from dual
', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212011', '10212000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212010', '10212000', 'E', 'select 0 from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212009', '10212000', 'V', 'select case when exists (select * from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'') then (select 1 from dual where (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10212000'') >= (select nvl(amnt, 0) from lcpol where contno = ''?ContNo?'' and riskcode = ''10031000'')) else 1 end from dual', '�����ӡ��Ҹ����Ӷ������ա�ʱ�������յĻ������ս��ӦС�ڵ������ջ������ս��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212008', '10212000', 'A', 'select ?Get? from LDSysvar where sysvar=''onerow''', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1212', '10212000', 'O', 'select case when calroundage(InsuredBirthday, ''?CurrentDate?'')>=18 then amnt Else 0 end from lcpol where insuredno = ''?InsuredNo?'' and riskcode =''10212000'' and appflag in (''0'',''1'',''2'') and  LCPol.Uwflag not in (''1'',''2'',''a'') and polno=''?PolNo?''', '�������ս���1�����뱻�����˵����շ��ձ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212007', '10212000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''
', '�ͻ���Ҫ���ϱ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212006', '10212000', 'E', 'select a.paid_up_sum from cv_2120 a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?'' AND (a.appage+a.year)<106 order by year', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212002', '10212000', 'P', 'select ?Get?/?VPU?*extra_premium from rt_2120addfee a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?'' and ''?SuppRiskScore?'' Between min_EM and max_EM', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212001', '10212000', 'P', 'select ?Get?/?VPU?*prem from rt_2120 a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?''', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212015', '10212000', 'V', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=5000 and mod(?Amnt?,1000)=0', '������Ļ������ս�����5000Ԫ���ҳ���5000Ԫ�ı��ս����Ϊ1000Ԫ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212005', '10212000', 'E', 'select cv_end from cv_2120 a where a.sex=''?Sex?'' and a.appage=''?AppAge?'' and a.payendyear=''?PayEndYear?'' AND (a.appage+a.year)<106 order by YEAR', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('212004', '10212000', 'V', 'select 1 from dual where ''?Amnt?''>=50000 AND MOD(''?Amnt?'',1000)=0', '�Ҹ����������������ձ������Ͷ���������5��Ԫ,�ҳ�������Ϊ1000Ԫ����������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('PT2150', '10215000', 'E', 'select 1 from lcpol where polno=''?PolNo?'' and (amnt-?Amnt?)>=10000 and mod(?Amnt?,1000)=0', '�����ּ�����Ļ������ս�����1��Ԫ���ҳ���1��Ԫ�ı��ս����Ϊ1000Ԫ��������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215044', '10215000', 'G', 'select ?Get?*0.2 From dual', '��֢������ȡ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215017', '10215000', 'C', 'select  case ''?GetDutyKind?'' when ''102'' then (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end) else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end)  end) end from dual', '��ʱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215030', '10215000', 'E', 'select a.paid_up_sum from cv_2150 a where a.dutycode in (SELECT dutycode FROM lcduty WHERE contno=''?ContNo?'') and a.insuyear=''?InsuYear?'' and a.insuyearflag=''?InsuYearFlag?'' and a.payendyear=''?PayEndYear?'' and a.payendyearflag=''?PayEndYearFlag?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?'' and (a.appage+a.year)<106 order by year

', 'PU');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215031', '10215000', 'E', 'select cv_end from cv_2150 a where a.dutycode in (SELECT dutycode FROM lcduty WHERE contno=''?ContNo?'') and a.insuyear=''?InsuYear?'' and a.insuyearflag=''?InsuYearFlag?'' and a.payendyear=''?PayEndYear?'' and a.payendyearflag=''?PayEndYearFlag?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?'' and (a.appage+a.year)<106 order by year
', 'CVT');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215033', '10215000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''215042'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*?Amnt?/amnt else ((cv_end) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*?Amnt?/amnt end from cv_2150 where dutycode=''?DutyCode?'' and insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? and year = (?Interval? +1)) end from dual', '�����˷�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215034', '10215000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''215042'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end ) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_2150 where dutycode=''?DutyCode?'' and insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? and year = (?Interval? +1)) end from dual', '�ֽ��ֵ���㱣���ֽ��ֵ���˱���Э���˱��������˷ѡ�����ʱ�����ּۣ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215035', '10215000', 'E', 'select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then trunc(Months_between(a.paytodate,a.CValiDate)/12)-1 else trunc(Months_between(to_date(''?ZTPoint?''),a.CValiDate)/12) end from lcpol a where a.polno=''?PolNo?''', '���㱣�����');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215036', '10215000', 'E', 'select case when a.payintv = 0 then (''?NewPrem?'' - ''?Prem?'') when (?Interval? +1) > payyears then (''?NewPrem?'' - ''?Prem?'') * payyears else (''?NewPrem?'' - ''?Prem?'') * (?Interval? +1) end from lcpol a where a.polno = ''?PolNo?''', '�Ա��������ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215041', '10215000', 'E', 'select case when exists(select 1 from llclaim a where a.clmstate in(''50'',''60'') and a.clmno in(select b.clmno from llclaimdetail b where b.getdutycode=''215042'' and b.givetype=''0'' and contno=(select contno from lcpol a where a.polno=''?PolNo?''))) then 0 else (select case when exists (select * from lcpol where paytodate<=to_date(''?ZTPoint?'') and paytodate<payenddate and polno=''?PolNo?'') then cv_end*(select amnt from lcpol where polno=''?PolNo?'')/amnt else ((cv_end ) * (to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?)) / 365 + cv_start * (365-(to_date(''?ZTPoint?'')-add_months(''?CValiDate?'', 12 * ?Interval?))) / 365)*(select amnt from lcpol where polno=''?PolNo?'')/amnt end from cv_2150 where dutycode=''?DutyCode?'' and insuyear=?InsuYear? and insuyearflag=''?InsuYearFlag?'' and PayEndYear=?PayEndYear? and payendyearflag=''?PayEndYearFlag?''  and Sex=?Sex? and appage=?AppAge? and year = (?Interval? +1)) end from dual', '�˱���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2150', '10215000', 'C', 'select case (select 1 from lcpol where  ''?GetAge?''>=80 and riskcode=''10215000'' and contno=''?ContNo?'' and exists(select 1 from lcduty b where dutycode=''215001'' and contno = ''?ContNo?'')) when 1 then 0 else 1 end from dual', '�����պ�ͬ�ı����ڼ䣬�ٴ�ȷ�ﻼ��������ʱ���������봦��80���걣�յ������գ�������֮ǰ');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2151', '10215000', 'C', 'select case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215042'' and b.givetype=''0'' and b.contno=''?ContNo?'')) >= 1 then (case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215042'' and b.givetype=''0'' and b.contno=''?ContNo?'')) < 5 then 0 else 1 end) else (case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215040'' and b.givetype=''0'' and b.contno=''?ContNo?'')) >= 1 then (case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?ClmNo?'' and b.clmno=a.clmno and b.getdutycode=''215040'' and b.givetype=''0'' and b.contno=''?ContNo?'')) < 5 then 0 else 1 end) else 1 end) end from dual', '��ע����ռ����Ƿ����㼲���������ʱ������Ҫ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215042', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease where diseasetype = ''Middle'' and clmno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' ) then (case ''?GetDutyKind?'' when ''104'' then ?Je_gf? else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else ?Je_gf? end) end) else 0 end from dual', '��֢�������ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215046', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Middle'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and substr(c.diseasecode, 3, 3) between 1 and 20) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutykind in (''109'',''209'') and b.givetype = ''0'' and b.polno = ''?PolNo?'')) when 0 then (case  when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''204'') then (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then 1 else 0 end) else (case when exists (select distinct 1 from LLAppClaimReason a  where a.caseno = ''?CaseNo?'' and a.reasoncode = ''104'') then 1  else 0 end) end) else 0 end) else 0 end from dual', '��֢�������Ᵽ�շѹ����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2152', '10215000', 'C', 'select case when ((''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90)) and ''?GetDutyKind?'' in (''204'',''202'') then 0 else 1 end from dual', '���������Ա����պ�ͬ��Ч�ջ����Ч����90���ڼ������գ���ע��!');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215043', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Middle'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?''and substr(c.diseasecode, 3, 3) between 1 and 20  and not exists (select 1 from Llclaimdiseasedetail where riskcode=''10215000'' and diseasetype = ''Middle'' and customerno = ''?InsuredNo?'' and diseasecode = c.diseasecode)) then ( case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215041'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) < 2 then (case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''214042'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) > 0 then 0 else 1 end) else 0 end ) else  0 end from dual', '��֢�������ս�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215045', '10215000', 'G', 'select ?Get?*0.5 From dual', '��֢������ȡ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2153', '10215000', 'C', 'select case when (select count(distinct getdutycode) from llclaimdetail where clmno =''?ClmNo?'' and riskcode =''10215000'' and getdutycode in(''215040'',''215041'',''215042'') and GiveType=''0'') >1  then 0 else 1 end from dual', '���ⰸͬһ��������ƥ���������֢�������Ρ�,����֢�������Ρ������ش󼲲����Ρ��еĶ������Σ���ע�⣡');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('LL2154', '10215000', 'C', 'select case when exists (select 1  from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and substr(c.diseasecode, length(c.diseasecode) - 2, 3) between 1 and 105 and exists (select 1 from LLDiseaseGroup a where a.riskcode = ''10215000'' and a.diseasetype = ''General'' and a.diseasecode = c.diseasecode) and not exists (select 1 from LLSeriousDisease  where diseasetype = ''General'' and clmno <> ''?CaseNo?'' and customerno = ''?InsuredNo?'' and diseasecode = c.diseasecode)) and exists (select distinct 1 from llclaim b, llclaimdetail c where b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.contno = (select a.contno from lcpol a where a.polno = ''?PolNo?''))and exists (SELECT 1 FROM lldiseasegroup WHERE riskcode = ''10215000'' and diseasegroup not in (SELECT distinct diseasegroup FROM lldiseasegroup WHERE riskcode = ''10215000'' and diseasecode in (select diseasecode from llseriousdisease WHERE caseno <> ''?CaseNo?'' and customerno = ''?InsuredNo?'' and diseasetype = ''General'')) and diseasecode in (select diseasecode from llseriousdisease where diseasetype = ''General'' and caseno = ''?CaseNo?'')) then (case when nvl((select accdate - (select max(accdate) from llcase a where a.caseno <> ''?CaseNo?'' and exists (select 1 from llclaim b, llclaimdetail c where a.caseno = b.clmno and b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.contno = (select a.contno from lcpol a where a.polno = ''?PolNo?''))) from llcase where caseno = ''?CaseNo?''), 181) > 180 then 0 else 1 end) else 1 end from dual', '�ڱ����պ�ͬ��Ч���ڣ�������������ȷ���״λ������պ�ͬ��ָ���ش󼲲��е�һ��֮������180�պ󣨲�����180�գ������Ͽ�ҽԺ��ר��ҽ���ٴ�ȷ���״λ������պ�ͬ��ָ���ش󼲲��е�����һ�֣���������ȷ����ش󼲲����������ش󼲲���,��ע��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215032', '10215000', 'E', 'select 0 from dual', '�˱���Э���˱�������');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215016', '10215000', 'C', 'select a.* from LCPrem a where 1=1  and (trim(FreeFlag) = ''0'' or trim(FreeFlag) is null) and urgepayflag =''Y'' and a.contno = ''?Contno?'' and polno in (select polno from lcpol where contno = ''?Contno?'' and riskcode = ''10215000'')', '��֢�������Ᵽ�շѡ���֢�������Ᵽ�շѡ��ش󼲲����Ᵽ�շ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215015', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''GT001'', ''GT047'')) and exists (select distinct 1 from LLAppClaimReason where ReasonType = ''01'' and caseno = ''?CaseNo?'') then (case when (select count(1) from lcduty b where dutycode = ''215001'' and contno = (select contno from lcpol a where a.polno = ''?PolNo?'')) >= 1 then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.givetype = ''0'' and b.clmno = a.clmno and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?'')) and exists ( select 1 from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno <> ''?CaseNo?'' and c.clmno = a.clmno and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''GT001'', ''GT047'')) and exists (select 1 from LLAppClaimReason c where c.caseno = a.clmno and c.reasontype = ''01'')) when 1 then (case when ((select to_date(to_char(add_months((select max(accdate)  from llcase a  where a.caseno <> ''?CaseNo?'' and exists (select 1 from llclaim b, llclaimdetail c where a.caseno = b.clmno and b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))), 36), ''yyyy-mm-dd''), ''yyyy-mm-dd'') from dual) < (select accdate from llcase where caseno = ''?CaseNo?'')) then 1 else 0 end) else 0 end)  else 0 end) else 0 end from dual', '��ѡ���θ��������㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215014', '10215000', 'C', 'select case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?CaseNo?'' and b.clmno=a.clmno and b.getdutycode in(''215042'',''215043'') and b.givetype=''0'' and b.contno=(select contno from lcpol a where a.polno=''?PolNo?''))) > 0 then 0 else 1 end from dual', '��ʱ��ս�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215013', '10215000', 'C', 'select case when (select count(1) from llclaim a where clmstate in(''50'',''60'') and exists(select 1 from llclaimdetail b where b.clmno<>''?CaseNo?'' and b.clmno=a.clmno and b.getdutycode=''215042'' and b.givetype=''0'' and b.contno=(select contno from lcpol a where a.polno=''?PolNo?''))) > 0 then 0 else 1 end from dual', '������ĩ�ڱ��ս�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215012', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and exists (SELECT 1 FROM lldiseasegroup b WHERE b.riskcode = ''10215000'' and b.diseasetype = ''General'' and b.diseasecode = c.diseasecode and not exists (select 1 from Llclaimdiseasedetail where riskcode = ''10215000'' and diseasetype = ''General'' and polno = ''?PolNo?'' and diseasegroup = b.diseasegroup))) then (case when nvl((select accdate - (select max(accdate) from llcase a where a.caseno <> ''?CaseNo?'' and exists (select 1 from llclaim b, llclaimdetail c where a.caseno = b.clmno and b.clmno = c.clmno and b.clmstate in (''50'', ''60'') and c.getdutycode = ''215042'' and c.givetype = ''0'' and c.polno = ''?PolNo?'')) from llcase where caseno = ''?CaseNo?''), 181) > 180 then (case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.polno = ''?PolNo?'')) < 5 then 1 else 0 end) else 0 end) else 0 end from dual', '�ش󼲲����ս�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215011', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Slight'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''ST005'',''ST011'',''ST015'',''ST023'',''ST026'',''ST031'',''ST035'',''ST036'',''ST037'',''ST038'',''ST039'',''ST040'',''ST041'',''ST042'',''ST043'',''ST045'',''ST047'',''ST050'',''ST052'',''ST053'',''ST054'',''ST055'',''ST057'',''ST059'',''ST060'',''ST064'',''ST065'',''ST066'',''ST067'',''ST068'',''ST069'',''ST074'',''ST075'',''ST076'',''ST077'') and not exists (select 1 from Llclaimdiseasedetail where riskcode=''10215000'' and diseasetype = ''Slight'' and customerno = ''?InsuredNo?'' and diseasecode = c.diseasecode)) then ( case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215040'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) < 3 then (case when (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b  where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.contno = (select contno from lcpol a where a.polno = ''?PolNo?''))) > 0 then 0 else 1 end) else 0 end ) else 0 end from dual', '��֢�������ս�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215010', '10215000', 'C', 'select case  when exists (select 1  from LLSeriousDisease where diseasetype = ''General'' and clmno = ''?CaseNo?'' and customerno = ''?InsuredNo?'' and diseasecode in (''GT001'', ''GT047'')) and ''?GetAge?''<80 then (case  when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1  from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.givetype = ''0'' and b.clmno = a.clmno and b.contno = ''?ContNo?'' and exists (select 1  from LLAppClaimReason c where c.caseno = a.clmno and c.reasontype = ''01'') and exists (select 1 from llclaimdiseasedetail where  diseasecode in (''GT001'', ''GT047'') and clmno = a.clmno)))  when 1 then ?Amnt?  else 0 end) else 0 end) else 0 end  from dual', '��ѡ���θ���');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX1215', '10215000', 'O', 'SELECT case when ''?AppAge?''>=18 then (SELECT ''?Get?''*1 FROM dual) else 0 end FROM dual', '1���������ˣ�18���꣬�����ֲ��������շ��ձ��
2���������ˡ�18���꣬�Ի������ս���1�����뱻�����˵����շ��ձ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215006', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease where diseasetype = ''General''  and clmno = ''?CaseNo?'' and customerno = ''?InsuredNo?'') then (select case ''?GetDutyKind?'' when ''104'' then (case (select count(1)  from llclaim a  where clmstate in (''50'', ''60'') and exists (select 1  from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.contno = ''?ContNo?'')) when 0 then greatest(?SumPrem?, ?Amnt?, ?cashvalue?)  else  ?Amnt?  end) else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then  ?SumPrem? else (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutycode = ''215042'' and b.givetype = ''0'' and b.contno = ''?ContNo?'')) when 0 then greatest(?SumPrem?, ?Amnt?, ?cashvalue?) else ?Amnt? end) end) end from dual) else 0 end from dual', '�ش󼲲����ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215005', '10215000', 'C', 'select case when exists(select 1 from LLSeriousDisease where diseasetype = ''Slight'' and clmno=''?CaseNo?'' and customerno = ''?InsuredNo?'') then ( case ''?GetDutyKind?'' when ''104'' then ?Je_gf? else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else ?Je_gf?  end) end ) else 0 end from dual', '��֢�������ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215004', '10215000', 'V', 'select 1 from dual where ''?PayIntv?'' = ''12''', '���ѷ�ʽ¼������Ҹ���������������ش󼲲����յĽ��ѷ�ʽΪ�꽻');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215003', '10215000', 'P', 'select case when ?Job?=5 then (select ?Get? / 10000 * 20 from dual) when ?Job? = 6 then (select ?Get? / 10000 *50 from dual) else 0 end from dual', 'ְҵ�ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215002', '10215000', 'P', 'select ?Get?/1000*prem from rt_2150addfee a where a.dutycode=''?DutyCode?'' and a.insuyear=''?InsuYear?'' and a.payendyear=''?PayEndYear?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?'' and ''?SuppRiskScore?'' Between min_EM and max_EM
', '�����ӷ�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215001', '10215000', 'P', 'SELECT ?Get?/1000*prem FROM rt_2150 a WHERE a.dutycode=''?DutyCode?'' and a.insuyear=''?InsuYear?'' and a.insuyearflag=''?InsuYearFlag?'' and a.payendyear=''?PayEndYear?'' and a.payendyearflag=''?PayEndYearFlag?'' and a.sex=''?Sex?'' and a.appage=''?AppAge?''', '�����㱣��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215000', '10215000', 'G', 'select ?Get? From dual', '�����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215020', '10215000', 'V', 'select 1 from dual where ''?Amnt?''>=10000 AND MOD(''?Amnt?'',1000)=0', 'Ͷ��������ÿ��Ͷ��������ͻ������ս��Ϊ1��Ԫ������1��Ԫ�ı��ս����Ϊ1000Ԫ��������
');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('FX2215', '10215000', 'O', 'SELECT case when ''?DutyCode?''=215000 then (SELECT ''?Get?''*1.3 FROM dual) else (SELECT ''?Get?''*1.6 FROM dual) end FROM dual
', '3��������ѡ���Σ��Ի������ս���1.5�����뱻�����˵��ش󼲲����ձ��
4������ѡ���Σ��Ի������ս���1.8�����뱻�����˵��ش󼲲����ձ��
5����Ʒ�ƶ����ش󼲲����ձ���ļ��㣨��Ʒ�ƶ���Ϊ��Ʒ����3�����ڣ���
a��������ѡ���Σ��Ի������ս���1.3�����뱻�����˵��ش󼲲����ձ��
b������ѡ���Σ��Ի������ս���1.6�����뱻�����˵��ش󼲲����ձ��');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215009', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c  where c.diseasetype = ''General'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and exists (select 1 from LLDiseaseGroup a where a.riskcode = ''10215000'' and a.diseasetype = ''General'' and a.diseasecode = c.diseasecode)) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b  where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutykind in (''109'',''209'') and b.givetype = ''0'' and b.polno = ''?PolNo?'')) when 0 then (case when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''204'') then (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then 1 else 0 end) else (case when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''104'') then 1 else 0 end) end) else 0 end) else 0 end from dual', '�ش󼲲����Ᵽ�շѹ����㷨');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215007', '10215000', 'C', 'select  case ''?GetDutyKind?'' when ''104'' then (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end) else (case when (''?LRFlag?'' = ''1'' and ''?LRDays?'' <= 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' <= 90) then ?SumPrem? else (case when ''?GetAge?'' >= 18 then greatest(?SumPrem?,?Amnt?,?cashvalue?) else ?SumPrem? end)  end) end from dual', '������ĩ�ڱ��ս�');

insert into LMCalMode (CALCODE, RISKCODE, TYPE, CALSQL, REMARK)
values ('215008', '10215000', 'C', 'select case when exists (select 1 from LLSeriousDisease c where c.diseasetype = ''Slight'' and c.clmno = ''?CaseNo?'' and c.customerno = ''?InsuredNo?'' and c.diseasecode in (''ST005'',''ST011'',''ST015'',''ST023'',''ST026'',''ST031'',''ST035'',''ST036'',''ST037'',''ST038'',''ST039'',''ST040'',''ST041'',''ST042'',''ST043'',''ST045'',''ST047'',''ST050'',''ST052'',''ST053'',''ST054'',''ST055'',''ST057'',''ST059'',''ST060'',''ST064'',''ST065'',''ST066'',''ST067'',''ST068'',''ST069'',''ST074'',''ST075'',''ST076'',''ST077'')) then (case (select count(1) from llclaim a where clmstate in (''50'', ''60'') and exists (select 1 from llclaimdetail b where b.clmno <> ''?CaseNo?'' and b.clmno = a.clmno and b.getdutykind in (''109'',''209'') and b.givetype = ''0'' and b.polno = ''?PolNo?'')) when 0 then (case when exists (select distinct 1 from LLAppClaimReason a where a.caseno = ''?CaseNo?'' and a.reasoncode = ''204'') then (case  when (''?LRFlag?'' = ''1'' and ''?LRDays?'' > 90) or (''?LRFlag?'' = ''0'' and ''?RgtDays?'' > 90) then 1 else 0 end) else (case when exists (select distinct 1 from LLAppClaimReason a  where a.caseno = ''?CaseNo?'' and a.reasoncode = ''104'') then 1 else 0 end) end) else 0 end) else 0 end from dual', '��֢�������Ᵽ�շѹ����㷨');

prompt Done.
