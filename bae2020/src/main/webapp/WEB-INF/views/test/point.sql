create table point_event(
	event_idx		int not null auto_increment,
	mid				varchar(20) not null,
	order_idx		int ,
	way 			varchar(10) not null,
	amount			int not null,
	event_dt		datetime default now() not null,
	primary key(event_idx)
);
desc point_event
ALTER TABLE point_detail MODIFY way varchar(20) not null;
alter table point_event drop expiry_dt;

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
 
 select sum(amount)
 from point_event
 where mid= 'bjy1234'
 group by mid
 
 insert into point_event value (default, 'bjy1234',1 ,'적립', 1000, '2020-11-15 00:00:00', date(date_add('2020-11-15 00:00:00', interval 7 day)));

 insert into point_detail value (default, 'bjy1234', '적립', 1000, 25 ,27, '2020-11-15 00:00:00', date(date_add('2020-11-15 00:00:00', interval 7 day)));

select *
from (select sum(amount)  as amount, cast(save_detail_idx as char(10)) as save_detail_idx,  cast(expiry_dt as char(10)) as expiry_dt
		  		from point_detail
		 		where mid='bjy1234'
		 		group by save_detail_idx
		 		order by event_dt) point_detail
where amount != 0
  and expiry_dt > date(now())
  limit 1
  
  select * from point_detail

delete from point_event where event_idx =31

update point_detail set save_detail_idx=2 where detail_idx=4

select * from point_detail

select *
  from point_event 
 where 1=1
   and date_sub(now(), interval 3 month) < event_dt
 order by event_dt desc;
 
select pd.amount, pd.save_detail_idx as save_detail_idx, pd.expiry_dt
		   from point_detail pd
		  inner join point_event pe
		     on pe.event_idx = pd.original_idx
		    and pe.order_idx=97
   
SELECT (
                CASE WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '00' AND '02'
                    THEN '00~02시'
                    WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '03' AND '05'
                    THEN '03~05시'
                    WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '06' AND '11'
                    THEN '06~11시'
                    WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '12' AND '14'
                    THEN '12~14시'
                    WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '15' AND '17'
                    THEN '15~17시'
                    WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '18' AND '20'
                    THEN '18~20시'
                    WHEN TO_CHAR(날짜컬럼, 'HH') BETWEEN '21' AND '24'
                    THEN '21~24시'
                    ELSE '' END
              ) AS TITLE
              
          FROM 테이블명
        WHERE TO_CHAR(날짜컬럼, 'YYYYMMDD') = '20180517'
        
SELECT HOUR(create_dt) AS 'HOUR'
, COUNT(create_dt) AS IOS
FROM ORDERS
WHERE create_dt between '2020-12-29 00:00:00' and '2021-01-29 21:00:00'
GROUP BY HOUR(create_dt)
ORDER BY HOUR(create_dt) DESC     

SELECT * FROM ORDERS
        
        