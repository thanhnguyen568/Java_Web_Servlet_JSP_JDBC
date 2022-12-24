create database demo;
use demo;
create table products (
Id int,
product_code int,
product_name varchar(255),
product_price int,
product_amount int,
product_description varchar(255),
product_status bit
);

alter table  Products
add index U_product_code(product_code);

explain select * from Products where product_code;

alter table  Products
add index I_name_price(product_name, product_price);

explain select * from Products where product_name and product_price;

create view thong_tin as
select product_code, product_name, product_price, product_status
from products;

drop view if exists thong_tin;

/*
Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
*/
DELIMITER $$
create procedure readProduct()
begin
select*
from products;
end; $$
DELIMITER ;
call readProduct();

/*
Tạo store procedure thêm một sản phẩm mới
*/
delimiter $$
create procedure createNew(in Id int, in product_code int, in product_name varchar(255), in product_price int, in product_amount int, in product_description varchar(255), in product_status bit)
begin
insert into products(Id, product_code, product_name, product_price, product_amount, product_description, product_status)
values
(Id, product_code, product_name, product_price, product_amount, product_description, product_status);
end; $$
delimiter ;
call createNew(1,1,'apple',1,1,'des',1);
call createNew(2,2,'samsung',1,1,'des',0);
call createNew(3,3,'oppo',1,1,'des',0);

/*
Tạo store procedure sửa thông tin sản phẩm theo id
*/
delimiter $$
create procedure updateById(in Id int,in product_code int, in product_name varchar(255), in product_price int, in product_amount int, in product_description varchar(255), in product_status bit )
begin
update products
set product_code = product_code,
product_name = product_name,
product_price = product_price,
product_amount = product_amount,
product_description = product_description,
product_status = product_status
where Id = Id;
end; $$
delimiter ;
call updateById(1,1,'apple',1,1,'none',0);

/*
Tạo store procedure xoá sản phẩm theo id
*/
delimiter $$
create procedure deleteById(in id int)
begin
delete from products
where Id = id;
end; $$
delimiter ;
call deleteById(3);

delete from products
where ID = 3;