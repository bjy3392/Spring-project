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
select * from category

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

insert product value ('m001','에그마요','m',5800,'m001.jpg','bjy12',default);
insert product value ('m002','얼터밋','m',6200,'m002.jpg','bjy12',default);
insert product value ('m003','쉬림프','m',4800,'m003.jpg','bjy12',default);
insert product value ('m004','폴드포크','m',5500,'m004.jpg','bjy12',default);
insert product value ('m005','써브웨이 멜트','m',7000,'m005.jpg','bjy12',default);
insert product value ('m006','비엘티','m',6500,'m006.jpg','bjy12',default);

insert option_tbl value ('b001','화이트','b',0,'b001.jpg','bjy12',default);
insert option_tbl value ('b002','파마산 오레가노','b',0,'b002.jpg','bjy12',default);

insert option_tbl value ('v001','양상추','v',0,'v001.jpg','bjy12',default);
insert option_tbl value ('v002','토마토','v',0,'v002.jpg','bjy12',default);

insert option_tbl value ('s001','머스타드','s',0,'s001.jpg','bjy12',default);
insert option_tbl value ('s002','스윗 칠리','s',0,'s002.jpg','bjy12',default);

insert option_tbl value ('a001','에그마요','a',3200,'a001.jpg','bjy12',default);
insert option_tbl value ('a002','페퍼로니','a',1800,'a002.jpg','bjy12',default);


select * from content where category_code in "bvsa"

select * from user


