create database quan_ly_sinh_vien_2;
use quan_ly_sinh_vien_2;
create table classes(
class_id int auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit,
primary key(class_id)
);
create table students(
student_id int not null auto_increment,
student_name varchar(30) not null,
address varchar(100),
phone varchar(10),
status bit,
class_id int not null,
primary key(student_id),
foreign key(class_id) references classes (class_id)
);
create table subjects(
sub_id int not null auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1,
primary key(sub_id)
);
create table marks(
mark_id int not null auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check ( mark between 0 and 100 ),
examtimes tinyint default -1,
unique(sub_id,student_id),
primary key(mark_id),
foreign key(sub_id) references subjects (sub_id),
foreign key(student_id) references students (student_id)
);
insert into classes values (1, 'A1', '2008-12-20', 1),(2, 'A2', '2008-12-22', 1),(3, 'B3', current_date, 0);
insert into students (student_name,address,phone,status,class_id) values ('Hung', 'Ha Noi', '0912113113', 1, 1),('Manh', 'HCM', '0123123123', 0, 2);
insert into students (student_name,address,status,class_id) values ('Hoa', 'Hai phong', 1, 1);
insert into subjects values (1, 'CF', 5, 1),(2, 'C', 6, 1),(3, 'HDJ', 5, 1),(4, 'RDBMS', 10, 1);
insert into marks (sub_id,student_id,mark,examtimes) values (1, 1, 8, 1),(1, 2, 10, 2),(2, 1, 12, 1);
select student_id,student_name,address,phone,status,class_id from students where lower(student_name) like "h%";
select class_id,class_name,start_date,status from classes where month(start_date)=12;
select sub_id, sub_name, credit, status from subjects where credit between 3 and 5;
update students set class_id = 2 where student_id = 1;
select s.student_name as StudentName, 
       sub.sub_name as SubName, 
       m.mark as Mark from marks
join students s on m.student_id = s.student_id
join subjects sub on m.sub_id = sub.sub_id
order by m.mark desc, s.student_name asc;