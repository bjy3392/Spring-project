create table user_info(
	mid		varchar(20) not null,
	pwd		varchar(200) not null,
	name	varchar(20) not null,
	tel		varchar(20) not null,
	postcode varchar(10) ,
	roadAddress varchar(50) ,
	detailAddress varchar(50) ,
	join_dt datetime default now(),
	level_code	varchar(10) default 0 not null,
	group_code	varchar(10) default 'c' not null,
	primary key(mid)
);
drop table user_info

update user_info set level_code='5' , group_code='a' where mid='admin';

select * from user_info

ALTER TABLE user_info ADD FOREIGN KEY (level_code)  REFERENCES level(level_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE user_info ADD FOREIGN KEY (group_code)  REFERENCES group_tbl(group_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

create table level (
	level_code 	varchar(10) not null,
	level_name 	varchar(20) not null,
	level_desc	varchar(100),
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(level_code)
);



insert into level values ('0','준회원','처음 가입한 회원','admin',default);
insert into level values ('1','정회원','최근 3개월간 1만원이상 10회이용','admin',default);
insert into level values ('2','우수회원','최근 3개월간 1만원이상 20회이용','admin',default);
insert into level values ('3','VIP','최근 3개월간 1만원이상 50회이용','admin',default);
insert into level values ('4','판매자','점주 및 배달','admin',default);
insert into level values ('5','관리자','관리자','admin',default);

create table group_tbl (
	group_code 	varchar(10) not null,
	group_name 	varchar(20) not null,
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(group_code)
);

insert into group_tbl values ('c','고객','admin',default);
insert into group_tbl values ('m','마켓','admin',default);
insert into group_tbl values ('d','배달','admin',default);
insert into group_tbl values ('a','관리자','admin',default);

