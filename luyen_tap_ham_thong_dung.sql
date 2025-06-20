create database quan_ly_sinh_vien_3;
use quan_ly_sinh_vien_3;
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
examtimes tinyint default 1,
unique(sub_id,student_id),
primary key(mark_id),
foreign key(sub_id) references subjects (sub_id),
foreign key(student_id) references students (student_id)
);
select address, count(student_id) as 'so luong hoc vien'
from students
group by address;
select students.student_id, students.student_name, avg(marks.mark) as diem_trung_binh
from students
join marks on students.student_id = marks.student_id
group by students.student_id, students.student_name
having avg(marks.mark) >= all (select avg(mark) from marks group by student_id);
-- Hiển thị tất cả thông tin môn học có credit lớn nhất
select sub_id, sub_name, credit, status
from subjects
where credit >= all (select credit from subjects);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất
select subjects.sub_id, subjects.sub_name, subjects.credit, subjects.status
from subjects
join marks on subjects.sub_id = marks.sub_id
where marks.mark >= all (select mark from marks);
-- Hiển thị thông tin sinh viên và điểm trung bình, xếp theo điểm giảm dần
select students.student_id, students.student_name, students.address, students.phone, students.status, students.class_id,
avg(marks.mark) as diem_trung_binh
from students
join marks on students.student_id = marks.student_id
group by students.student_id, students.student_name, students.address, students.phone, students.status, students.class_id
order by diem_trung_binh desc;
