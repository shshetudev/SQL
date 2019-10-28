		#Video:207
		
SELECT * FROM customers;
SELECT * FROM orders;

#Left Join
SELECT first_name,last_name,order_date,amount FROM customers
LEFT JOIN orders ON customers.id = orders.`customer_id`;

#Right Join : Within the clauses like group by,order by do not use comma
#If multiple people have same first name then order by will work on the basis of last_name
SELECT IFNULL(first_name,'Missing') AS frist_name,IFNULL(last_name,'Missing') AS last_name,order_date,amount,SUM(amount) AS total_amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id 
GROUP BY customer_id
ORDER BY first_name,last_name;	


#ON DELETE CASCADE
DROP TABLES customers,orders;

CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100)
);

#CASCADE MEANS That: when a row is delete from customers table, customer_id related rows will also be deleted from orders table
CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT,
FOREIGN KEY(customer_id) REFERENCES customers(id)
ON DELETE CASCADE
);

#Details of the tables
SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM orders;

DELETE FROM customers WHERE email='george@gmail.com';

