USE northwind;

# 1. Qué empresas tenemos en la BBDD Northwind:
SELECT customers.company_name, orders.order_id, orders.order_date
FROM orders
LEFT JOIN customers
ON customers.customer_id = orders.customer_id;

# 2. Pedidos por cliente de UK:
SELECT customers.company_name AS nombre_cliente, COUNT(orders.order_id) AS numero_de_pedidos
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = "UK"
GROUP BY company_name;

# 3. Empresas de UK y sus pedidos:
SELECT customers.company_name AS nombre_cliente, orders.order_id, orders.order_date AS fecha_pedido
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = "UK"
GROUP BY company_name, order_id;

# 4. Empleadas que sean de la misma ciudad:
SELECT A.city AS ciudad, A.first_name AS nombre_empleado, A.last_name AS apellido_empleado, B.city AS ciudad_jefe, B.first_name AS nombre_jefe, B.last_name AS apellido_jefe
FROM employees AS A, employees AS B
WHERE A.reports_to = B.employee_id;

# 5. Pedidos y empresas con pedidos asociados y no:
SELECT orders.order_id, customers.company_name AS nombre_cliente, orders.order_date AS fecha_pedido
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
UNION
SELECT orders.order_id, customers.company_name AS nombre_cliente, orders.order_date AS fecha_pedido
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;




