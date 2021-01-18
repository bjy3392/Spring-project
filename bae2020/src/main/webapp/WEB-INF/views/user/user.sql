create table user(
	mid				varchar(20) not null,
	pwd				varchar(200) not null,
	name			varchar(20) not null,
	tel				varchar(20) not null,
	postcode 		varchar(10) ,
	roadAddress 	varchar(50) ,
	detailAddress 	varchar(50) ,
	join_dt 		datetime default now(),
	level			varchar(10) default 'level0' not null,
	groups			varchar(10) default 'group-c' not null,
	primary key(mid)
);
--drop table user

select * from user
select * from groups
select* from level

alter table user drop groups;
SELECT * FROM INFORMATION_SCHEMA.table_constraints WHERE constraint_type="FOREIGN KEY" 
alter table user drop FOREIGN KEY user_ibfk_2;

ALTER TABLE user ADD FOREIGN KEY (level)  REFERENCES level(level_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE user ADD FOREIGN KEY (groups)  REFERENCES groups(group_code) ON DELETE RESTRICT ON UPDATE CASCADE ;


update  user set name='관리자' where mid='admin'

select * from user


create table ask_manager(
	ask_idx		int not null auto_increment,
	mid			varchar(20) not null,
	message 	text,			
	pass_yn 	varchar(10) default 'w' not null,
	ask_dt 	datetime default now(),
	primary key(ask_idx)
);
--drop table ask_manager
select * from ask_manager

ALTER TABLE ask_manager CHANGE pass_dt ask_dt datetime default now();

create table store(
	store_code varchar(20) not null,
	store_name varchar(30) not null,
	manager varchar(20) ,
	tel				varchar(20) not null,
	postcode 		varchar(10) not null,
	roadAddress 	varchar(50) not null,
	detailAddress 	varchar(50) not null,
	coupon			varchar(20) ,
	open_yn			varchar(10) default 'n' not null,
	join_dt 		datetime default now(),
	primary key(store_code)
);
--drop table store

select * from store

select * from store order by store_code desc;

select * from 
