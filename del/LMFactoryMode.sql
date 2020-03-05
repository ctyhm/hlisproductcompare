prompt Importing table LMFactoryMode...
set feedback off
set define off
insert into LMFactoryMode (RISKCODE, FACTORYTYPE, FACTORYCODE, FACTORYNAME, FACTORYSUBCODE, FACTORYSUBNAME, CALSQL, PARAMSNUM, PARAMS, CALREMARK)
values ('10099000', '000004', 'lp0018', '赔付比例配置', 1, 'Rate', 'select case ''?Rate?'' when ''A'' then 0.9  else 0.7 end from dual', 1, 'A', '若被保险人以职工基本医疗保险、城镇居民基本医疗保险、公费医疗或其他我们认可的社会医疗保险（不含新型农村合作医疗）参保人员身份接受治疗，我们按90%比例给付，请填写A；
若被保险人非以上所列任何一种参保人员身份接受治疗，我们按70%比例给付，填写其他。
');

prompt Done.
