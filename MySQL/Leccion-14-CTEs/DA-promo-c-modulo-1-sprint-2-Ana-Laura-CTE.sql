USE northwind;

# 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.

WITH compañia
AS (SELECT customer_id, company_name
FROM customers)
SELECT c.customer_id, c.company_name
FROM compañia AS c;

# 2. Selecciona solo los que vengan de "Germany"

WITH compañia
AS (SELECT customer_id, company_name, country
FROM customers)
SELECT c.customer_id, c.company_name, c.country
FROM compañia AS c
WHERE country = "Germany";

# 3. Extraed el id de las facturas y su fecha de cada cliente:

WITH facturas (numero_factura, fecha_factura, codigo_cliente, compañia) AS
(SELECT orders.order_id, orders.order_date, customers.customer_id, customers.company_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id)
SELECT numero_factura, fecha_factura, codigo_cliente, compañia
FROM facturas;

# 4. Contad el número de facturas por cliente:

WITH facturas (numero_factura, codigo_cliente, compañia) AS
(SELECT COUNT(orders.order_id), customers.customer_id, customers.company_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id, customers.company_name)
SELECT numero_factura, codigo_cliente, compañia
FROM facturas;

# 5. Cuál es la cantidad media pedida de todos los productos ProductID:

WITH cantidad_media
AS (SELECT product_id, SUM(quantity) / COUNT(product_id) AS MEDIA
FROM order_details
GROUP BY product_id)
SELECT *
FROM cantidad_media;




