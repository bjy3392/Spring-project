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
	cancel			varchar(100) ,
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
alter table orders drop coupon;


alter table orders add cancel varchar(100);

insert into orders (order_idx, mid, total, payment, tel, store, coupon, point,create_dt, state)
value (default, 'bjy1234', 15000, '카드결제','010-5555-1111' ,'STORE-001',default, default, '2020-11-15 00:00:00' ,'state-04')

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

update orders set state='state-01' where order_idx=96

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

select ctg.category_name, sum(item.price+item.price_add+item.price_meat) as sum_price
  from item 
 inner join orders
    on item.order_idx = orders.order_idx
   and date(orders.update_dt) = '2021-01-21' 
 inner join store 
    on orders.store = store.store_code
   and store.manager = 'manager1'
 inner join product prod
    on item.product = prod.product_code
 inner join category ctg
    on prod.category_code = ctg.category_code
 group by prod.category_code

select * from store

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
insert into cart value (default, #{vo.mid}, #{vo.product}, #{vo.option_unit}, #{vo.add_unit}, #{vo.meat_unit}, #{vo.price}, #{vo.price_add}, #{vo.price_meat}, default,#{vo.store} ,default, default);
	
insert into cart value (default, 'admin', 'COOKIE-002', '', '', '', 1000, 0,'', default, default, default);
update cart set STORE='STORE-001' where cart_idx=23
alter table cart add store varchar(20) not null;

--drop table cart;

delete from orders where order_idx=26

select * from cart where cart_idx = 13;

select * from orders

select item.option_name, item.cnt, stock.quantity 
  from (select item.order_idx, item.option_name, sum(item.cnt) as cnt
  		  from (select order_idx, substring_index(item.option_unit,'/',1) as option_name, cnt from item where order_idx in ('54') )item
 		 group by item.option_name, item.order_idx) item
  inner join stock 
     on item.option_name = stock.option_name
    and stock.store = 'store-001' 
 	and stock.subcategory_code = 'opt-001'
  where item.cnt > stock.quantity
  
 select cart.option_name, cart.cnt, stock.quantity 
  from (select cart.option_name, sum(cart.cnt) as cnt
  		  from (select substring_index(cart.option_unit,'/',1) as option_name, cnt from cart where cart_idx in ('62', '63') )cart
 		 group by cart.option_name) cart
  inner join stock 
     on cart.option_name = stock.option_name
    and stock.store = 'store-001' 
 	and stock.subcategory_code = 'opt-001'
  where cart.cnt > stock.quantity
  
select * from product	 

select * from orders where state in ('state-04', 'state-05')