prompt Importing table LMAccGuratRate...
set feedback off
set define off
insert into LMAccGuratRate (RISKCODE, INSUACCNO, RATESTARTDATE, RATEENDDATE, RATEINTV, RATE, OPERATOR, MAKEDATE, MAKETIME)
values ('10199000', '199000', to_date('27-02-2018', 'dd-mm-yyyy'), to_date('01-01-3000', 'dd-mm-yyyy'), 'Y', 0.025, 'admin', to_date('27-02-2018', 'dd-mm-yyyy'), '00:00:00');

prompt Done.
