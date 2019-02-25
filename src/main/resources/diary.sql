--다이어리 글
create table diary (
	num			number	 		not null 	primary key,		--글 번호
	id			varchar2(30) 	not null,						--id
	emotion		varchar2(100), 									--기분
	weather		varchar2(100),									--날씨
	title		varchar2(3000),									--제목
	content 	varchar2(3000), 								--내용
	inputdate 	date 			default sysdate					--작성날짜
);
