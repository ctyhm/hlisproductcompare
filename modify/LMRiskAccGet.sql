prompt Importing table LMRiskAccGet...
set feedback off
set define off
insert into LMRiskAccGet (RISKCODE, RISKVER, INSUACCNO, GETDUTYCODE, DEFAULTRATE, NEEDINPUT, CALCODEMONEY, DEALDIRECTION, CALFLAG, ACCCREATEPOS, GETDUTYNAME)
values ('10199000', '2002', '199000', '199041', 1, '0', null, '1', '1', '1', '身故保险金');

insert into LMRiskAccGet (RISKCODE, RISKVER, INSUACCNO, GETDUTYCODE, DEFAULTRATE, NEEDINPUT, CALCODEMONEY, DEALDIRECTION, CALFLAG, ACCCREATEPOS, GETDUTYNAME)
values ('10199000', '2002', '199001', '199040', 1, '0', null, '1', '1', '3', '年金');

prompt Done.
