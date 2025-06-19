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
-- Bảng Customers
insert into customers (c_id, c_name, c_age) values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
-- Bảng Orders
insert into orders (o_id, c_id, o_date, o_total_price) values
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);
-- Bảng Products
insert into products (p_id, p_name, p_price) values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);
-- Bảng Order_Detail
insert into order_detail (o_id, p_id, od_qty) values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
select o_id,o_date,o_total_price from orders;
select customers.c_name,products.p_name from customers 
join orders on customers.c_id = orders.c_id
join order_detail on orders.o_id = order_detail.o_id
join products on order_detail.p_id = products.p_id;
select customers.c_name from customers left join orders on customers.c_id = orders.c_id where orders.o_id is null;
select orders.o_id,orders.o_date, sum(products.p_price*order_detail.od_qty) as total from orders
join order_detail on orders.o_id = order_detail.o_id
join products on order_detail.p_id = products.p_id
group by orders.o_id,orders.o_date; 