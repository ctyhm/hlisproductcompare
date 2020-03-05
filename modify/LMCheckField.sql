prompt Importing table LMCheckField...
set feedback off
set define off
insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'PTDetail', '4', '162015', null, null, '本险种减保时，本险种附加“幸福附加定期寿险”附加险基本保险金额不得超过主险基本保险金额；', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'PTDetail', '3', '162014', null, null, '本险种减保后的基本保险金额不低于1万元，且超过1万元的保险金额须为1000元的整数倍', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'TBCONTCHECK', '2', '162009', null, null, '当附加“幸福附加定期寿险”时，附加险的基本保险金额应小于等于主险基本保险金额', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'TBUPDATE', '1', '162004', null, null, '幸福人生终身重大疾病保险保额不符合投保规则（最低1万元,且超出部分为1000元的整数倍）', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'ClaimPolicy', '6', 'LL0162', '25', 'L', '被保险人自本主险合同生效日或最后复效日起180天内出险，请注意!', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'TBINSERT', '1', '162004', null, null, '幸福人生终身重大疾病保险保额不符合投保规则（最低1万元,且超出部分为1000元的整数倍）', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'AuditCheckPolicy', '7', 'LL1621', '25', 'L', '重大疾病保险金、身故保险金、全残保险金与疾病终末期保险金，同时只能领取一项。', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10162000', '2002', 'PTAppConfirm', '5', '162016', null, null, '本险种减保时，本险种附加“幸福附加定期寿险”附加险基本保险金额不得超过主险基本保险金额；', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBUPDATE', '4', '183014', null, null, '保险期间录入错误，百万安心保两全保险的保险期间为20年、30年', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBUPDATE', '5', '183015', null, null, '交费期间录入错误，百万安心保两全保险的交费期间为5年、10年', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'PTDetail', '6', 'PT1830', null, null, '本险种减保后的最低保额为5万元，超过5万元的保额必须是1万元的整数倍', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBUPDATE', '3', '183013', null, null, '交费方式录入错误，百万安心保两全保险的交费方式为年交', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBUPDATE', '2', '183012', null, null, '保额不符合投保规则（最低5万元,且超出部分为1万元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBINSERT', '1', '183011', null, null, '被保险人超出最大/最小投保年龄', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBUPDATE', '1', '183011', null, null, '被保险人超出最大/最小投保年龄', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBINSERT', '5', '183015', null, null, '交费期间录入错误，百万安心保两全保险的交费期间为5年、10年', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'ClaimPolicy', '7', 'LL1830', '25', 'L', '出险日期-事故日期>180天，请注意！', 'Y', null, '1;;', 'Y', 'Y');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBINSERT', '3', '183013', null, null, '交费方式录入错误，百万安心保两全保险的交费方式为年交', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBINSERT', '2', '183012', null, null, '保额不符合投保规则（最低5万元,且超出部分为1万元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10183000', '2002', 'TBINSERT', '4', '183014', null, null, '保险期间录入错误，百万安心保两全保险的保险期间为20年、30年', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10197000', '2002', 'TBCONTCHECK', '2', '197017', null, null, '无效的分红领取方式', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10197000', '2002', 'PTDetail', '3', '197011', null, null, '本险种减保后的保险费不低于5000元，超过5000元的保险费必须是1000元的整数倍', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10197000', '2002', 'TBINSERT', '1', '197003', null, null, '幸福鑫悦一生B款终身年金保险（分红型）保费不符合投保规则（最低为5000元，超过5000元的保险费必须是1000元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10197000', '2002', 'TBUPDATE', '1', '197003', null, null, '幸福鑫悦一生B款终身年金保险（分红型）保费不符合投保规则（最低为5000元，超过5000元的保险费必须是1000元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'SYDetail', '7', '199016', null, null, '稳盈一生年金保险（万能型）给付生存金不得超过已交保费的20%或个人账户价值。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'TBINSERT', '1', '199001', null, null, '幸福稳盈一生年金保险（万能型）保费不符合投保规则（最低保险费为100元，超过100元的保险费必须为100元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'TBUPDATE', '1', '199001', null, null, '幸福稳盈一生年金保险（万能型）保费不符合投保规则（最低保险费为100元，超过100元的保险费必须为100元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'PDDetail', '1', '199003', null, null, '部分领取每个保单年度部分领取金额不得超过所交保险费的百分之二十。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'SPDetail', '6', '199009', null, null, '被关联险种交费期间为10年时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额等于被关联险种年交保险费的50倍减趸交保费减累计已追加保费加部分领取累计金额。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'SPDetail', '3', '199006', null, null, '被关联险种交费方式为一次交清时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额等于被关联险种趸交保险费的1倍减趸交保费减累计已追加保费加部分领取累计金额。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'PDInsert', '30', 'PDI199', null, null, '该保单存在未清偿贷款，不可受理该保全!', null, null, null, null, null);

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'SPDetail', '4', '199007', null, null, '被关联险种交费期间为3年时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额等于被关联险种年交保险费的20倍减趸交保费减累计已追加保费加部分领取累计金额。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'SPDetail', '5', '199008', null, null, '被关联险种交费期间为5年时，幸福稳盈一生年金保险（万能型）每次追加保费最高限额等于被关联险种年交保险费的30倍减趸交保费减累计已追加保费加部分领取累计金额。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10199000', '2002', 'SPInsert', '2', '199005', null, null, '幸福稳盈一生年金保险（万能型）在保单关联后，才可追加保费。', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBINSERT', '1', '208033', null, null, '交费期间须为所保障合同的交费年期-1', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBUPDATE', '7', '208036', null, null, '投保年龄+保险期间超过70', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'ClaimPolicy', '8', 'LL2080', '25', 'L', '幸福附加投保人豁免保险费定期寿险,自本附加险合同生效日或最后复效日起90天内疾病出险，请注意！', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBINSERT', '7', '208036', null, null, '投保年龄+保险期间超过70', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBUPDATE', '6', '208035', null, null, '主险及长期附加险交费期间不一致，不可投保附加投保人豁免定期寿险', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBINSERT', '6', '208035', null, null, '主险及长期附加险交费期间不一致，不可投保附加投保人豁免定期寿险', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBUPDATE', '3', '208032', null, null, '保险期间须为所保障合同的交费年期-1', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBINSERT', '3', '208032', null, null, '保险期间须为所保障合同的交费年期-1', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBUPDATE', '2', '208031', null, null, '投保人、被保险人为同一人不可投保附加投保人豁免定期寿险', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBINSERT', '2', '208031', null, null, '投保人、被保险人为同一人不可投保附加投保人豁免定期寿险', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10208000', '2002', 'TBUPDATE', '1', '208033', null, null, '交费期间须为所保障合同的交费年期-1', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBUPDATE', '6', '210026', null, null, '本附加险的交费期间应与主险的交费期间相同', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBINSERT', '3', '210024', null, null, '幸福附加两全保险保险期间非终身，生存金领取年龄需为被保险人满期年龄', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'PTDetail', '5', 'PT2101', null, null, '该险种减保后保额不低于1000元', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBINSERT', '1', '210022', null, null, '幸福附加两全保险未填写生存金领取年龄', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBINSERT', '2', '210023', null, null, '幸福附加两全保险生存金领取年龄非28周岁、65周岁、70周岁、80周岁中的一种', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBINSERT', '6', '210026', null, null, '本附加险的交费期间应与主险的交费期间相同', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBUPDATE', '1', '210022', null, null, '幸福附加两全保险未填写生存金领取年龄', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBUPDATE', '2', '210023', null, null, '幸福附加两全保险生存金领取年龄非28周岁、65周岁、70周岁、80周岁中的一种', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBUPDATE', '3', '210024', null, null, '幸福附加两全保险保险期间非终身，生存金领取年龄需为被保险人满期年龄', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBINSERT', '4', '210003', null, null, '交费方式录入错误，幸福附加两全保险的交费方式为年交', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10210000', '2002', 'TBUPDATE', '4', '210003', null, null, '交费方式录入错误，幸福附加两全保险的交费方式为年交', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10212000', '2002', 'ClaimPolicy', '3', 'LL0212', '25', 'L', '被保险人自本主险合同生效日或最后复效日起90天内出险，请注意!', 'Y', null, '1;;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10212000', '2002', 'PTDetail', '2', '212015', null, null, '本险种减保后的基本保险金额不低于5000元，且超过5000元的保险金额须为1000元的整数倍', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10212000', '2002', 'TBUPDATE', '1', '212004', null, null, '幸福传世金生终身寿险保额不符合投保规则（最低5万元,且超出部分为1000元的整数倍）', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10212000', '2002', 'TBINSERT', '1', '212004', null, null, '幸福传世金生终身寿险保额不符合投保规则（最低5万元,且超出部分为1000元的整数倍）', 'Y', null, null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10215000', '2002', 'ClaimPolicy', '3', 'LL2150', '25', 'L', '本主险合同的保险期间为至被保险人终身的,被保险人须处于80周岁保险单周年日（不含）之前', 'Y', null, '1;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10215000', '2002', 'ClaimPolicy', '4', 'LL2152', '25', 'L', '被保险人自本主险合同生效日或最后复效日起90天内疾病出险，请注意!', 'Y', null, '1;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10215000', '2002', 'ClaimPolicy', '5', 'LL2153', '25', 'L', '本赔案同一理赔类型匹配出：“轻症疾病责任”,“中症疾病责任”，“重大疾病责任”中的多种责任，请注意！', 'Y', null, '1;', 'Y', 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10215000', '2002', 'PTDetail', '2', 'PT2150', null, null, '本险种减保后的基本保险金额不低于1万元，且超过1万元的保险金额须为1000元的整数倍', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10215000', '2002', 'TBINSERT', '1', '215020', null, null, '幸福健康人生尊享版重大疾病保险保额不符合投保规则（最低1万元,且超出部分为1000元的整数倍）', 'Y', 'Y', null, null, 'I');

insert into LMCheckField (RISKCODE, RISKVER, FIELDNAME, SERIALNO, CALCODE, PAGELOCATION, LOCATION, MSG, MSGFLAG, UPDFLAG, VALIFLAG, RETURNVALIFLAG, RISKPROP)
values ('10215000', '2002', 'TBUPDATE', '1', '215020', null, null, '幸福健康人生尊享版重大疾病保险保额不符合投保规则（最低1万元,且超出部分为1000元的整数倍）', 'Y', 'Y', null, null, 'I');

prompt Done.
