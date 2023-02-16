CREATE DATABASE `demo`;
USE demo;

CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

insert into users(name, email, country) 
	values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) 
	values('Kante','kante@che.uk','Kenia');
    
select * from users where id = 2;

delete from users where name = 'Huy';

update users
set name = 1, email= '', country='';

select * from users where `name` like '%?%';

select * from users order by `name` asc

DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
INSERT INTO users(name, email, country) 
VALUES(user_name, user_email, user_country);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_all_user()
BEGIN
    SELECT users.id, users.name, users.email, users.country
    FROM users;
    END$$
DELIMITER ;

delimiter $$
create procedure update_user_by_store(
IN user_id int,
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50))
begin
update users
set user_name = `user`,
user_email = email,
user_country = country
where user_id = id;
end; $$
delimiter ;

delimiter $$
create procedure delete_by_store(in user_id int)
begin
delete from users
where user_id = id;
end; $$
delimiter ;
