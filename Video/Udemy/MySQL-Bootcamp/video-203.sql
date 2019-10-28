#EXPLICIT INNER JOIN
SELECT first_name,last_name,order_date,amount FROM 
customers JOIN orders ON customers.id= orders.`id`;

#Getting Fencier Explicit inner join
SELECT first_name,last_name,order_date,amount
FROM customers JOIN orders ON customers.id = orders.`customer_id`
ORDER BY `order_date`;

#TAKE ALL THE ORDERS AND GROUP THEM BY WHO ORDER THEM => So there will be no duplicate 
SELECT first_name,last_name,order_date,amount
FROM customers JOIN orders ON customers.id = orders.`customer_id`
GROUP BY orders.customer_id;

#TAKE ALL THE ORDERS AND GROUP THEM BY WHO ORDER THEM : TOTAL SPENT 
SELECT first_name,last_name,order_date,SUM(amount) total_spent
FROM customers JOIN orders ON customers.id = orders.`customer_id`
GROUP BY orders.customer_id ORDER BY total_spent ;