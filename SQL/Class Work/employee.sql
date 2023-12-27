create database emp;
use emp;


create table employees (id int primary key,name_ varchar(50) not null,city varchar(50) not null,gender varchar(20) not null,salary int,dept varchar(20) not null);

select *from employees;

insert into employees values
(1,"lusy","pune","m",2000,"da"),
(2,"bob","surat","f",3000,"wd"),
(3,"kris","pune","m",1200,"wd"),
(4,"jass","pune","f",2300,"da"),
(5,"roman","abad","f",2346,"da"),
(6,"johan","abad","m",23466,"ds"),
(7,"tesa","pune","m",2000,"ds");




-- 1 department wise sum of salary.

select 
	dept, sum(salary) 
from employees
group by dept;



-- 2 gender wise count of employees.

select 
	gender,count(name_) 
from employees
group by gender;



-- 3 sum of salary by gender.

select 
	gender,sum(salary) 
from employees
group by gender;



-- 4 sum of salary by dept.

select 
	dept,sum(salary) 
from employees
group by dept;



-- 5 count of people from city.

select 
	city,count(name_) 
from employees
group by city;



-- 6 avg of salary, sum of salary by city.

select 
	avg(salary), sum(salary),city 
from employees 
group by city;