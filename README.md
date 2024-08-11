# Online Delivery System Database Project

## Project Overview

This project focuses on designing and implementing a database for an online delivery system. The objective was to create a robust and scalable database that supports various functionalities required for online delivery operations.

## ER Diagram Creation

1. **Initial Considerations**: We began by analyzing the core functionalities and requirements of the online delivery system. This involved identifying key entities, their attributes, and the relationships between them.

2. **Entity Identification**: The following entities were identified along with their necessary attributes:

   - **Customer**: 
     - `customer_id` (Primary Key)
     - `customer_name`
     - `email`
     - `phone_number`

   - **Delivery Personnel**:
     - `personnel_id` (Primary Key)
     - `personnel_name`
     - `phone_number`
     - `vehicle_type` (e.g., bike, car)
     - `availability_status` (e.g., available, busy, off-duty)

   - **Admin**:
     - `admin_id` (Primary Key)
     - `admin_name`
     - `email`
     - `phone_number`
     - `role` (e.g., superadmin, manager)

   - **Product**:
     - `product_id` (Primary Key)
     - `product_name`
     - `price`
     - `category_id` (Foreign Key to Category)
     - `supplier_id` (Foreign Key to Supplier)

   - **Order**:
     - `order_id` (Primary Key)
     - `order_date`
     - `customer_id` (Foreign Key to Customer)
     - `total_amount`
     - `status` (e.g., pending, completed, cancelled)
     - `delivery_id` (Foreign Key to Delivery)
     - `promotion_id` (Foreign Key to Promotion, optional)
     - `payment_id` (Foreign Key to Payment)

   - **Payment**:
     - `payment_id` (Primary Key)
     - `order_id` (Foreign Key to Order)
     - `payment_method` (e.g., credit card, PayPal, cash on delivery)
     - `payment_date`
     - `payment_status` (e.g., paid, pending, failed)
     - `amount`

   - **Delivery**:
     - `delivery_id` (Primary Key)
     - `order_id` (Foreign Key to Order)
     - `personnel_id` (Foreign Key to Delivery Personnel)
     - `delivery_date`
     - `delivery_status` (e.g., pending, in transit, delivered)
     - `address_id` (Foreign Key to Address)

   - **Inventory**:
     - `inventory_id` (Primary Key)
     - `product_id` (Foreign Key to Product)
     - `stock_quantity`
     - `reorder_level`
     - `last_restock_date`

   - **Address**:
     - `address_id` (Primary Key)
     - `street`
     - `city`
     - `state`
     - `zip_code`
     - `country`

   - **Category**:
     - `category_id` (Primary Key)
     - `category_name`
     - `description`

   - **Supplier**:
     - `supplier_id` (Primary Key)
     - `supplier_name`
     - `contact_name`
     - `phone_number`
     - `email`
     - `address_id` (Foreign Key to Address)

   - **Promotion**:
     - `promotion_id` (Primary Key)
     - `promotion_code`
     - `description`
     - `discount_percentage`
     - `valid_from`
     - `valid_until`

3. **Relationships**: Key relationships between entities were established:
   - **Customer - Order**: One-to-Many (A customer can place multiple orders).
   - **Order - Delivery Personnel**: Many-to-One (An order is assigned to one delivery person).
   - **Order - Product**: Many-to-Many (An order can include multiple products, and products can appear in multiple orders).
   - **Customer - Address**: One-to-Many (A customer can have multiple addresses).
   - **Order - Payment**: One-to-One (Each order has a single payment record).
   - **Product - Category**: Many-to-One (A product belongs to one category).
   - **Product - Supplier**: Many-to-One (A product is supplied by one supplier).
   - **Order - Delivery**: One-to-One (Each order has a single delivery record).
   - **Product - Inventory**: One-to-One (Each product has a corresponding inventory record).

4. **ER Diagram Design**: Using [draw.io](https://app.diagrams.net/), we created the ER diagram that visually represents the database schema. This diagram serves as a blueprint for the database structure.

## Implementation

The database was implemented using [MySQL Workbench](https://www.mysql.com/products/workbench/). All necessary tables, relationships, and constraints were set up according to the ER diagram.

## Queries

All SQL queries related to the project (DDL, DML) have been included in their respective files and attached to this GitHub repository. Please refer to these files for specific query implementations.

## Tools Used

- [draw.io](https://app.diagrams.net/): For creating the ER diagram.
- [MySQL Workbench](https://www.mysql.com/products/workbench/): For database implementation.

## Running the Project Locally

To run the project locally, follow these steps:

1. Import the SQL files into your MySQL Workbench environment.
2. Execute the provided SQL queries to set up the database schema and populate it with dummy data.