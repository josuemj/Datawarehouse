CREATE TABLE categories (
    categoryID int PRIMARY KEY,
    categoryName varchar(255),
    description varchar(255)
);

CREATE TABLE shippers (
    shipperID int PRIMARY KEY,
    companyName varchar(255)
);

CREATE TABLE products (
    productID int PRIMARY KEY,
    productName varchar(255),
    quantityPerUnit varchar(255),
    unitPrice decimal(10, 2),
    discontinued int,
    categoryID int,
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

CREATE TABLE employees (
    employeeID int PRIMARY KEY,
    employeeName varchar(255),
    title varchar(255),
    city varchar(255),
    country varchar(255),
    reportsTo int,
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeID)
);

CREATE TABLE customers (
    customerID varchar(10) PRIMARY KEY,
    companyName varchar(255),
    contactName varchar(255),
    contactTitle varchar(255),
    city varchar(255),
    country varchar(255)
);

CREATE TABLE orders (
    orderID int PRIMARY KEY,
    customerID varchar(255),
    employeeID int,
    orderDate date,
    requiredDate date,
    shippedDate date,
    shipperID int,
    freight decimal(10, 2),
    FOREIGN KEY (customerID) REFERENCES customers(customerID),
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID),
    FOREIGN KEY (shipperID) REFERENCES shippers(shipperID)
);

CREATE TABLE order_details (
    orderID int,
    productID int,
    unitPrice decimal(10, 2),
    quantity int,
    discount decimal(10, 2),
    PRIMARY KEY (orderID, productID),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);

