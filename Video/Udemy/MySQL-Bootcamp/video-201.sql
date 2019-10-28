USE udemy_mysql;

#IMPLICIT INNER JOIN
SELECT `first_name`,`last_name`,order_date,amount FROM customers,orders 
WHERE (customers.id = orders.id);

#EXPLICIT INNER JOIN
SELECT first_name,last_name,order_date,amount FROM customers
JOIN orders ON customers.id = orders.`id`;


#ARBITRARY JOIN = not recommended
SELECT * FROM customers JOIN orders ON customers.id = orders.id;