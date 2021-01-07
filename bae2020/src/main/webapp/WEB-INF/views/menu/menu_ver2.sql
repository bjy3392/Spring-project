create table category (
	category_code 	varchar(20) not null,
	category_name 	varchar(20) not null,
	first_code		varchar(10) not null, 
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(category_code)
);
--drop table category_test
insert into category_test values (category_code,category_name,first_code,user_id,create_dt)
SELECT CONCAT('PROD', (SELECT LPAD(COUNT(*)+1,3,'0') FROM category where category_code like 'PROD%') )

select * from category

insert into category_test (category_code,category_name,first_code,user_id,create_dt)
select concat('PROD', '-',(select lpad(count(*)+1,3,'0') from category_test where category_code like 'PROD%' )),'test', 'test', 'admin', now() ;
		
select * from category_test where category_code like concat('prod', '%');

create table product (
	product_code	varchar(20) not null,
	product_name	varchar(100) not null,
	category_code 	varchar(20) not null,
	price 			int	not null,
	image			varchar(100),
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(product_code)
);
--drop table product
SELECT * FROM INFORMATION_SCHEMA.table_constraints WHERE constraint_type="FOREIGN KEY" TABLE_NAME= 'item'
alter table cart drop FOREIGN KEY cart_ibfk_1;

select * from product

create table options (
	option_code	varchar(10) not null,
	option_name	varchar(20) not null,
	category_code 	varchar(10) not null,
	price 			int	not null,
	image			varchar(50),
	user_id  		varchar(20) not null,
	create_dt		datetime default now(),
	primary key(option_code)
);
--DROP TABLE option_tbl

--참조되는 테이블의 컬럼이 수정되면 같이 수정, 참조하고 있는 데이터가 있을 경우 삭제 불가
ALTER TABLE product ADD FOREIGN KEY (category_code)  REFERENCES category(category_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE option_tbl ADD FOREIGN KEY (category_code)  REFERENCES category(category_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

insert option_tbl value ('b001','화이트','b',0,'b001.jpg','bjy12',default);
insert option_tbl value ('b002','파마산 오레가노','b',0,'b002.jpg','bjy12',default);

insert option_tbl value ('v001','양상추','v',0,'v001.jpg','bjy12',default);
insert option_tbl value ('v002','토마토','v',0,'v002.jpg','bjy12',default);

insert option_tbl value ('s001','머스타드','s',0,'s001.jpg','bjy12',default);
insert option_tbl value ('s002','스윗 칠리','s',0,'s002.jpg','bjy12',default);

insert option_tbl value ('a001','에그마요','a',3200,'a001.jpg','bjy12',default);
insert option_tbl value ('a002','페퍼로니','a',1800,'a002.jpg','bjy12',default);


select concat(first_code, '-',(select lpad(count(*)+1,3,'0') from product where category_code = 'PROD-001'))
from category_test
where category_code = 'PROD-001'









