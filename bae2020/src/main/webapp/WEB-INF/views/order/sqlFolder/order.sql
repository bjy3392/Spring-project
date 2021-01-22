create table orders (
	order_idx		int not null auto_increment,
	mid				varchar(20) not null,
	total			int	not null,
	payment			varchar(50) not null,
	postcode		varchar(10) ,
	roadAddress		varchar(50) ,
	detailAddress	varchar(50) ,
	tel				varchar(20) not null,		
	demand			varchar(100) ,
	store			varchar(20) not null,
	delivery		varchar(20) ,
	distance		DECIMAL(3,2) ,
	coupon			varchar(50) not null default 0,
	point			int	not null default 0,
	create_dt		datetime default now(),
	update_dt		datetime default now(),
	state			varchar(20) not null default 'state-01',
	primary key(order_idx)
);
ALTER TABLE orders ADD FOREIGN KEY (state)  REFERENCES state(state_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE orders ADD FOREIGN KEY (mid)  REFERENCES user(mid) ON DELETE RESTRICT ON UPDATE CASCADE ;
--쿠폰이랑 매장, 배달 코드도 외래키 연결 해줘야함

ALTER TABLE orders MODIFY distance DECIMAL(3,2) ;

select orders.*
  from orders
 inner join store
    on orders.store = store.store_code
 inner join user 
    on store.manager = user.mid
   and user.mid = 'manager1'
 where date(orders.create_dt) = date(now())
 order by orders.create_dt;

select * from orders
where date(create_dt) = date(now());

update orders set STORE='STORE-001' where order_idx=20

select * from orders;
select * from store
desc orders;

update orders set state='state-04' where order_idx=25
select * from state
--drop table orders;

select * from item

create table item (
	item_idx		int not null auto_increment,
	order_idx		int not null,
	product		varchar(20) not null,
	option_unit varchar(200),
	add_unit 	varchar(100),
	meat_unit 	varchar(100),
	price		int not null,
	price_add	int,
	price_meat	int,
	cnt			int not null default 1,
	primary key(item_idx)
);

alter table item add mid varchar(20) not null;
alter table item add create_dt datetime default now();

--drop table item
ALTER TABLE item ADD FOREIGN KEY (order_idx)  REFERENCES orders(order_idx) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE item ADD FOREIGN KEY (product)  REFERENCES product(product_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
--ALTER TABLE order_detail ADD FOREIGN KEY (option_code)  REFERENCES option_tbl(option_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

select * from item
desc item

select orders.order_idx,orders.total, state.state_name, prod.product_name , count(*) as cnt
from item
inner join orders 
on item.order_idx = orders.order_idx
and orders.mid = 'admin'
inner join product prod
on item.product = prod.product_code
inner join state
on state.state_code = orders.state
where orders.state = 'state0'

group by orders.order_idx


select item.* , prod.product_name as product
from item
inner join orders 
on item.order_idx = orders.order_idx
and orders.mid = 'admin'
inner join product prod
on item.product = prod.product_code
where orders.state <> 'state0'

select '3' as order_idx, product, option_unit, add_unit, meat_unit, price, price_add,price_meat, cnt 
  	from cart 
  	where cart_idx =2


select * from cart

create table cart(
	cart_idx 	int not null auto_increment,
	mid 		varchar(20) not null,
	product		varchar(20) not null,
	option_unit varchar(200),
	add_unit 	varchar(100),
	meat_unit 	varchar(100),
	price		int not null,
	price_add	int,
	price_meat	int,
	cnt			int not null default 1,
	store		varchar(20) not null,
	create_dt	datetime default now(),
	update_dt	datetime default now(),
	primary key(cart_idx)
);

desc cart

insert into cart value (default, 'admin', 'COOKIE-002', '', '', '', 1000, 0,'', default, default, default);
update cart set STORE='STORE-001' where cart_idx=23
alter table cart add store varchar(20) not null;

--drop table cart;

delete from orders where order_idx=26

select orders.order_idx, orders.total, orders.update_dt, store.store_name, prod.product_name, item.cnt
  from orders
 inner join (select product, count(*) as cnt, order_idx 
 			   from item  
 			  where 1=1
 			    and mid = 'bjy1234'
 			  group by order_idx) item
   on orders.order_idx = item.order_idx  
 inner join store
    on orders.store = store.store_code
 inner join product prod
    on item.product = prod.product_code
 where 1=1
   and mid = 'bjy1234'
   and orders.state='state-04'
 
   select * from orders
   where 1=1
   and mid = 'bjy1234'
   and orders.state='state-04'
select * from item where mid = 'bjy1234'
   update item set mid='bjy1234' where order_idx=24