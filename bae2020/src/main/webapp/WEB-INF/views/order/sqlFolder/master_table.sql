--주문상태 테이블
create table state(
	state_code	varchar(10) not null,
	state_name	varchar(20) not null,
	mid			varchar(20) not null,
	create_dt	datetime default now(),
	update_dt	datetime default now(),
	primary key(state_code)
);
--drop table state
insert into state values ('state0','결제완료','admin',default,default);

--회원 등급 테이블
create table level (
	level_code 	varchar(10) not null,
	level_name 	varchar(20) not null,
	level_desc	varchar(100),
	mid  		varchar(20) not null,
	create_dt	datetime default now(),
	update_dt	datetime default now(),
	primary key(level_code)
);
--drop table level
insert into level values ('level0','준회원','처음 가입한 회원','admin',default,default);
insert into level values ('level1','정회원','최근 3개월간 1만원이상 10회이용','admin',default,default);
insert into level values ('level2','우수회원','최근 3개월간 1만원이상 20회이용','admin',default,default);
insert into level values ('level3','VIP','최근 3개월간 1만원이상 50회이용','admin',default,default);
insert into level values ('level4','판매자','점주 및 배달','admin',default,default);
insert into level values ('level5','관리자','관리자','admin',default,default);

--회원 그룹 테이블
create table groups (
	group_code 	varchar(10) not null,
	group_name 	varchar(20) not null,
	mid  		varchar(20) not null,
	create_dt	datetime default now(),
	update_dt	datetime default now(),
	primary key(group_code)
);
--drop table group_tbl
insert into groups values ('group-c','고객','admin',default,default);
insert into groups values ('group-m','마켓','admin',default,default);
insert into groups values ('group-d','배달','admin',default,default);
insert into groups values ('group-a','관리자','admin',default,default);

--카테고리 테이블
create table category (
	category_code 	varchar(10) not null,
	category_name 	varchar(20) not null,
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(category_code)
);

insert into category values ('m','메뉴','bjy12',default);
insert into category values ('b','빵','bjy12',default);
insert into category values ('v','야채','bjy12',default);
insert into category values ('s','소스','bjy12',default);
insert into category values ('a','추가','bjy12',default);

--제품테이블
create table product (
	product_code	varchar(10) not null,
	product_name	varchar(20) not null,
	category_code 	varchar(10) not null,
	price 			int	not null,
	image			varchar(50),
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(product_code)
);

--옵션테이블
create table option_tbl (
	option_code	varchar(10) not null,
	option_name	varchar(20) not null,
	category_code 	varchar(10) not null,
	price 			int	not null,
	image			varchar(50),
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(option_code)
);
--참조되는 테이블의 컬럼이 수정되면 같이 수정, 참조하고 있는 데이터가 있을 경우 삭제 불가
ALTER TABLE product ADD FOREIGN KEY (category_code)  REFERENCES category(category_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE option_tbl ADD FOREIGN KEY (category_code)  REFERENCES category(category_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

