-- �� ���� ���̺�
create table userinfo (
	id		varchar2(20) primary key,	--ID
	password	varchar2(20) not null,		--비밀번호
	name		varchar2(30) not null,		--�� �̸�
	country		varchar2(30) not null,		--���� ����
	region		varchar2(30) not null,		--���� ����
	question	varchar2(30) not null,		--����
	answer		varchar2(30) not null		--�亯
);

--ȸ�� ���� ��
insert into userinfo (id, password, name, country, region, question, answer) values ('aaa@naver.com', 'aaa1', 'ȫ�浿', '����', '�Ѿ�', 'test', 'test');

