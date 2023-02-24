-- tables creation
CREATE TABLE orders (
  orderid INT,
  order_date date,
  customerid INT,
  typeid INT,
  foodid INT,
  PRIMARY KEY (orderid),
  FOREIGN KEY (customerid) references customers(customerid),
  FOREIGN KEY (typeid) references order_type(typeid),
  FOREIGN KEY (foodid) references food_order(foodid)
);
-- dim1: customers
create table customers (
  customerid int primary key,
  custname text,
  gender text,
  memberid int,
  foreign key (memberid) references membership(memberid)
);
--dim2: order_type
create table order_type (
  typeid INT,
  types text,
  primary key (typeid)
);
--dim3: food_order
create table food_order (
  foodid int,
  food_is text,
  og_price real,
  primary key (foodid)
);
--dim4: membership
create table membership (
  memberid int,
  memberdate date,
  discount float,
  primary key (memberid)
);

-- fact: order summary
INSERT INTO orders VALUES 
(1, '2022-08-01', 1, 1, 3),
(2, '2022-08-02', 2, 2, 4),
(3, '2022-08-02', 3, 1, 1),
(4, '2022-08-03', 4, 1, 1),
(5, '2022-08-03', 5, 2, 2)
;
-- dim1: customers
insert into customers values
(1, 'Ethan', 'Male', 2201),
(2, 'Julian', 'Male', NULL),
(3, 'Penny', 'Female', 2202),
(4, 'Richard', 'Male', 2203),
(5, 'Judd', 'Male', NULL);
-- dim2: order types (indoor or take home)
insert into order_type values
(1, 'indoor'),
(2, 'take home'); 
--dim3: ordered menus
insert into food_order values
(1, 'beef steak', 57.99),
(2, 'brunch set', 10.19),
(3, 'HSP', 15.00),
(4, 'Lasagna', 24.00);
--dim4: membership check
insert into membership values
(2201, '2022-07-22', 0.1),
(2202, '2022-07-22', 0.1),
(2203, '2022-06-30', 0.15),
(0, '2020-01-01', 0);

-- sqlite command
.mode markdown
.header on 

-- query 1: show customer names for the waiter at the counter
select
  orderid, custname
FROM
  orders, customers
where
  orders.customerid = customers.customerid;

--query 2: makes waiters check if they are membership or not
with sub as(
  select
    customerid,
    membership.memberid,
    case
      when customers.memberid is null then 'NOT MEMBER'
      else 'IS MEMBER'
      end as meow
  from customers, membership
  where coalesce(customers.memberid, 0) = membership.memberid
)
select * from sub;

-- query 3: call out customer name, their menu, their type and calculate final price
select
  customers.custname,
  food_order.food_is,
  order_type.types,
  food_order.og_price * (1-membership.discount) as final_price
from orders, food_order, order_type, membership, customers
where
  orders.foodid = food_order.foodid and
  orders.typeid = order_type.typeid and
  orders.customerid = customers.customerid and
  coalesce(customers.memberid, 0) = membership.memberid;