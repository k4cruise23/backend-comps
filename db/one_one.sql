CREATE TABLE passwords (
passwords_id SERIAL PRIMARY KEY,
customer_id INT,
password TEXT
);

INSERT INTO passwords (customer_id, password)
VALUES (1, 'supersecret');

SELECT * FROM passwords p
JOIN users_orders u ON p.customer_id = u.customer_id;