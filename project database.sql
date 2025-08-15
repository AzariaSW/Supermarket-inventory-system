create database supermarket_inventory;
use supermarket_inventory;
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30) 
    );
    CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50) ,
    Phone VARCHAR(20)
    );
    CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50)  UNIQUE,
    Password VARCHAR(20) not null ,
    Role VARCHAR(30) 
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    CategoryID INT,
    SupplierID INT,
    UnitPrice DECIMAL(4,2),
    StockQuantity INT DEFAULT 0,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    UserID INT,
    SaleDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE TABLE SaleItem (
    SaleID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (SaleID, ProductID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Purchase (
    PurchaseID INT PRIMARY KEY,
    UserID INT,
    SupplierID INT,
    PurchaseDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
CREATE TABLE PurchaseItem (
    PurchaseID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (PurchaseID, ProductID),
    FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

