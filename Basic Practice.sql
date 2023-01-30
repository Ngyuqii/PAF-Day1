-- To create database
#create database leisure;

-- To use database
use leisure;

-- To create table and set the fields
/*
create table tv_shows (
	prog_id int not null,
    title char(64) not null,
    lang char(16) not null,
    official_site varchar(256),
    rating enum('G', 'PG', 'NC16', 'M18', 'R21') not null,
	user_rating float default '0.0',
	release_date date,
	image blob,
	constraint pk_prog_id primary key (prog_id),
	constraint chk_user_rating
		check(user_rating between 0.0 and 10.0)
);

create table tutorials (
	id int not null auto_increment,
    title varchar(100) not null,
    author varchar(80) not null,
    submission_date date,
    constraint pk_tutorial_id primary key (id)
);
*/

-- To insert data in table
#insert into tutorials (title, author, submission_date) values ('CS119', 'Sean', '2023-02-08');

-- Some methods to read specific data
-- Note: a% starts with "a", %a% contains "a", %a ends with "a"
#select a.* from tutorials a limit 5 offset 10;
#select a.id, a.title, a.author from tutorials a where a.author = "Matthew";
#select a.id, a.title, a.author from tutorials a where a.author like "%a%";
#select a.* from tutorials a where a.submission_date between "2023-01-30" and "2023-2-03";
#select a.* from tutorials a where a.id in (1,2,3);
#select a.* from tutorials a where a.author in ("Matthew", "Peter");
#select a.* from tutorials a where a.author not in ("Matthew");
#select a.* from tutorials a where a.author != "Matthew";