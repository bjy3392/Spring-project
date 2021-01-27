create table point_event(
	event_idx		int not null auto_increment,
	mid				varchar(20) not null,
	order_idx		int not null,
	way 			varchar(10) not null,
	amount			int not null,
	event_dt		datetime default now() not null,
	expiry_dt		DATE ,
	primary key(event_idx)
);

create table point_detail(
	detail_idx		int not null auto_increment,
	mid				varchar(20) not null,
	way 			varchar(10) not null,
	amount			int not null,
	save_detail_idx int not null,
	original_idx	int not null,
	event_dt		datetime default now() not null,
	expiry_dt		DATE ,
	primary key(detail_idx)
);

--drop table point_event;

select date(date_add(now(), interval 7 day))

select if(sum(amount)='',0,sum(amount)) as amount
  from point_event
 where mid = 'bjy1234' 
 group by mid

select * from orders 
select * from point_event
select * from point_detail
 
 select sum(amount), max(expiry_dt)
 from point_event
 group by mid
 
 insert into point_detail value (default, 'bjy1234', '적립', 1000, last_insert_id() ,1, now(), date(date_add(now(), interval 7 day)));

select * 
from (select sum(amount) as amount, save_detail_idx
  		from point_detail
 		where mid='bjy1234'
 		group by save_detail_idx
 		order by event_dt) point_detail
where amount != 0

delete from point_detail where original_idx =11

update point_detail set save_detail_idx=2 where detail_idx=4