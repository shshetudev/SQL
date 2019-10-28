#Difference between left and right join(here we are inverting the tables as we are required to do)
#Logically there is no difference between left join and right join and left join is recommended to do
USE udemy_mysql;

SELECT * FROM customers 
LEFT JOIN orders ON customers.id = orders.`customer_id`;

SELECT * FROM orders 
RIGHT JOIN customers ON customers.id = orders.`customer_id`;