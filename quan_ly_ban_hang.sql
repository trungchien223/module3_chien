create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customers(
	c_id int,
    c_name varchar(30),
    c_age int,
    primary key(c_id)
    );
    create table products(
    p_id int,
    p_name varchar(30),
    p_price decimal(10,2),
    primary key(p_id)
    );
    create table orders(
    o_id int,
    c_id int,
    o_date date,
    o_total_price decimal(10,2),
    primary key(o_id),
    foreign key(c_id) references customers(c_id)
    );
    create table order_detail(
	o_id int,
    p_id int,
    od_qty varchar(200),
    primary key(o_id,p_id),
    foreign key(o_id) references orders(o_id),
    foreign key(p_id) references products(p_id)
    );
    