prompt Importing table LMRisk...
set feedback off
set define off
insert into LMRisk (RISKCODE, RISKVER, RISKNAME, RISKSHORTNAME, RISKENNAME, RISKENSHORTNAME, CHODUTYFLAG, CPAYFLAG, GETFLAG, EDORFLAG, RNEWFLAG, UWFLAG, RINSFLAG, INSUACCFLAG, DESTRATE, ORIGRISKCODE, SUBRISKVER, RISKSTATNAME)
values ('10099000', '2002', '幸福住院费用补偿医疗保险', '住院费用补偿医疗保险', null, null, 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'N', 'N', null, '10099000', null, '幸福住院费用补偿医疗保险');

insert into LMRisk (RISKCODE, RISKVER, RISKNAME, RISKSHORTNAME, RISKENNAME, RISKENSHORTNAME, CHODUTYFLAG, CPAYFLAG, GETFLAG, EDORFLAG, RNEWFLAG, UWFLAG, RINSFLAG, INSUACCFLAG, DESTRATE, ORIGRISKCODE, SUBRISKVER, RISKSTATNAME)
values ('10164000', '2002', '幸福安心住院津贴医疗保险', '安心住院津贴医疗保险', null, null, 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N', 'N', null, null, '10164000', '幸福安心住院津贴医疗保险');

insert into LMRisk (RISKCODE, RISKVER, RISKNAME, RISKSHORTNAME, RISKENNAME, RISKENSHORTNAME, CHODUTYFLAG, CPAYFLAG, GETFLAG, EDORFLAG, RNEWFLAG, UWFLAG, RINSFLAG, INSUACCFLAG, DESTRATE, ORIGRISKCODE, SUBRISKVER, RISKSTATNAME)
values ('10165000', '2002', '幸福安心A款住院费用补偿医疗保险', '安心A款住院费用补偿医疗保险', null, null, 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N', 'N', null, '10165000', null, '幸福安心A款住院费用补偿医疗保险');

prompt Done.
