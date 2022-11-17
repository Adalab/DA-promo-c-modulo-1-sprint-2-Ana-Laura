USE northwind;

# 1. Pedidos por empresa UK:
SELECT COUNT(orders.order_id) AS numero_de_pedidos, customers.customer_id, customers.company_name
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = "UK"
GROUP BY customer_id, company_name;

# 2. Prodcutos pedidos por empresa en UK por año:
SELECT order_details.quantity AS numero_objetos, customers.company_name AS nombre_empresa, YEAR(orders.order_date) AS año
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE country = "UK" 
GROUP BY customers.company_name, YEAR(orders.order_date);

# 3. Mejorad la query anterior:
SELECT customers.company_name, YEAR(order_date) AS "Año", SUM(quantity) AS "Cantidad", SUM((unit_price*quantity)/(1+discount)) AS "DineroTotal"
FROM order_details
INNER JOIN orders
ON order_details.order_id= orders.order_id
INNER JOIN customers
ON customers.customer_id=orders.customer_id
WHERE customers.country = "UK"
GROUP BY customers.customer_id,YEAR(order_date);



