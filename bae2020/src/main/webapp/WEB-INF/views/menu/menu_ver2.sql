create table category (
	category_code 	varchar(20) not null,
	category_name 	varchar(20) not null,
	first_code		varchar(10) not null, 
	user_id  		varchar(20) not null,
	use_yn			varchar(5)   default 'y' not null,
	create_dt		datetime default now(),
	primary key(category_code)
);
--drop table category
select * from category where category_code like 'PROD%' order by category_code
	
alter table category add use_yn varchar(5) default 'y' not null;


select * from category_test where category_code like concat('prod', '%');

select prod.*, ctg.first_code 
  from product prod
 inner join category ctg
    on prod.category_code = ctg.category_code
 where prod.category_code = 'PROD-001';

create table product (
	product_code	varchar(20) not null,
	product_name	varchar(100) not null,
	category_code 	varchar(20) not null,
	price 			int	not null,
	image			varchar(100),
	user_id  		varchar(20) not null,
	use_yn			varchar(5)   default 'y' not null,
	create_dt		datetime default now(),
	primary key(product_code)
);


--drop table product
SELECT * FROM INFORMATION_SCHEMA.table_constraints WHERE constraint_type="FOREIGN KEY" TABLE_NAME= 'item'
alter table cart drop FOREIGN KEY cart_ibfk_1;

select * from product

alter table options add use_yn varchar(5) default 'y' not null;

create table subcategory(
	subcategory_code 	varchar(20) not null,
	subcategory_name 	varchar(20) not null,
	category_code 	varchar(20) not null,
	first_code		varchar(10) not null, 
	user_id  		varchar(20) not null,
	use_yn			varchar(5)   default 'y' not null,
	create_dt		datetime default now(),
	primary key(subcategory_code)
);
--drop table subcategory
select * from subcategory where category_code = 'prod-001';

ALTER TABLE options ADD FOREIGN KEY (subcategory_code)  REFERENCES subcategory(subcategory_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

create table options (
	option_code	varchar(20) not null,
	option_name	varchar(100) not null,
	subcategory_code 	varchar(20) not null,
	price 			int	not null,
	image			varchar(100),
	user_id  		varchar(20) not null,
	use_yn			varchar(5)   default 'y' not null,
	create_dt		datetime default now(),
	primary key(option_code)
);
--DROP TABLE option_tbl
--DROP TABLE options

select * from options

alter table options drop primary key;

ALTER TABLE options
ADD PRIMARY KEY (option_code,subcategory_code);

desc options

--참조되는 테이블의 컬럼이 수정되면 같이 수정, 참조하고 있는 데이터가 있을 경우 삭제 불가
ALTER TABLE product ADD FOREIGN KEY (category_code)  REFERENCES category(category_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE option_tbl ADD FOREIGN KEY (category_code)  REFERENCES category(category_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

select concat(first_code, '-',(select lpad(count(*)+1,3,'0') from product where category_code = 'PROD-001'))
from category_test
where category_code = 'PROD-001'

select * from user





