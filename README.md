# 🛒 Simple E-Commerce Database

A beginner-friendly SQL project demonstrating the core database structure for an e-commerce platform using MySQL.

---

## 📌 Tables Overview

* **`users`** — Stores customer information (`user_id`, `name`, `email`, `city`).
* **`products`** — Stores inventory details (`product_id`, `product_name`, `price`, `stock_quantity`).
* **`orders`** — Stores overall order details (`order_id`, `user_id`, `order_date`, `total_amount`).
* **`order_items`** — Stores individual items in an order (`item_id`, `order_id`, `product_id`, `quantity`, `unit_price`).

---

## 🚀 Database Script

```sql
CREATE DATABASE ecommerce;
USE ecommerce;

-- 1. Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50)
);

-- 2. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 3. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE DEFAULT (CURRENT_DATE),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 4. Order Items Table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Data
INSERT INTO users (name, email, city) 
VALUES ('Rahul Sharma', 'rahul@example.com', 'Nagpur');

INSERT INTO products (product_name, price, stock_quantity) 
VALUES ('Wireless Mouse', 500.00, 20),
       ('USB Keyboard', 800.00, 15);

INSERT INTO orders (user_id, total_amount) 
VALUES (1, 1300.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) 
VALUES (1, 1, 1, 500.00),
       (1, 2, 1, 800.00);
