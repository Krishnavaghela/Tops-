create database sales;
use sales;

create table salesman(salseman_id int primary key,name_ varchar(30)not null,city varchar(40),commission decimal(5,2));

insert into salesman values
(5001,"Jamed_Hoog","New_York",0.15),
(5002,"Nail_Knite","Paris",0.13),
(5005,"Pit_Alex","London",0.11),
(5006,"Mc_Lyon","London",0.14),
(5007,"Paul_Adom","Rome",0.13),
(5003,"Lauson_Hen","Sen_Jose",0.12);




-- 1) write a sql statement that displays all the information about all saespeople.

select * from salesman;



-- 2) write a sql statement that displays specific columns such as names and commissions for all salespeople.

select name_,commission from salesman;





create table orders (ord_no int primary key,purch_amt int,ord_date date, customer_id int not null,salesman_id int not null);

insert into orders values
(70001,150.5,"2012-10-05",3005,5002),
(70009,270.65,"2012-09-10",3001,5005),
(70002,65.26,"2012-10-05",3002,5001),
(70004,110.5,"2012-08-17",3009,5003),
(70007,948.5,"2012-09-10",3005,5002),
(70005,2400.6,"2012-07-27",3007,5001),
(70008,5760,"2012-09-10",3002,5001);




-- 3) write a query to display the columns in specific order such as order date, salesman id, order number, and purchese amount for all orders.

select ord_date,salesman_id,ord_no,purch_amt from orders;



-- 4)from the following table write sql query to identify the unique salespeople id. return salesman_id.

select distinct salesman_id from orders;



-- 5)from the following table write sql query to locate salespeople who live in the city of 'paris'. Return salespersons name, city.

select name_ from salesman where city = 'Parise'; 




create table customer(customer_id int primary key,cust_name varchar(30),city varchar(30),grade int,salesman_id int);

insert into customer values
(3002,"Nick_Rimando","New_York",100,5001),
(3007,"Brad_Davis","New_York",200,5001),
(3005,"Graham_Zusi","California",200,5002),
(3008,"Julian_Green","Landon",300,5002),
(3004,"Fabin_Johnson","Paris",300,5006),
(3009,"Geoff_Cameron","Berlin",100,5003),
(3003,"Jozy_Altidor","Moscow",200,5007);




-- 6) from the following table write sql query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.

select * from customer
where grade=200;




-- 7) from the following table write sql query to find orders that are delivered by a salesperson with id 5001. Return ord_no, ord_date, purch_amt.

select * from orders
where salesman_id=5001;


