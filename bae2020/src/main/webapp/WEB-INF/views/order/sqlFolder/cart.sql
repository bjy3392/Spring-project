create table cart (
	cart_idx		int not null auto_increment,
	mid				varchar(20) not null,
	product			varchar(10) not null,
	options			varchar(200),
	price			int not null,
	cnt				int not null default 1,
	create_dt		datetime default now(),
	update_dt		datetime default now(),
	primary key(cart_idx)
);
ALTER TABLE cart ADD FOREIGN KEY (mid)  REFERENCES user(mid) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE cart ADD FOREIGN KEY (product)  REFERENCES product(product_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
--drop table cart

insert into cart value (default, 'admin', 'm001', '화이트/양상추/머스타드/에그마요/', 9000, default, default, default);

select cart.*, prod.product_name, prod.image
from cart cart
inner join product prod
on cart.product = prod.product_code
where mid='admin'
order by cart_idx;

select * from cart