CREATE DATABASE `account`;
use `account`;

CREATE TABLE term (
    term_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    term_name VARCHAR(50) NOT NULL
);

CREATE TABLE saving_account (
    account_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_code VARCHAR(50) NOT NULL,
    account_name VARCHAR(50) NOT NULL,
    account_create_date DATE NOT NULL,
    saving_amount INT NOT NULL,
    saving_deposit_date DATE NOT NULL,
    saving_interest_rate INT NOT NULL,
    term_id INT NOT NULL,
    FOREIGN KEY (term_id)
        REFERENCES term (term_id)
);

insert into term (term_name)
values
('day');

insert into saving_account (account_code,account_name,account_create_date,saving_amount,saving_deposit_date,saving_interest_rate,term_id)
values
('S01','Nguyen Van Thanh','2023-02-16',10000,'2023-02-16',7,1);

SELECT 
    account_id,
    account_code,
    account_name,
    DATE_FORMAT(account_create_date, '%Y/%m/%d') AS account_create_date,
    saving_amount,
    DATE_FORMAT(saving_deposit_date, '%Y/%m/%d') AS saving_deposit_date,
    saving_interest_rate,
    term_name
FROM
    saving_account
        LEFT JOIN
    term USING (term_id);
    
SELECT 
    *
FROM
    saving_account;
    
    
SELECT * FROM saving_account
 WHERE account_code LIKE '%01%' OR account_name LIKE '%Giang%';