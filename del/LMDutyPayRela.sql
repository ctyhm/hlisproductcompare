prompt Importing table LMDutyPayRela...
set feedback off
set define off
insert into LMDutyPayRela (DUTYCODE, PAYPLANCODE, PAYPLANNAME)
values ('099000', '099020', '住院费用保险金');

insert into LMDutyPayRela (DUTYCODE, PAYPLANCODE, PAYPLANNAME)
values ('099001', '099021', '住院费用保险金+住院前、后门急诊费用保险金');

insert into LMDutyPayRela (DUTYCODE, PAYPLANCODE, PAYPLANNAME)
values ('164000', '164020', '幸福安心住院津贴医疗保险缴费');

insert into LMDutyPayRela (DUTYCODE, PAYPLANCODE, PAYPLANNAME)
values ('165000', '165020', '幸福安心A款住院费用补偿医疗保险缴费');

prompt Done.
