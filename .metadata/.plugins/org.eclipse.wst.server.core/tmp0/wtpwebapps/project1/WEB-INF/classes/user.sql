-- ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Ìºï¿½
create table userinfo (
<<<<<<< HEAD
	id		varchar2(20) primary key,	--ID
	password	varchar2(20) not null,		--ë¹„ë°€ë²ˆí˜¸
	name		varchar2(30) not null,		--ï¿½ï¿½ ï¿½Ì¸ï¿½
	country		varchar2(30) not null,		--ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	region		varchar2(30) not null,		--ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	question	varchar2(30) not null,		--ï¿½ï¿½ï¿½ï¿½
	answer		varchar2(30) not null		--ï¿½äº¯
);

--È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½
insert into userinfo (id, password, name, country, region, question, answer) values ('aaa@naver.com', 'aaa1', 'È«ï¿½æµ¿', 'ï¿½ï¿½ï¿½ï¿½', 'ï¿½Ñ¾ï¿½', 'test', 'test');
=======
	id		varchar2(20) primary key,	--°í°´ ¾ÆÀÌµð(ÀÌ¸ÞÀÏ)
	password	varchar2(20) not null,		--ºñ¹Ð¹øÈ£
	name		varchar2(30) not null,		--°í°´ ÀÌ¸§
	country		varchar2(30) not null,		--°ÅÁÖ ±¹°¡
	region		varchar2(30) not null		--°ÅÁÖ Áö¿ª
);

--È¸¿ø °¡ÀÔ ¿¹
insert into userinfo (id, password, name, country, region) values ('aaa@naver.com', 'aaa1', 'È«±æµ¿', 'Á¶¼±', 'ÇÑ¾ç');
>>>>>>> de0f4970f076090ed497de7a8e27ec2a476bbafc

