prompt Importing table LMDuty...
set feedback off
set define off
insert into LMDuty (DUTYCODE, DUTYNAME, PAYENDYEAR, PAYENDYEARFLAG, PAYENDDATECALREF, PAYENDDATECALMODE, GETYEAR, GETYEARFLAG, INSUYEAR, INSUYEARFLAG, ACCIYEAR, ACCIYEARFLAG, CALMODE, PAYENDYEARRELA, GETYEARRELA, INSUYEARRELA, BASICCALCODE, RISKCALCODE, AMNTFLAG, VPU, ADDFEEFLAG, ENDDATECALMODE)
values ('099000', '住院费用保险金责任', null, null, 'S', '0', 0, 'Y', 1, 'Y', null, null, 'G', '3', '4', '4', '000003', null, '1', 1000.00, '02', '0');

insert into LMDuty (DUTYCODE, DUTYNAME, PAYENDYEAR, PAYENDYEARFLAG, PAYENDDATECALREF, PAYENDDATECALMODE, GETYEAR, GETYEARFLAG, INSUYEAR, INSUYEARFLAG, ACCIYEAR, ACCIYEARFLAG, CALMODE, PAYENDYEARRELA, GETYEARRELA, INSUYEARRELA, BASICCALCODE, RISKCALCODE, AMNTFLAG, VPU, ADDFEEFLAG, ENDDATECALMODE)
values ('099001', '住院费用保险金+住院前、后门急诊费用保险金责任', null, null, 'S', '0', 0, 'Y', 1, 'Y', null, null, 'G', '3', '4', '4', '000003', null, '1', 1000.00, '02', '0');

insert into LMDuty (DUTYCODE, DUTYNAME, PAYENDYEAR, PAYENDYEARFLAG, PAYENDDATECALREF, PAYENDDATECALMODE, GETYEAR, GETYEARFLAG, INSUYEAR, INSUYEARFLAG, ACCIYEAR, ACCIYEARFLAG, CALMODE, PAYENDYEARRELA, GETYEARRELA, INSUYEARRELA, BASICCALCODE, RISKCALCODE, AMNTFLAG, VPU, ADDFEEFLAG, ENDDATECALMODE)
values ('164000', '幸福安心住院津贴医疗保险责任', 1000, 'Y', 'S', '0', 0, 'Y', 1, 'Y', null, null, 'G', '3', '4', '4', '000003', null, '2', 10.00, '01', '0');

insert into LMDuty (DUTYCODE, DUTYNAME, PAYENDYEAR, PAYENDYEARFLAG, PAYENDDATECALREF, PAYENDDATECALMODE, GETYEAR, GETYEARFLAG, INSUYEAR, INSUYEARFLAG, ACCIYEAR, ACCIYEARFLAG, CALMODE, PAYENDYEARRELA, GETYEARRELA, INSUYEARRELA, BASICCALCODE, RISKCALCODE, AMNTFLAG, VPU, ADDFEEFLAG, ENDDATECALMODE)
values ('165000', '幸福安心A款住院费用补偿医疗保险责任', 1000, 'Y', 'S', '0', 0, 'Y', 1, 'Y', null, null, 'G', '3', '4', '4', '000003', null, '1', 1000.00, '01', '0');

prompt Done.
