USE northwind;

# 1.Extraed los pedidos con el máximo order_date" para cada empleado:

SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS n1
WHERE order_date = (
SELECT MAX(order_date)
FROM orders AS n2
WHERE n1.employee_id = n2.employee_id);

# 2.Extraed el precio unitario de cada producto vendido:

SELECT product_id, MAX(unit_price) AS max_product_sold
FROM order_details AS x1
WHERE unit_price = (
SELECT MAX(unit_price)
FROM order_details AS x2
WHERE x1.product_id = x2.product_id)
GROUP BY product_id;

# 3.Ciudades que empiezan por "A" o "B":

SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';

# 4. Numero de pedidos que se han hecho en las ciudades que empiezan por L:

SELECT customers.city, customers.company_name, customers.contact_name, COUNT(orders.order_id) AS numero_de_pedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE city LIKE 'L%'
GROUP BY customers.city, customers.company_name, customers.contact_name;

# Nos sale diferente al ejemplo porqué en nuestro caso, está ordenado por las ciudad y no por el nombre de la empresa.

# 5. Todos los clientes cuyo "contact_title" no incluya "Sales":

SELECT contact_name, contact_title, company_name
FROM customers
WHERE contact_title NOT LIKE 'Sales%';

# 6. Todos los clientes que no tengan una 'A' en segunda posicion en su nombre:

SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_A%';





