create database teacher_managament;

use teacher_managament;

CREATE TABLE teacher (
    id INT,
    name VARCHAR(255),
    age INT,
    country VARCHAR(255),
    PRIMARY KEY (id)
);

SELECT 
    *
FROM
    teacher;
    
insert into teacher(id,name,age,country)
value
(1,'Thanh',30,'Viet Nam');

CREATE TABLE class (
    id INT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

SELECT 
    *
FROM
    class;
