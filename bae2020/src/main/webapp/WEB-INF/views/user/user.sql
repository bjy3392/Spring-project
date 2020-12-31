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

select * from user_info

ALTER TABLE user ADD FOREIGN KEY (level)  REFERENCES level(level_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE user ADD FOREIGN KEY (groups)  REFERENCES groups(group_code) ON DELETE RESTRICT ON UPDATE CASCADE ;


update  user set name='관리자' where mid='admin'

select * from user