create database ecommerce;
use ecommerce;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE DEFAULT (CURRENT_DATE),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

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