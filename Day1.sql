SELECT * FROM practisedb1.student;
create table sample (name char);
desc sample;
describe student;
show tables;
create table patients (pid int, pname varchar(30), DOB date, TOA datetime);
insert into patients values(1, "ABC", "1999-12-09", "2024-08-21 07:26:00");
select * from patients;
select monthname(dob) from patients;
insert into patients values (2, "XYZ", "1998-08-24",now());
select year(dob), toa from patients;
select now();
-- DDl
## Alter
desc student;
alter table student add column Marks int;  
alter table student drop column age;
alter table student modify column sname varchar(30);
alter table student change column sid id int;
alter table student rename to Mystudents;
desc Mystudents;
-- Rename
Rename table mystudents to students;
desc students;
-- Drop
Drop table sample;
use practisedb1;
insert into students (id, course,marks) values(4, "sql",80);
select * from students;
insert into students(id, sname, marks) values(5,"John", 80),(6,"Ram",75);
insert into students values(7, "Johnson", null,80);
-- Update
set sql_safe_updates =0;
update students set sname= "Ramesh" where id = 2;
update students set sname = "Santosh" where course = "sql" and marks = 80;
select 2=2;
select 2>3;
select 2= null;
select 2 is null;
select 2 is not null as output;
update students set marks=0 where marks is null;
select * from students;

update students set course ="Mysql", marks =90 where id =5;
update students set course =0 where course is null;
update students set course = "Mysql";

-- delete
delete from students where id = 4;
delete from students where marks =0;
delete from students;

-- DQL 
select * from myemp;
select * from myemp limit 5;
select * from myemp limit 50,3;
select emp_id, first_name, last_name, salary, dep_id from myemp;
select emp_id, first_name, last_name, salary, salary *0.2 as Bonus from myemp;
select emp_id, first_name, last_name, salary, salary +salary*0.2 as Total_salary_with_Bonuus from myemp;


-- Distinct & order by
select * from myemp;
select distinct dep_id from myemp;
select distinct dep_id, mgr_id from myemp;
select distinct dep_id from myemp order by dep_id;
select distinct dep_id from myemp order by dep_id desc;
select * from myemp order by salary desc;

-- Operators
select * from myemp where dep_id = 30;
select * from myemp where salary > 10000;
select * from muemp where mgr_id =10;
select * from myemp where first_name = "Steven";
select * from myemp where hire_date > "2000-01-01";
select * from myemp where hire_date >"2000-01-01" order by hire_date;
select * from myemp where year(hire_date) >1999 order by hire_date;
select * from myemp where dep_id !=50;

-- Like operator
select * from myemp where first_name like "a%";
select * from myemp where first_name like "%a";
select * from myemp where first_name like "%a%";
select * from myemp where job_id like "%fi%";
select * from myemp where first_name like "john%";
select * from myemp where first_name like "J____";
select * from myemp where first_name like "j%";
-- Between Operator
select * from myemp where salary between 8000 and 10000 order by salary;
-- And & OR Operator
select * from myemp where dep_id =90 and salary>10000;
select * from myemp where dep_id =90 or salary>10000;
select * from myemp where dep_id in (20,30,40);
select * from myemp where hire_date>1995 and salary>7000 and dep_id=50;
select * from myemp where year(HIRE_DATE)>"1995" and salary >5000 and DEP_ID=50;

-- Aggregation and Group By 
select sum(salary) from myemp;
select min(salary),max(salary),avg(salary) from myemp;
select dep_id, avg(salary) from myemp group by dep_id order by dep_id;
select dep_id, round(avg(salary)) from myemp group by dep_id order by dep_id; -- Rounding
select dep_id, round(avg(salary),2) as Avg_salary from myemp group by dep_id order by dep_id;
select dep_id, concat(round(avg(salary)),"K") as Avg_salary from myemp group by dep_id order by dep_id;
select concat(first_name," ",last_name) as Full_name from myemp; -- Concatination
select dep_id, avg(salary) from myemp where dep_id in(20,40,60,80) group by dep_id order by dep_id;
select dep_id, avg(salary) from myemp group by dep_id having dep_id in(20,40,60,80) order by dep_id;  -- Having
select count(*) from myemp;
select count(*) from myemp where dep_id =50;
-- Solved answer
select dep_id, count(*) as emp_count from myemp group by dep_id order by emp_count DESC;
select dep_id, count(*) as emp_count from myemp where salary >10000 group by dep_id order by count(*) desc;

-- Case Statement
select emp_id, first_name, last_name, dep_id, job_id,case
when job_id="ad_pres" then "President"
when job_id ="ad_vp" then "Vice President"
when job_id like "%Prog%" then "Programmer"
when job_id like "fi%" then "Accounts Dept"
when job_id like "pu%" then "Admin dept"
else "Employee"
end as Job_title from myemp;

-- Coalesce
select coalesce(null, null, "Hello", "World",null) as Output;
select coalesce(null,1,null,0) as Result;

-- Constraints
-- Domain
create table student (sid int unique,
                      sname varchar(30) NOT NULL,
                      Age int check (age>21),
                      Course varchar(20) default "SQL",
                      Gender ENUM ("Male", "female"));
desc student;
insert into student (sid, sname, age, gender) values (1, "Siri", 27,"Female");
insert into student values(2,"Harryy", 25, "DA","Male");
insert into student values(3,null,26,"Da","Female"); -- NOT NULL ERROR
insert into student values(3, "John",20,"Ba","Male"); -- Check constraint error
insert into student values(3, "John",24,"Ba","others"); -- ENUM error
select * from student;

-- Primary key
create table sample( id int primary key, sname varchar(30));
desc sample;
alter table sample drop primary key;
alter table sample modify column id int null;

create table sample1 (sid int);
desc sample1;
alter table sample1 modify column sid int unique NOT NULL default "0";
alter table sample1 drop index sid;
alter table sample1 alter column sid drop default;
alter table sample1 modify column sid int null;

-- Foreign Key
delete from authors where authorid = 1;
select * from authors;
select * from books;
update authors set authorid = 80 where authorid =8;
select * from authors;
select * from books;

-- Auto increment 
create table sample2 (id int primary key auto_increment, name varchar(30));
insert into sample2 (name) values ("siri"),("Ram");
select * from sample2;
alter table sample2 auto_increment =100;
insert sample2 (name) values ("Harry"), ("John");
alter table sample2 auto_increment =3;
insert sample2 (name) values ("Tom");
insert into sample2 values (3, "Johnson");
delete from sample2;
insert sample2 (name) values ("Tom"), ("Siri");
truncate table sample2;
insert sample2 (name) values ("Harry"), ("John");
select * from sample2;

-- JOINS
select * from members inner join movies on members.movieid = movies.id; -- innerjoin
select * from members join movies on id = movieid;
select * from members left join movies on id = movieid; -- Left Join
select * from members right join movies on id = movieid; -- Right Join 
select * from drinks cross join meals; -- cross join
select drinkname, mealname, meals.rate from drinks cross join meals;
select drinkname, mealname, meals.rate + drinks.rate as total_cost from meals cross join drinks; -- Cross Join adding two tables
select drinkname, mealname , m.rate + d.rate as total_cost from meals as m cross join drinks as d;
select emp.emp_id, emp.first_name, emp.last_name, emp.mgr_id, mgr.first_name, mgr.last_name 
from myemp as emp join myemp as mgr on emp.mgr_id -mgr.emp_id; -- SELF JOIN
--  FULL JOIN
select * from members left join movies on id = movieid union select * from members right join movies on id = movieid;
select * from members left join movies on id = movieid union all select * from members right join movies on id = movieid;
select id from movies union select movieid from members;
select id from movies union all select movieid from members;
-- IFNULL
select first_name, last_name, title,category from movies left join members on id =movieid;
select ifnull (first_name, "--") as first_name, ifnull(last_name, "--") as last_name, title, category from movies left join members on id = movieid;

-- TCL COMMANDS
start transaction;
insert into students values(2, "Ram", "DA", 80),(3,"Harry", "BA",85);
rollback;
select * from students; -- it will UNDO the result

start transaction;
insert into students values(2, "Ram", "DA", 80), (3, "Harry", "BA", 85), (4,"Johnson" ,"SQL", 84), (5,"John","DA", 78);
commit;
select * from students; -- it will SAVE the result

start transaction;
delete from students;
select * from students;

rollback;

-- Savepoint
start transaction;
update students set course = "DA" where id = 3;
savepoint check1;
insert into students values (6, "Ramesh", "SQL", 75);
savepoint check2;
delete from students where id = 5;
select * from students;
rollback to check2;
select * from students;
rollback to check1;
select * from students;
commit;

-- View
select  ifnull( first_name, "--") as first_name, ifnull (last_name, "--") as last_name, title, category from movies left join members on id = movieid;
create view data1 as select ifnull( first_name, "--") as first_name, ifnull (last_name, "--") as last_name, title, category from movies left join members on id = movieid;
select * from data1;

select emp_id, first_name, last_name , salary,salary *0.2 as Bonus from myemp;
create view bonus_data as select emp_id, first_name, last_name, salary, salary*0.2 as Bonus from myemp;
select * from bonus_data;

-- Views
create view dep_50 as select * from myemp where dep_id = 50;
select * from dep_50;
create view dep_90 as select * from myemp where dep_id =90;
select * from dep_90;

-- ALTER VIEWS
alter view dep_50 as select* from myemp where salary>5000 and dep_id =50;
select * from dep_50;

-- Drop View
Drop view dep_50;

select * from authors;
create view author_view as select * from authors where authorid <10;
select * from author_view;
insert into author_view values(1,"Siri");
update author_view set name = "Thomas" where authorid= 2;
delete from author_view where authorid=7;
select * from authors;
select * from author_view;
drop view author_view;
create view author_view as select * from authors where authorid <10 with check option;
insert into author_view values (30, "Sample"); -- Error
insert into author_view values (9, "Chetan Bhagat");

-- Index 
show indexes from authors;
select * from myemp where hire_date <"2000-01-01";
show indexes from myemp;
create index testing using btree on myemp (hire_date);
drop index testing on myemp;

create table sample3 (id int unique,name varchar(30) not null,phone_num int);
show indexes from sample3;
create unique index testing using btree on sample3 (name, phone_num);
insert into sample3 values(1, "siri",9550);
insert into sample3 values (2, "siri",9550); -- Error

-- Stored Procedures
call proc_author(5);
call proc_variable;
call sample(@President);
select @President;
call proc_grading(105, @105);
select @105;
-- Grading 
call proc_grading(135, @135);
select @135;
-- loop
call Proc_loop(12);

-- Sub queries
 select min(salary) from myemp;
 select * from myemp where salary = 2100;
 select * from myemp where salary = (select max(salary) from myemp);
 
 select * from myemp where salary > (select avg(salary) from myemp) order by salary;
 select * from employees where officeCode in (select officecode from offices where country = "USA" );
 
 -- Triggers
 alter table books add column sales int default 0;
 select * from books;
 create table sample4 ( empid int, ename varchar(30), working_hrs int);
 insert into sample4 values(1, "Harry", -36);
 select * from sample4;
 insert into sample4 values(2, "Siri", -34), (3, "Tom", -48);
 
 -- Windows Functions
 select first_name, last_name, dep_id, avg(salary) over (partition by dep_id) as Avg_salary from myemp;
 -- Rank and dense rank
 select val, rank() over (order by val desc) as Rank1 from t;
 select val, dense_rank() over (order by val desc) as Rank1 from t;
 select * from sales;
 select sales_employee, fiscal_year, sale, dense_rank() over (partition by fiscal_year order by sale desc) as 
 Ranking from sales;
-- Second Highest
select emp_id, first_name, last_name, salary from myemp order by salary desc limit 1,1;
select emp_id, first_name, last_name, salary, dense_rank() over (order by salary desc) as Ranking from myemp limit 1,1;
select emp_id, first_name, last_name, salary from myemp where salary <24000 limit 1;
select max(salary) from myemp where salary <24000;

-- First_value and nth_value
select emp_id, first_name, last_name, salary, first_value(first_name) over (order by salary desc) as highest_paid from myemp;
select emp_id, first_name, last_name, salary, nth_value(first_name, 5) over (order by salary desc) as highest_paid from myemp;

select sales_employee, fiscal_year, sale, dense_rank() over (partition by fiscal_year order by sale desc) as 
 Ranking from sales;
 with sample_cte as (select sales_employee, fiscal_year, sale, dense_rank() over (partition by fiscal_year
 order by sale desc) as Ranking from sales) select sales_employee, fiscal_year, ranking from sample_cte where
 ranking =2;
 
 select * from trains;
 
 select train_id, station, time, lead(time,1) over (partition by train_id order by time) as Next_station_time
 from trains;
 with sample_cte as (select train_id, station, time, lead(time,1) over (partition by train_id order by time)
 as Next_station_time from trains) select train_id, station, time, next_station_time, subtime(next_station_time, time) as 
 Transit_time from sample_cte;












