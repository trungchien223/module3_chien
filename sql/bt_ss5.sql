create database demo;
use demo;
create table products(
	id int auto_increment,
    product_code varchar(50) not null,
    product_name varchar(100) not null,
    product_price decimal(10,2) not null,
    product_amount int not null,
    product_description text,
    product_status varchar(20),
    primary key(id)
);
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status) 
values ('p001', 'ban phim co', 550000, 50, 'ban phim co co den led', 'con hang'),
('p002', 'chuot khong day', 320000, 30, 'chuot bluetooth sac usb-c', 'con hang'),
('p003', 'man hinh 24 inch', 2500000, 20, 'man hinh full hd', 'sap het hang'),
('p004', 'tai nghe gaming', 780000, 15, 'tai nghe am thanh vong 7.1', 'het hang');
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_product_code on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_name_price on products(product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code = 'p001';
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product_info as
select product_code, product_name, product_price, product_status from products;
-- Tiến hành sửa đổi view
create or replace view view_product_info as
select product_code, product_name, product_price, product_status, product_amount from products;
-- Tiến hành xoá view
drop view if exists view_product_info;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all_products()
begin
    select * from products;
end //
delimiter ;
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(
	in p_code varchar(50),
    in p_name varchar(100),
    in p_price decimal(10,2),
    in p_amount int,
    in p_description text,
    in p_status varchar(20)
)
begin
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values (p_code, p_name, p_price, p_amount, p_description, p_status);
end //
delimiter ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product_by_id(
    in p_id int,
    in p_code varchar(50),
    in p_name varchar(100),
    in p_price decimal(10,2),
    in p_amount int,
    in p_description text,
    in p_status varchar(20)
)
begin
    update products
    set product_code = p_code,
        product_name = p_name,
        product_price = p_price,
        product_amount = p_amount,
        product_description = p_description,
        product_status = p_status
    where id = p_id;
end //
delimiter ;
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id(
    in p_id int
)
begin
    delete from products where id = p_id;
end //
delimiter ;
-- gọi các Store Procedure
call get_all_products();
call add_product('p005', 'ban di chuot', 90000, 40, 'ban di chuot RGB', 'con hang');
call update_product_by_id(1, 'p001', 'ban phim co RGB', 600000, 45, 'ban phim co full led', 'con hang');
call delete_product_by_id(3);