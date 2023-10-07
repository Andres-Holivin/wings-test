-- create DATABASE penjualan

DROP TABLE IF EXISTS login;
CREATE TABLE login(
    username VARCHAR(50) PRIMARY key,
    password VARCHAR(255)   
);
INSERT INTO login (username, password)
VALUES ('Smit','Smit');

DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
    ProductCode varchar(18) PRIMARY key,
    ProductName VARCHAR(30),   
    Price  NUMERIC(6,0),
    Currency VARCHAR(5),
    Discount  NUMERIC(6,0),
    Dimension VARCHAR(50),
    Unit VARCHAR(5)
);
INSERT INTO Product 
VALUES ('SKUUSKLINP','So Klin Pewangi',15000,'IDR',10,'13 cm x 10 cm','PCS');


DROP TABLE IF EXISTS TransactionHeader;
CREATE TABLE TransactionHeader(
    DocumentCode VARCHAR(3),    
    DocumentNumber VARCHAR(10),
    username VARCHAR(50),
    Total  NUMERIC(10,0),
    Date DATE
);
INSERT INTO TransactionHeader 
VALUES ('TRX','001','Smit',67500,'2000-05-20');

DROP TABLE IF EXISTS TransactionDetail;
CREATE TABLE TransactionDetail(
    DocumentCode VARCHAR(3),    
    DocumentNumber VARCHAR(10),
    ProductCode VARCHAR(18),
    Price NUMERIC(6,0),
    Quantity INT,
    username VARCHAR(50),
    SubTotal NUMERIC(10,0),
    Currency VARCHAR(5)   
);
INSERT INTO TransactionDetail 
VALUES ('TRX','001','SKUSKILNP',13500,5,'PCS',67500,'IDR');

select * from login;
select * from "product";
select * from "TransactionHeader";
select * from "TransactionDetail";

SELECT product."ProductCode" AS "product_ProductCode", product."ProductName" AS "product_ProductName", product."Price" AS "product_Price", product."Currency" AS "product_Currency", product."Discount" AS "product_Discount", product."Dimension" AS "product_Dimension", product."Unit" AS "product_Unit" 
FROM product