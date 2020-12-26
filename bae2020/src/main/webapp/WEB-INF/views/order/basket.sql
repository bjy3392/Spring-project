create table order_tbl (
	order_id		int not null auto_increment,
	mid				varchar(20) not null,
	total			int	not null,
	create_dt		datetime default now(),
	update_dt		datetime default now(),
	state_code		varchar(5) not null,
	primary key(order_id)
);
insert into order_tbl value (default, 'admin', 3000, default, default, 0);
--drop table order_tbl
select * from order_tbl
delete from order_tbl;
delete from order_tbl where mid='admin'
create table state(
	state_code	varchar(5) not null,
	state_name	varchar(20) not null,
	user_id  	varchar(20) not null,
	create_dt	datetime default now(),
	primary key(state_code)
);

insert into state values ('0','장바구니','admin',default);
insert into state values ('1','결제완료','admin',default);

ALTER TABLE order_tbl ADD FOREIGN KEY (state_code)  REFERENCES state(state_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

create table order_detail (
	order_detail_id		int not null auto_increment,
	order_id			int not null,
	product_code		varchar(10) not null,
	price				int not null,
	options				varchar(200),
	primary key(order_detail_id)
);
--drop table order_detail


ALTER TABLE order_detail ADD FOREIGN KEY (order_id)  REFERENCES order_tbl(order_id) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE order_detail ADD FOREIGN KEY (product_code)  REFERENCES product(product_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
--ALTER TABLE order_detail ADD FOREIGN KEY (option_code)  REFERENCES option_tbl(option_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

select * from order_detail

insert order_tbl value (default,'bj1234',30000,default,default,0);  --test데이터
insert into order_detail value (default,1, 'm001', 'b001/s001');
insert into order_detail value (default,1, 'm001', 'b001/s001');
insert into order_detail value (default,1, 'm001', 'b001/s001/s002');
insert into order_detail value (default,1, 'm002', 'b001/s001/s002');

select * 
from order_tbl
where state_code = "0"

desc order_detail
select * from order_detail where order_id ='1';


select option_code,count(*)
from order_detail a
inner join order_tbl b
on a.order_id = b.order_id
and b.mid = 'admin'
group by option_code, product_code

select order_d.*, prod.product_name, count(*) as cnt
from order_detail as order_d
inner join product as prod 
on order_d.product_code = prod.product_code
where order_id =3
group by order_d.options, order_d.product_code


select * from order_detail order by product_code, options

delete from order_detail
where order_detail_id in (select new.max_val from (select order_detail_id as max_val
   					 		from order_detail 
   							where product_code='m002'
   							and options='화이트/양상추/머스타드/에그마요/') new)

select max(order_detail_id) from order_detail where product_code='m001' and options='파마산 오레가노/머스타드/에그마요/' 

select * from order_detail where options=
