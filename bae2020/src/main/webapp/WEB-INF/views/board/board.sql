create table recommand(
	idx 		int not null auto_increment,  	
	mid 		varchar(20) not null,			
	product		varchar(20) not null,
	option_unit varchar(200),
	add_unit 	varchar(100),
	meat_unit 	varchar(100),
	price		int not null,
	price_add	int,
	price_meat	int,
	create_dt	datetime default now(),
	good 		int default 0,		    /*좋아요*/
	primary key(idx)
);


select rc.*, prod.product_name 
  from recommand rc
 inner join product prod
    on rc.product = prod.product_code
    where 1=1
 order by create_dt desc
 limit 0,5   
 
 insert into recommand value (default,'bjy1234','SAND-001', '','','',5600,0,0,default, default)