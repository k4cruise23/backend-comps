CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
order_number INT,
customer_id INT
);


ALTER TABLE orders
ADD order_items text;

