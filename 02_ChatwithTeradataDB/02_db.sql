 -- Create Customer table
CREATE TABLE SALES.customer (
    customer_id VARCHAR(255) PRIMARY KEY NOT NULL,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    customer_address VARCHAR(255)
);

-- Create Product table
CREATE TABLE SALES.product (
    product_id VARCHAR(255) PRIMARY KEY NOT NULL,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2),
    stock_quantity INT
);

-- Create Order table
CREATE TABLE SALES.orderdetail (
    order_id VARCHAR(255) PRIMARY KEY NOT NULL,
    product_id VARCHAR(255),
    customer_id VARCHAR(255),
    order_date DATE,
    order_number VARCHAR(50),
    total_price DECIMAL(10, 2)
    -- CONSTRAINT fk_orderdetail_product FOREIGN KEY (product_id) REFERENCES WITH CHECK OPTION product(product_id),
    -- CONSTRAINT fk_orderdetail_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES (1, 'John Doe', 'john@example.com', '123 Main St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (2, 'Jane Smith', 'jane@example.com', '456 Oak St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (3, 'Bob Johnson', 'bob@example.com', '789 Pine St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (4, 'Alice Johnson', 'alice@example.com', '111 Pine St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (5, 'Charlie Brown', 'charlie@example.com', '222 Elm St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (6, 'Eva White', 'eva@example.com', '333 Cedar St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (7, 'Frank Miller', 'frank@example.com', '444 Birch St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (8, 'Grace Davis', 'grace@example.com', '555 Maple St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (9, 'Harry Lee', 'harry@example.com', '666 Oak St');
INSERT INTO SALES.Customer (customer_id, customer_name, customer_email, customer_address)
VALUES     (10, 'Ivy Smith', 'ivy@example.com', '777 Walnut St');


INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (101, 'Widget A', 19.99, 100);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (102, 'Gadget B', 29.99, 50);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (103, 'Thingamajig C', 39.99, 75);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (104, 'Gizmo D', 49.99, 25);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (105, 'Widget E', 14.99, 150);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (106, 'Thingamajig F', 24.99, 80);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (107, 'Gadget G', 34.99, 60);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (108, 'Widget H', 19.99, 120);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (109, 'Gizmo I', 39.99, 40);
INSERT INTO SALES.Product (product_id, product_name, unit_price, stock_quantity)
VALUES    (110, 'Thingamajig J', 29.99, 90);  


INSERT INTO SALES.Order_table (order_id, product_id, customer_id, order_date, order_number, total_price)
SELECT
    ROW_NUMBER() OVER (ORDER BY p.product_id) AS order_id,
    p.product_id,
    c.customer_id,
    CURRENT_DATE - CAST(FLOOR(Random(1, 30)) AS INTERVAL DAY), -- Random order dates within the last month
    'ORD' || ROW_NUMBER() OVER (ORDER BY p.product_id),
    CAST(Random(1, 10) * 100 + 50 AS DECIMAL(10, 2)) -- Random total price between 50 and 150


FROM (
    SELECT product_id FROM SALES.Product SAMPLE 10
) p -- Randomly selecting 10 product_id values
JOIN (
    SELECT customer_id FROM SALES.Customer SAMPLE 10
) c ON 1=1; -- Randomly selecting 10 customer_id values
