drop database if exists CakeShop;
create database CakeShop;
use CakeShop;

create table Users(
	User_id INTEGER not null auto_increment primary key,
	User_Name VARCHAR(30),
	User_LastName VARCHAR(30),
	User_Age INTEGER,
	User_Email VARCHAR(60),
	User_Password VARCHAR(30),
	User_Phone VARCHAR(10),
	User_UriImage VARCHAR(200),
	User_Direction VARCHAR(200)
);

-- Orders Table
CREATE TABLE Orders (
    Order_id INTEGER PRIMARY KEY not null auto_increment,
    User_id INTEGER,
    Order_Date VARCHAR(20),
    Order_Status VARCHAR(20),
    Order_Payment VARCHAR(250),
    Order_Direction VARCHAR(250),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

-- Products Table
CREATE TABLE Products (
    Product_id INTEGER PRIMARY KEY not null auto_increment,
    Product_Name VARCHAR(100),
    Product_Description VARCHAR(255),
    Product_Flavors VARCHAR(255),
    Product_Size VARCHAR(255),
    Product_Price  VARCHAR(20),
    Product_Stock VARCHAR(255),
    Product_UriImage VARCHAR(200)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    Detail_id INTEGER PRIMARY KEY not null auto_increment,
    Order_id INTEGER,
    Product_id INTEGER,
    Detail_Quantity INTEGER,
    Detail_UnitPrice  VARCHAR(20),
    Detail_Product_Flavor VARCHAR(255),
    Detail_Product_Size VARCHAR(255),
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- ProductCategories Table
CREATE TABLE ProductCategories (
    Category_id INTEGER PRIMARY KEY not null auto_increment,
    Category_Name VARCHAR(50)
);

 
