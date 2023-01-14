create database SaleManagement;
use SaleManagement;

CREATE TABLE Customer (
    cID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(255) NOT NULL,
    cAge TINYINT CHECK (cAge > 0)
);
    
CREATE TABLE Orders (
    oID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATE NOT NULL,
    oTotalPrice INT CHECK (oTotalPrice > 0)
);

CREATE TABLE Product (
    pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(255) NOT NULL,
    pPrice INT NOT NULL CHECK (pPrice > 0)
);

CREATE TABLE OrderDetail (
    oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT CHECK (odQTY > 0),
    PRIMARY KEY (pID , oID),
    FOREIGN KEY (pID)
        REFERENCES Product (pID),
    FOREIGN KEY (oID)
        REFERENCES Orders (oID)
);

insert into customer (cID, cName, cAge)
values 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into Orders (oID, cID, oDate, oTotalPrice)
values
(1, 1, '2006-3-21', null),
(2, 2, '2006-3-23', null),
(3, 1, '2006-3-16', null);

insert into product (pID, pName, pPrice)
values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into OrderDetail (oID, pID, odQTY)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

/*
Hiển thị các thông tin  gồm oID, oDate, oTotalPrice của tất cả các hóa đơn trong bảng Order
*/
SELECT 
    oID, oDate, oTotalPrice
FROM
    orders;
    
/*
Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
*/ 
SELECT 
    *
FROM
    customer
        INNER JOIN
    orders ON customer.cID = orders.cID
        INNER JOIN
    orderdetail ON orders.oID = orderdetail.oID
        INNER JOIN
    product ON orderdetail.pID = product.pID;
    
/*
Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
*/
SELECT 
    customer.cID, customer.cName, customer.cAge, orders.oID
FROM
    customer
        LEFT JOIN
    orders ON customer.cID = orders.cID
WHERE
    orders.cID IS NULL;
    
/*
Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại 
mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
*/
select orders.oID, orders.oDate, product.pPrice, orderdetail.odQTY, (product.pPrice * orderdetail.odQTY) as Total
from orders
inner join orderdetail
on orders.oID = orderdetail.oID
inner join product
on product.pID = orderdetail.pID