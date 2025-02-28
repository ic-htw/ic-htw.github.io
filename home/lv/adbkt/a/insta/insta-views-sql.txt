drop view prior_orders_of_test_users;
drop view prior_orders_3_of_test_users;
drop view user_products;
drop view testorders_products;
drop view vsubmission;

create view prior_orders_of_test_users as
select prior_orders.user_id, order_number, order_id
from
   (select user_id, order_number, order_id
   from orders
   where eval_set = 'prior') prior_orders
 inner join
  (select distinct user_id from orders where eval_set = 'test') test_user_ids
 on prior_orders.user_id = test_user_ids.user_id;

create view prior_orders_3_of_test_users as
select order_id, user_id, order_number
from
  (select order_id, user_id, order_number, rank() over (partition by user_id order by order_number desc) as rank
  from prior_orders_of_test_users) x
where rank <= 3;


create view user_products as
select user_id, product_id
from prior_orders_3_of_test_users o3
     inner join order_products__prior opp on o3.order_id = opp.order_id
group by user_id, product_id
having avg(reordered) >= 0.5;
  
create view testorders_products as
select order_id, product_id
from orders o inner join user_products up on o.user_id = up.user_id
where eval_set='test';
  
create view vsubmission as
select s.order_id, string_agg(product_id, ' ') as products
from submission s 
     left join testorders_products tp on s.order_id=tp.order_id
group by s.order_id;

