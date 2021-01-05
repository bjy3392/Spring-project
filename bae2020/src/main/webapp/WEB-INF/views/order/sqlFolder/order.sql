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
	store			varchar(10) not null,
	delivery		varchar(10) ,
	coupon			varchar(20) not null default 0,
	point			int	not null default 0,
	create_dt		datetime default now(),
	update_dt		datetime default now(),
	state			varchar(10) not null default 'state0',
	primary key(order_idx)
);
ALTER TABLE orders ADD FOREIGN KEY (state)  REFERENCES state(state_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE orders ADD FOREIGN KEY (mid)  REFERENCES user(mid) ON DELETE RESTRICT ON UPDATE CASCADE ;
--쿠폰이랑 매장, 배달 코드도 외래키 연결 해줘야함

select * from orders;

insert into orders value (default, 'admin', 92200,"card",'' ,'' ,'' , '010-4158-3031','' , '미정', '픽업', 0, 0, default, default, default);	


--drop table orders;


create table item (
	item_idx		int not null auto_increment,
	order_idx		int not null,
	product			varchar(10) not null,
	options			varchar(200),
	price			int not null,
	cnt				int not null default 1,
	primary key(item_idx)
);
--drop table item
insert into item ( order_idx ,product, options, price, cnt)
(select 2, product, options, price, cnt from cart where cart_idx in (28,29))


ALTER TABLE item ADD FOREIGN KEY (order_idx)  REFERENCES orders(order_idx) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE item ADD FOREIGN KEY (product)  REFERENCES product(product_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
--ALTER TABLE order_detail ADD FOREIGN KEY (option_code)  REFERENCES option_tbl(option_code) ON DELETE RESTRICT ON UPDATE CASCADE ;

select * from item

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



