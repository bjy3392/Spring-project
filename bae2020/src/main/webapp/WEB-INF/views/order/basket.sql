create table order_tbl (
	order_id		int not null auto_increment,
	mid				varchar(20) not null,
	total			int	not null,
	create_dt		datetime default now(),
	update_dt		datetime default now(),
	state_code		varchar(5) not null,
	primary key(order_id)
);

--drop table order_detail

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
	option_code			varchar(10) not null,
	primary key(order_detail_id)
);

ALTER TABLE order_detail ADD FOREIGN KEY (order_id)  REFERENCES order_tbl(order_id) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE order_detail ADD FOREIGN KEY (product_code)  REFERENCES product(product_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE order_detail ADD FOREIGN KEY (option_code)  REFERENCES option_tbl(option_code) ON DELETE RESTRICT ON UPDATE CASCADE ;



