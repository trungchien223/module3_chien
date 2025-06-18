create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table students(
id int,
 name varchar(200),
 age int,
 country varchar(50)
);
create table classes(
id int auto_increment,
name varchar(30) not null,
primary key(id)
);
create table teachers(
id int auto_increment,
name varchar(30) not null,
age int,
country varchar(30),
primary key(id)
);
select id,name,age from teachers;
insert into teachers (name,age) values ("HaiTT","30");
