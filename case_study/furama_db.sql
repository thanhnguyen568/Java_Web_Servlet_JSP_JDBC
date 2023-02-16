CREATE DATABASE furama;
use furama;

CREATE TABLE position (
    position_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(45) NOT NULL
);
    
CREATE TABLE edution_degree (
    edution_degree_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    edution_degree_name VARCHAR(45) NOT NULL
);
    
CREATE TABLE division (
    division_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    division_name VARCHAR(45) NOT NULL
);
    
CREATE TABLE employee (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(45) NOT NULL,
    employee_birthday DATE NOT NULL,
    employee_id_card VARCHAR(45) NOT NULL,
    employee_salary DOUBLE NOT NULL,
    employee_phone VARCHAR(45) NOT NULL,
    employee_email VARCHAR(45) NOT NULL,
    employee_address VARCHAR(45) NOT NULL,
    position_id INT NOT NULL,
    edution_degree_id INT NOT NULL,
    division_id INT NOT NULL,
    FOREIGN KEY (position_id)
        REFERENCES position (position_id),
    FOREIGN KEY (edution_degree_id)
        REFERENCES edution_degree (edution_degree_id),
    FOREIGN KEY (division_id)
        REFERENCES division (division_id)
);
    
CREATE TABLE customer_type (
    customer_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_type_name VARCHAR(45) NOT NULL
);

CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_type_id INT NOT NULL,
    customer_name VARCHAR(45) NOT NULL,
    customer_birthday DATE NOT NULL,
    customer_gender BIT(1) NOT NULL,
    customer_id_card VARCHAR(45) NOT NULL,
    employee_phone VARCHAR(45) NOT NULL,
    employee_email VARCHAR(45) NOT NULL,
    employee_address VARCHAR(45) NOT NULL,
    FOREIGN KEY (customer_type_id)
        REFERENCES customer_type (customer_type_id)
);

CREATE TABLE service_type (
    service_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_type_name VARCHAR(45) NOT NULL
);

CREATE TABLE rent_type (
    rent_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rent_type_name VARCHAR(45) NOT NULL,
    rent_type_cost DOUBLE NOT NULL
);
CREATE TABLE service (
    service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(45) NOT NULL,
    service_area INT NOT NULL,
    service_cost DOUBLE NOT NULL,
    service_max_people INT NOT NULL,
    rent_type_id INT NOT NULL,
    service_type_id INT NOT NULL,
    standard_room VARCHAR(45) NOT NULL,
    description_other_convenience VARCHAR(45) NOT NULL,
    pool_area DOUBLE NOT NULL,
    number_of_floors INT NOT NULL,
    FOREIGN KEY (rent_type_id)
        REFERENCES rent_type (rent_type_id),
    FOREIGN KEY (service_type_id)
        REFERENCES service_type (service_type_id)
);

CREATE TABLE attach_service (
    attach_service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    attach_service_name VARCHAR(45) NOT NULL,
    attach_service_cost DOUBLE NOT NULL,
    attach_service_unit INT NOT NULL,
    attach_service_status VARCHAR(45) NOT NULL
);

CREATE TABLE contract (
    contract_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contract_start_date DATETIME NOT NULL,
    contract_end_date DATETIME NOT NULL,
    contract_deposit DOUBLE NOT NULL,
    contract_total_money DOUBLE NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    service_id INT NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id),
    FOREIGN KEY (service_id)
        REFERENCES service (service_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE contract_detail (
    contract_detail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    attach_service_id INT NOT NULL,
    quantity INT,
    FOREIGN KEY (contract_id)
        REFERENCES contract (contract_id),
    FOREIGN KEY (attach_service_id)
        REFERENCES attach_service (attach_service_id)
);
