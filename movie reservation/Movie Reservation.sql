#Create database moviereservation;

use moviereservation;

-- Practice to create tables for the following schema
-- A cinema has many theatres which have many show schedules + A movie has many show schedules which have many bookings + An online user may make many bookings
-- Foreign key included in the "many" / child-table
/*
create table cinema(
	id varchar(10) not null,
    cinema_name varchar(50) not null,
    num_of_theatre int,
    primary key(id)
    );

create table theatre(
	id varchar(10) not null,
    cinema_id varchar(10),
    num_of_seats int not null,
    primary key(id),
    foreign key(cinema_id) references cinema(id)
);

create table movie(
 	id varchar(10) not null,
	title varchar (100) not null,
	lang varchar(10),
	genre varchar(20),
	primary key (id)
 );

create table screening(
	id int not null auto_increment,
    show_date date not null,
    show_time time not null,
    seats_left int not null,
    theatre_id varchar(10),
    movie_id varchar(10),
    primary key(id),
    foreign key(theatre_id) references theatre(id),
    foreign key(movie_id) references movie(id)
);

create table online_user(
	id varchar(10) not null,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100),
    phone varchar(10) not null,
    primary key (id)
);

create table booking(
	id varchar(20) not null,
    num_of_tickets int not null,
    total_cost int not null,
    online_user_id varchar(10),
    screening_id int,
    primary key (id),
    foreign key (online_user_id) references online_user(id),
    foreign key (screening_id) references screening(id)
 );
  */