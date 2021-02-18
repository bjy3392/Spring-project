create table stock (
	option_code	varchar(20) not null,
	option_name	varchar(100) not null,
	subcategory_code 	varchar(20) not null,
	store 				varchar(20) not null,
	quantity 			int	not null,
	use_yn			varchar(5)   default 'y' not null,
	create_dt		datetime default now(),
	primary key(option_code,store)
);

ALTER TABLE stock ADD FOREIGN KEY (store)  REFERENCES store(store_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE stock ADD FOREIGN KEY (option_code)  REFERENCES options(option_code) ON DELETE RESTRICT ON UPDATE CASCADE ;
ALTER TABLE stock ADD FOREIGN KEY (subcategory_code)  REFERENCES subcategory(subcategory_code) ON DELETE RESTRICT ON UPDATE CASCADE ;


insert into stock (option_code, option_name, subcategory_code,store, quantity, user_id, use_yn, create_dt)
(select option_code, option_name, subcategory_code,'STORE-001', 0, #{user_id}, 'y', now()
from options
where option_code like 'BREAD-%'
AND use_yn = 'y')

select * from store

alter table stock drop user_id;

delete from store where store_code ="STORE-003"

select * from stock


select opt.*, st.quantity from options opt
left outer join stock st
  on opt.option_code = st.option_code
 and st.store='STORE-001'
 where subcategory_code=#{subcategory_code}
   and use_yn ='y';
   
select st.quantity as quantity
  from stock st
 inner join options opt
    on st.option_code = opt.option_code
   and opt.option_name='파마산 오레가노'
 where st.store = 'store-001'  
 
   
update stock set quantity=0 where option_code='bread-004' and store ='store-001'


select cart.*, prod.product_name, st.quantity
  from cart cart
 inner join product prod
    on cart.product = prod.product_code
   left outer join options opt
    on substring_index(cart.option_unit,'/',1) = opt.option_name
   and opt.subcategory_code = 'opt-001'
  left outer join stock st
    on opt.option_code = st.option_code
   and st.store='store-001'
   
   select * from user
   
select * from orders where mid= 'lmj1234'
   
select cart.option_name, cart.cnt, stock.quantity 
		  from (select substring_index(cart.option_unit,'/',1) as option_name, sum(cart.cnt) as cnt 
  		          from cart 
  		         where 1=1
  		           and cart_idx in ()
			       and substring_index(cart.product,'-',1)='SAND'	
			     group by option_name )cart
		  inner join stock 
		     on cart.option_name = stock.option_name
		    and stock.store = #{store} 
		 	and stock.subcategory_code = 'opt-001'
		  where stock.quantity != 0
		    and cart.cnt > stock.quantity