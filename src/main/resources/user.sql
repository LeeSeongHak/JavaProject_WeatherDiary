-- 고객 정보 테이블
create table userinfo (
	id		varchar2(20) primary key,	--고객 아이디(이메일)
	password	varchar2(20) not null,		--비밀번호
	name		varchar2(30) not null,		--고객 이름
	country		varchar2(30) not null,		--거주 국가
	region		varchar2(30) not null,		--거주 지역
	question	varchar2(30) not null,		--질문
	answer		varchar2(30) not null		--답변
);

--회원 가입 예
insert into userinfo (id, password, name, country, region, question, answer) values ('aaa@naver.com', 'aaa1', '홍길동', '조선', '한양', 'test', 'test');

