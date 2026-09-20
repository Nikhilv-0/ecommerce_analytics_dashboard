USE ecommerce_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(20),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    cost_price DECIMAL(12,2),
    selling_price DECIMAL(12,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(12,2),
    discount_pct DECIMAL(5,2),
    discount_amount DECIMAL(12,2),
    revenue DECIMAL(14,2),
    cost DECIMAL(14,2),
    profit DECIMAL(14,2),
    order_status VARCHAR(20),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE date_dim (
    date_value DATE PRIMARY KEY,
    year INT,
    month_number INT,
    month_name VARCHAR(10),
    yearmonth VARCHAR(10),
    quarter VARCHAR(5),
    day_name VARCHAR(15)
);