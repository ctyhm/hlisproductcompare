prompt Importing table LMCheckField...
set feedback off
set define off
insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '1', '099020', null, null, '投保本险种每份投保单的最低基本保险金额为3000元，超过3000元的保险金额必须为1000元的整数倍，最高基本保险金额上限为5万元', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '10', '099063', null, null, '幸福乐盈盈个人意外伤害保险（2013）保费达到200元的，可投保幸福住院费用补偿医疗保险基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '2', '099021', null, null, '1年期以上主险交费方式为期交时方可与本险种组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '2', '099021', null, null, '1年期以上主险交费方式为期交时方可与本险种组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '3', '099022', null, null, '1年期以上主险每份投保单的期交保险费达到4000元的，本险种方可投保基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '3', '099022', null, null, '1年期以上主险每份投保单的期交保险费达到4000元的，本险种方可投保基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '4', '099023', null, null, '被保险人≥18周岁，每份投保单幸福乐盈盈个人意外伤害 
保险保险费达到100元的，方可与本险种组合销售；
被保险人＜18周岁，每份投保单幸福乐盈盈个人意外伤害 
保险保险费达到50元的，方可与本险种组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '4', '099023', null, null, '被保险人≥18周岁，每份投保单幸福乐盈盈个人意外伤害 
保险保险费达到100元的，方可与本险种组合销售；
被保险人＜18周岁，每份投保单幸福乐盈盈个人意外伤害 
保险保险费达到50元的，方可与本险种组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '5', '099024', null, null, '每份投保单幸福乐盈盈个人意外伤害保险保险费达到200元的，本险种方可投保基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '5', '099024', null, null, '每份投保单幸福乐盈盈个人意外伤害保险保险费达到200元的，本险种方可投保基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'ClaimPolicy', '6', 'LL0137', '25', 'L', '幸福住院费用补偿医疗保险中被保险人自本合同生效之日起30日内(含30日)出现疾病，请注意！', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'ClaimPolicy', '7', 'LL0138', '25', 'L', '被保险人经医院诊断必须住院治疗，到本主险合同保险期满仍未结束，需注意！', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'PTDetail', '8', 'PT0990', null, null, '投保本险种每份投保单的最低基本保险金额为3000元，超过3000元的保险金额必须为1000元的整数倍，最高基本保险金额上限为5万元', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '9', '099062', null, null, '被保险人≥18周岁，幸福乐盈盈个人意外伤害保险（2013）保险费达到100元的，可投保附加险；被保险人＜18周岁，幸福乐盈盈个人意外伤害保险（2013）保险费达到50元的，可投保附加险。', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '9', '099062', null, null, '被保险人≥18周岁，幸福乐盈盈个人意外伤害保险（2013）保险费达到100元的，可投保附加险；被保险人＜18周岁，幸福乐盈盈个人意外伤害保险（2013）保险费达到50元的，可投保附加险。', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBINSERT', '10', '099063', null, null, '幸福乐盈盈个人意外伤害保险（2013）保费达到200元的，可投保幸福住院费用补偿医疗保险基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10099000', '2002', 'TBUPDATE', '1', '099020', null, null, '投保本险种每份投保单的最低基本保险金额为3000元，超过3000元的保险金额必须为1000元的整数倍，最高基本保险金额上限为5万元', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '1', '164020', null, null, '安心住院津贴医疗保险需整数份投保', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '1', '164020', null, null, '安心住院津贴医疗保险需整数份投保', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '4', '164022', null, null, '1年期以上主险每份投保单的期交保险费达到1000元的，方可投保安心住院津贴医疗保险', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '4', '164022', null, null, '1年期以上主险每份投保单的期交保险费达到1000元的，方可投保安心住院津贴医疗保险', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '5', '164023', null, null, '被保险人超出最大/最小投保年龄', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '5', '164023', null, null, '被保险人超出最大/最小投保年龄', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'ClaimPolicy', '1', 'LL0164', '25', 'L', '幸福附安心院津贴医疗保险中被保险人自本合同生效之日起30日内(含30日)出现疾病，请注意！', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'ClaimDetail', '1', 'LL0165', '25', 'L', '幸福安心住院津贴医疗保险中被保险人自本合同生效之日起90日内(含90日)出现疾病，请注意！', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'PTDetail', '1', '164020', null, null, '本险种需整数份投保。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '2', '164024', null, null, '1年期以上主险交费方式非期交不可与安心住院津贴医疗保险组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '2', '164024', null, null, '1年期以上主险交费方式非期交不可与安心住院津贴医疗保险组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '6', '164061', null, null, '每一被保险人在我公司只能投保一份“幸福安心住院津贴医疗保险”，不得重复新增', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '6', '164061', null, null, '每一被保险人在我公司只能投保一份“幸福安心住院津贴医疗保险”，不得重复新增', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '7', '164062', null, null, '每一被保险人不可同时持有我公司“幸福安心住院津贴医疗保险”及“幸福附加住院津贴医疗保险”，不得重复新增', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '7', '164062', null, null, '每一被保险人不可同时持有我公司“幸福安心住院津贴医疗保险”及“幸福附加住院津贴医疗保险”，不得重复新增', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '8', '164063', null, null, '1年期以上主险交费期满，不可新增本险种', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '8', '164063', null, null, '1年期以上主险交费期满，不可新增本险种', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '9', '164067', null, null, '被保险人≥18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到100元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '9', '164067', null, null, '被保险人≥18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到100元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '10', '164068', null, null, '被保险人<18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到50元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '10', '164068', null, null, '被保险人<18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到50元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBINSERT', '11', '164069', null, null, '幸福乐盈盈2013个人意外伤害保险保险费达到200元的，方可投保10份（不含）以上。', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10164000', '2002', 'TBUPDATE', '11', '164069', null, null, '幸福乐盈盈2013个人意外伤害保险保险费达到200元的，方可投保10份（不含）以上。', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '1', '165020', null, null, '被保险人超出最大/最小投保年龄', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '14', '165074', null, null, '每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到200 元的，本险种方可投保基本保险金额2万元以上。', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '4', '165022', null, null, '1年期以上主险每份投保单的期交保险费达到1000元的，方可投保安心A款住院费用补偿医疗保险', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '1', '165020', null, null, '被保险人超出最大/最小投保年龄', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '5', '165023', null, null, '1年期以上主险每份投保单的期交保险费不足4000元，安心A款住院费用补偿医疗保险不可投保基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '5', '165023', null, null, '1年期以上主险每份投保单的期交保险费不足4000元，安心A款住院费用补偿医疗保险不可投保基本保险金额2万元以上', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '6', '165024', null, null, '安心A款住院费用补偿医疗保险保额不符合投保规则（最低5000元,且超出部分为1000元的整数倍，最高5万元）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '6', '165024', null, null, '安心A款住院费用补偿医疗保险保额不符合投保规则（最低5000元,且超出部分为1000元的整数倍，最高5万元）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '7', '165025', null, null, '投保安心A款住院费用补偿医疗保险告知第4项是否拥有公费医疗及社会医疗保险须为“是”', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '7', '165025', null, null, '投保安心A款住院费用补偿医疗保险告知第4项是否拥有公费医疗及社会医疗保险须为“是”', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'ClaimPolicy', '1', 'LL0166', '25', 'L', '幸福安心A款住院费用补偿医疗保险中被保险人自本合同生效之日起30日内(含30日)出现疾病，请注意！', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'PTDetail', '1', '165024', null, null, '安心A款住院费用补偿医疗保险保额不符合投保规则（最低5000元,且超出部分为1000元的整数倍，最高5万元）', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '2', '165026', null, null, '1年期以上主险交费方式非期交不可与安心A款住院费用补偿医疗保险组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '2', '165026', null, null, '1年期以上主险交费方式非期交不可与安心A款住院费用补偿医疗保险组合销售', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '10', '165061', null, null, '每一被保险人在我公司只能投保一份“幸福安心A款住院费用补偿医疗保险，不能重复新增本险种', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '10', '165061', null, null, '每一被保险人在我公司只能投保一份“幸福安心A款住院费用补偿医疗保险，不能重复新增本险种', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '11', '165062', null, null, '每一被保险人不可同时持有我公司“幸福附加住院费用补偿医疗保险”、“幸福附加住院费用补偿医疗保险（2009）”、“幸福住院费用补偿医疗保险”及“幸福安心A款住院费用补偿医疗保险”', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '11', '165062', null, null, '每一被保险人不可同时持有我公司“幸福附加住院费用补偿医疗保险”、“幸福附加住院费用补偿医疗保险（2009）”、“幸福住院费用补偿医疗保险”及“幸福安心A款住院费用补偿医疗保险”', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '15', '165063', null, null, '1年期以上主险交费期满，不可新增本险种', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '15', '165063', null, null, '1年期以上主险交费期满，不可新增本险种', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'ClaimPolicy', '16', 'LL0167', '25', 'L', '被保险人经医院诊断必须住院治疗，但住院结束日期已经超出本主险合同届满期30天，需注意', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '12', '165072', null, null, '被保险人≥18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到100元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '12', '165072', null, null, '被保险人≥18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到100元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '13', '165073', null, null, '被保险人＜18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到50元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBUPDATE', '13', '165073', null, null, '被保险人＜18周岁，每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到50元的，方可与本险种组合销售.', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '14', '165074', null, null, '每份投保单幸福乐盈盈2013个人意外伤害保险保险费达到200 元的，本险种方可投保基本保险金额2万元以上。', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10165000', '2002', 'TBINSERT', '4', '165022', null, null, '1年期以上主险每份投保单的期交保险费达到1000元的，方可投保安心A款住院费用补偿医疗保险', 'Y', 'Y', null, null, 'I');

prompt Done.
