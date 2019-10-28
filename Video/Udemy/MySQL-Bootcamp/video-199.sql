SELECT * FROM orders WHERE customer_id=1;

SELECT * FROM orders WHERE customer_id=(
SELECT id FROM customers WHERE last_name='shetu'
);


#CROSS JOIN: JOINING ALL THE COLUMNS OF 2 TABLES
SELECT * FROM orders,customers;