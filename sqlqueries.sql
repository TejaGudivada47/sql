create database customerInformation;
 use customerInformation;
 create table customer(
 customrerid int,
 customerName varchar(30),
 country varchar(20),
 Age int
 );
 insert into customer(customrerid,customerName,country,Age) values(1,"John","usa",31);
 insert into customer (customrerid,customerName,country,Age)  values(2,"Robert","aus",28);
 insert into customer (customrerid,customerName,country,Age)  values(3,"David","uk",26);
 insert into customer (customrerid,customerName,country,Age) values(4,"Betty","uae",45);
 
 create table orders(
 orderid int,
 amount int,
 customer int);
 insert into orders(orderid ,amount,customer) values (1,200,2);
insert into orders(orderid ,amount,customer) values (2,500,3);
insert into orders(orderid ,amount,customer) values (3,800,1);
insert into orders(orderid ,amount,customer) values (4,1200,9);
 
select * from customer;

select * from orders;
 
select * from customer where country="usa";

select * from customer where age>30;

select * from customer where country = "uae" and customerName = "betty";

select * from customer where not country = "usa";

select customerName as name from customer;

select concat(customerName ,"is",Age) from customer;

select customerName ,age from customer limit 2 offset 3;

select * from customer where 'usa' in (country);

select customerName,Age from customer where Age between 30 and 50; 

select customerName,Age from customer where Age not between 30 and 50; 

select max(Age) from customer;

select max(customerName) from customer;

select min(customerName) from customer;

select count(*) as totalcustomers from customer;

select country,count(*) as totalmembers from customer group by country;

select sum(Age) as totalage from customer;

select avg(Age) as average from customer;

select * from customer order by customerName ;

select * from customer order by customerName desc ;

select customerName,Age from customer where not country='uk' order by Age;

select * from customer where country like'aus';

select * from customer where country like'u%';

select * from customer where country not like'usa';

select * from customer where age = (select min(Age) from customer);

select customerid,customerName case when age >=18 then 'allowed' end as can vote  from customer;

select count(customerid), country from customer group by country having count(customerid) >= 1;

select customer.customerid, customer.customerName, orders.amount from customer 
join orders on customer.customerid = orders.customer;


select customer.customerid, customer.customerName, orders.amount from customer 
inner join orders on customer.customerid = orders.customer where orders.amount>=500;


select customer.customerid, customer.customerName, orders.amount from customer 
left join orders on customer.customerid = orders.customer;


select customer.customerid, customer.customerName, orders.amount from customer 
right join orders on customer.customerid = orders.customer;


select customer.customerid, customer.customerName, orders.amount from customer 
full outer join orders on customer.customerid = orders.customer;

alter table customer rename column customrerid to customerid ;

create view customerdata as select customerName,Age from customer where country='usa';

select * from customerdata;
