-- ���̾ ���̺�
create table diary (
	num			number	 		not null 	primary key,		--�۹�ȣ
	id			varchar2(30) 	not null,						--id
	emotion		varchar2(100), 									--����ǥ��
	weather		varchar2(100),									--����
	title		varchar2(3000),									--����
	content 	varchar2(3000), 								--����
	inputdate 	date 			default sysdate					--�Է���
);

-- ���̾ �Ϸù�ȣ�� ����� ������ 
create sequence diary_seq start with 1 increment by 1;

-- �� ���� ��
insert into diary (num, id, emotion, weather, title, content) values (diary_seq.nextval, 'id', '����', '����', '����', '����');
