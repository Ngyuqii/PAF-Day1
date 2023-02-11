-- Create database (only create once and block off after creation)
#create database hotelreservation;

-- Use database
use hotelreservation;

-- Create and link tables (only create once and block off after creation)
-- To link main to child table > foreign key(main-field to link) references main-table(main primary key)
/*
create table employee (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    salary int not null,
	constraint employee_id primary key(id)
);

create table dependant(
	id int not null auto_increment,
    employee_id int not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    relationship varchar(50) not null,
    birth_date date,
    constraint dependant_id primary key(id),
    foreign key(employee_id) references employee(id)
);

create table room(
	id int not null auto_increment,
    room_type enum ('standard', 'deluxe', 'suite', 'presidential') not null,
    price int not null,
    constraint room_id primary key(id)
);

create table customer (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    constraint customer_id primary key(id)
);

create table reservation(
	id int not null auto_increment,
    customer_id int not null,
    room_id int not null,
    start_date date,
    end_date date,
    total_cost int not null,
    constraint reservation_id primary key (id),
    foreign key(customer_id) references customer(id),
    foreign key(room_id) references room(id)
);
*/

-- Adding data into the tables
-- Insert the id field manually if id field was not initially set to auto_increment
-- Main value must exist to be inserted into child table
/*
insert into customer (first_name, last_name) values ('James', 'Bond');
insert into customer (first_name, last_name) values ('Swee Kiat', 'Ng');
insert into customer (first_name, last_name) values ('Lawrence', 'Wong');
insert into customer (first_name, last_name) values ('Chan Meng', 'Khoong');
insert into customer (first_name, last_name) values ('Chan Kiat', 'Wong');
insert into customer (first_name, last_name) values ('Desmond', 'Koh');
insert into customer (first_name, last_name) values ('Pritam', 'Singh');
insert into customer (first_name, last_name) values ('Edwin', 'Tong');
insert into customer (first_name, last_name) values ('James', 'Wong');

insert into room (room_type, price) values ('standard', '100');
insert into room (room_type, price) values ('deluxe', '200');
insert into room (room_type, price) values ('suite', '300');
insert into room (room_type, price) values ('presidential', '400');

insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('1', '1', '2023-02-01', '2023-02-02', '100');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('2', '1', '2023-02-02', '2023-02-03', '100');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('3', '2', '2023-02-01', '2023-02-03', '400');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('4', '3', '2023-02-06', '2023-02-08', '600');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('5', '4', '2023-02-09', '2023-02-10', '400');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('1', '1', '2023-03-01', '2023-03-02', '100');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('2', '2', '2023-03-13', '2023-03-15', '600');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('3', '3', '2023-03-16', '2023-03-17', '300');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('4', '3', '2023-03-16', '2023-03-18', '600');

insert into employee (first_name, last_name, salary) values ('Terry', 'Lim', '3000');
insert into employee (first_name, last_name, salary) values ('Gregory', 'Chua', '5000');
insert into employee (first_name, last_name, salary) values ('Maxim', 'Ng', '6000');

insert into dependant (employee_id, first_name, last_name, relationship, birth_date) values ('1', 'Sam', 'Lim', 'father', '1998-01-02');
insert into dependant (employee_id, first_name, last_name, relationship, birth_date) values ('1', 'Sally', 'Tan', 'spouse', '1970-05-09');
insert into dependant (employee_id, first_name, last_name, relationship, birth_date) values ('2', 'Pamela', 'Chua', 'father', '2010-08-28');
insert into dependant (employee_id, first_name, last_name, relationship, birth_date) values ('3', 'Joseph', 'Ng', 'father', '2008-04-01');
*/

-- To duplicate table including data
#create table customer2 as select * from customer

-- Update records to table
/* update customer
set first_name = "Kenneth", last_name = "Lim"
where id = 9;
*/

-- Delete records from table
#delete from customer where id = 9;

-- Inner join adds main-tables to the child table > select fields required from child-table inner join main-table on child linked-field = main-field
-- "r.id reservation_id" is giving an alias of reservation_id to r.id to avoid confusion between same name fields from 2 tables
-- May add constraints / order to this
-- Other options include left join / right join / full join
/*
select e.id employee_id, e.first_name, e.last_name, e.salary, d.id dependant_id, d.first_name, d.last_name, d.relationship, d.birth_date
from dependant d inner join employee e
on d.employee_id = e.id

select r.id reservation_id, c.id customer_id, c.first_name, c.last_name, room.room_type, room.price, r.start_date, r.end_date, r.total_cost
from reservation r inner join customer c
on r.customer_id = c.id
inner join room
on r.room_id = room.id
# where first_name like '%kiat%'
order by start_date;
*/

-- View to create a table-data from a conditional view of a base table or show an aggregated data from a join of 2 base tables
/*
create view employee_dependancy as
select e.id employee_id, e.first_name employee_FN, e.last_name employee_LN, e.salary, d.id dependant_id, d.first_name dependant_FN, d.last_name dependant_LN, d.relationship, d.birth_date
from dependant d inner join employee e
on d.employee_id = e.id;

create view booking_records as
select r.id reservation_id, c.id customer_id, c.first_name, c.last_name, room.room_type, room.price, r.start_date, r.end_date, r.total_cost
from reservation r inner join customer c
on r.customer_id = c.id
inner join room
on r.room_id = room.id;
*/
-- To read data from views
/*
select * from employee_dependancy;
select * from booking_records;
*/

-- Some methods to extract specific data
/*
-- Count(*) indicates the total number of records, the following code counts average
select sum(total_cost) / count(*) as avg_price_per_stay from reservation;

-- Directly find the avg of total cost from a stated start date
select start_date, avg(total_cost) from reservation
where start_date = "2023-02-01";

-- Sort by first name in asecending / descending order, if same first_name then next sort by last_name
select * from customer
order by first_name, last_name asc;

-- The number of records for each room_id (group by room_id) in stated period + sort by count in descending order
select 'Feb 2023' as period, room_id, count(*) from reservation
where start_date between "2023-02-01" and "2023-02-28"
group by room_id
order by count(*) desc;

 -- Union to combine both sections
select 'Feb 2023' as period, room_id, count(*) from reservation
where start_date between "2023-02-01" and "2023-02-28"
group by room_id
union 
select 'Mar 2023' as period, room_id, count(*) from reservation
where start_date between "2023-03-01" and "2023-03-31"
group by room_id;

-- Sub Query
select customer_id, count(*) from
(select r.id reservation_id, c.id customer_id, c.first_name, c.last_name, room.room_type, room.price, r.start_date, r.end_date, r.total_cost
from reservation r inner join customer c
on r.customer_id = c.id
inner join room
on r.room_id = room.id) booking
group by customer_id;
*/

-- To delete the database / table
#drop database hotereservation;
#drop table customer;