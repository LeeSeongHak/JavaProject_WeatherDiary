-- �� ���� ���̺�
create table userinfo (
<<<<<<< HEAD
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
=======
	id		varchar2(20) primary key,	--�� ���̵�(�̸���)
	password	varchar2(20) not null,		--��й�ȣ
	name		varchar2(30) not null,		--�� �̸�
	country		varchar2(30) not null,		--���� ����
	region		varchar2(30) not null		--���� ����
);

--ȸ�� ���� ��
insert into userinfo (id, password, name, country, region) values ('aaa@naver.com', 'aaa1', 'ȫ�浿', '����', '�Ѿ�');
>>>>>>> de0f4970f076090ed497de7a8e27ec2a476bbafc

