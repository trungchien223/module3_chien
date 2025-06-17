create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
	id int auto_increment,
    name_student varchar(30) not null,
    primary key(id)
    );
    select id,name_student from class;
    insert into class (name_student) values ("ChiếnTT"),("VĩnhNĐ");
    create table teachers(
		id int auto_increment,
        name_teacher varchar(30) not null,
        age int,
        country varchar(50),
        primary key(id)
        );
        select * from teachers;
        insert into teachers (name_teacher, age, country) values ("Nguyễn Văn A", 35, "Việt Nam"),
       ("Trần Thị B", 29, "Nhật Bản");
    