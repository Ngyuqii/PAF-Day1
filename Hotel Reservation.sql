-- Create database (only create once and block off after creation)
#create database hotelreservation;

-- Use database
use hotelreservation;

-- Create and link tables (only create once and block off after creation)
-- To link main to child table > foreign key(child-field to link) references main-table(main primary key)
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

insert into room (room_type, price) values ('standard', '100');
insert into room (room_type, price) values ('deluxe', '200');
insert into room (room_type, price) values ('suite', '300');
insert into room (room_type, price) values ('presidential', '400');

insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('1', '1', '2023-02-01', '2023-02-02', '100');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('2', '1', '2023-02-02', '2023-02-03', '100');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('3', '2', '2023-02-01', '2023-02-03', '400');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('4', '3', '2023-02-06', '2023-02-08', '600');
insert into reservation (customer_id, room_id, start_date, end_date, total_cost) values('5', '4', '2023-02-09', '2023-02-10', '400');
*/

-- Inner join > select fields required from child-table inner join main-table on child linked-field = main-field
-- "r.id reservation_id" is giving an alias of reservation_id to r.id to avoid confusion between same name fields from 2 tables
-- May add constraints to this
select r.id reservation_id, c.id customer_id, c.first_name, c.last_name, r.start_date, r.end_date, room.room_type, room.price, r.total_cost
from reservation r inner join customer c
on r.customer_id = c.id
inner join room
on r.room_id = room.id;
#where first_name like '%kiat%';

-- Count(*) indicates the total number of records, the following code counts average
select sum(total_cost) / count(*) from reservation;

-- Directly find the avg of total cost from a stated start date
select start_date, avg(total_cost) from reservation
where start_date = "2023-02-01";

-- The number of records for each room_id (group by room_id) in stated period + sort by count in descending order
select 'feb 2023' as period, room_id, count(*) from reservation
group by room_id
order by count(*) desc;

-- Sort by first name in asecending / descending order, if same first_name then next sort by last_name
select * from customer
order by first_name, last_name asc;

-- To delete the database / table
#drop database hotereservation;
#drop table customer;