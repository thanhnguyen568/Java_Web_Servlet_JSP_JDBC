create database QuanLyBanHang;
use QuanLyBanHang;

CREATE TABLE Customer (
    cID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(255) NOT NULL,
    cAge TINYINT CHECK (cAge > 18)
);
    
CREATE TABLE Orders (
    oID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATE NOT NULL,
    oTotalPrice INT NOT NULL CHECK (oTotalPrice > 0)
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