-- DROP DATABASE IF ALREADY EXISTS

DROP DATABASE OnlineDeliverySystem;

-- CREATE A DATABASE 
CREATE DATABASE OnlineDeliverySystem;
USE OnlineDeliverySystem;

-- CREATE TABLES
-- 1. ADDRESS
CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zipcode VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL
);

-- 2. CUSTOMER
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

-- 3. DELIVERY PERSONNEL
CREATE TABLE DeliveryPersonnel (
    personnel_id INT PRIMARY KEY AUTO_INCREMENT,
    personnel_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    vehicle_type VARCHAR(50),
    availability_status VARCHAR(50),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

-- 4. ADMIN
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    role VARCHAR(50)
);

-- 5. CATEGORY
CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 6. SUPPLIER
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    contact_name VARCHAR(100),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

-- 7. PRODUCT
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- 8. INVENTORY
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    stock_quantity INT NOT NULL,
    reorder_level INT,
    last_restock_date DATE,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 9. ORDER
CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    customer_id INT,
    address_id INT,
    admin_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

-- 10. ORDERPRODUCT (Junction Table for Order and Product):
CREATE TABLE OrderProduct (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 11. DELIVERY
CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    delivery_date DATE NOT NULL,
    delivery_status VARCHAR(50) NOT NULL,
    order_id INT,
    personnel_id INT,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (personnel_id) REFERENCES DeliveryPersonnel(personnel_id)
);

-- 12. PAYMENT
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

-- 13. PROMOTION
CREATE TABLE Promotion (
    promotion_id INT PRIMARY KEY AUTO_INCREMENT,
    promotion_code VARCHAR(50) NOT NULL,
    description TEXT,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    valid_from DATE NOT NULL,
    valid_until DATE NOT NULL
);

-- 14. OREDRPROMOTION (Junction Table for Order and Promotion):
CREATE TABLE OrderPromotion (
    order_id INT,
    promotion_id INT,
    PRIMARY KEY (order_id, promotion_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (promotion_id) REFERENCES Promotion(promotion_id)
);














