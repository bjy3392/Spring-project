select * from state

update state set state_name='주문 접수 중' 


select * from groups
select * from level

--drop table state

create table state (
	state_code 	varchar(20) not null,
	state_name 	varchar(30) not null,
	user_id   	varchar(20) not null,
	create_dt	datetime default now(),
	primary key(state_code)
);

insert into state value ('state-01','주문접수 중','admin',default);
insert into state value ('state-02','준비 중','admin',default);
insert into state value ('state-03','배달 중','admin',default);
insert into state value ('state-04','배달완료','admin',default);

desc level

update level set level_code = 'level-06' where level_name='관리자' 

select * from options where option_code ='CHEESE-001' limit 1

select * from product
where product_code = 'CHOP-003'

select * from product
where product_code = 'SAND-003'

desc product