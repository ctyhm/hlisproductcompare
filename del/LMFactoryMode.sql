prompt Importing table LMFactoryMode...
set feedback off
set define off
insert into LMFactoryMode (RISKCODE, FACTORYTYPE, FACTORYCODE, FACTORYNAME, FACTORYSUBCODE, FACTORYSUBNAME, CALSQL, PARAMSNUM, PARAMS, CALREMARK)
values ('10099000', '000004', 'lp0018', '�⸶��������', 1, 'Rate', 'select case ''?Rate?'' when ''A'' then 0.9  else 0.7 end from dual', 1, 'A', '������������ְ������ҽ�Ʊ��ա�����������ҽ�Ʊ��ա�����ҽ�ƻ����������Ͽɵ����ҽ�Ʊ��գ���������ũ�����ҽ�ƣ��α���Ա��ݽ������ƣ����ǰ�90%��������������дA��
���������˷����������κ�һ�ֲα���Ա��ݽ������ƣ����ǰ�70%������������д������
');

prompt Done.
