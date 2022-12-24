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
add unique index U_product_code(product_code);

explain select * from Products where product_code;

alter table  Products
add index I_name_price(product_name, product_price);

explain select * from Products where product_name and product_price;

