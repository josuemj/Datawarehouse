CREATE TABLE DimProduct (
    productID int PRIMARY KEY,
    productName varchar(255),
    categoryName varchar(255),
    unitPrice decimal(10, 2),
    quantityPerUnit varchar(255),
    discontinued int
);

CREATE TABLE DimCustomer (
    customerID varchar(10) PRIMARY KEY,
    companyName varchar(255),
    contactName varchar(255),
    city varchar(255),
    country varchar(255)
);

CREATE TABLE FactSales (
    SalesID int PRIMARY KEY,
    date date,
    productID int,
    customerID varchar(10),
    employeeID int,
    shipperID int,
    quantity int,
    unitPrice decimal(10, 2),
    discount decimal(10, 2),
    totalPrice decimal(10, 2)
);

CREATE TABLE DimShipper (
    shipperID int PRIMARY KEY,
    companyName varchar(255)
);

CREATE TABLE DimEmployee (
    employeeID int PRIMARY KEY,
    employeeName varchar(255),
    title varchar(255),
    city varchar(255),
    country varchar(255)
);

-- Agregar FK para productID en FactSales
ALTER TABLE FactSales
ADD CONSTRAINT fk_factsales_productid
FOREIGN KEY (productID)
REFERENCES DimProduct (productID);

-- Agregar FK para customerID en FactSales
ALTER TABLE FactSales
ADD CONSTRAINT fk_factsales_customerid
FOREIGN KEY (customerID)
REFERENCES DimCustomer (customerID);

-- Agregar FK para employeeID en FactSales
ALTER TABLE FactSales
ADD CONSTRAINT fk_factsales_employeeid
FOREIGN KEY (employeeID)
REFERENCES DimEmployee (employeeID);

-- Agregar FK para shipperID en FactSales
ALTER TABLE FactSales
ADD CONSTRAINT fk_factsales_shipperid
FOREIGN KEY (shipperID)
REFERENCES DimShipper (shipperID);

 -- an order might contain various products
ALTER TABLE factsales
DROP CONSTRAINT factsales_pkey;
