select * from state

update state set state_name='주문 접수 중' 


select * from groups
select * from level

drop table state

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