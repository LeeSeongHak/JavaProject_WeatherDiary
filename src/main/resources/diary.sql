-- 다이어리 테이블
create table diary (
	num			number	 		not null 	primary key,		--글번호
	id			varchar2(30) 	not null,						--id
	emotion		varchar2(100), 									--감정표현
	weather		varchar2(100),									--날씨
	title		varchar2(3000),									--제목
	content 	varchar2(3000), 								--내용
	inputdate 	date 			default sysdate					--입력일
);

-- 다이어리 일련번호에 사용할 시퀀스 
create sequence diary_seq start with 1 increment by 1;

-- 글 저장 예
insert into diary (num, id, emotion, weather, title, content) values (diary_seq.nextval, 'id', '감정', '맑음', '제목', '내용');
