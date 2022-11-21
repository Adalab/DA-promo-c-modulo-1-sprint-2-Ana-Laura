USE northwind;

# 1. Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT company_name, contact_name, city, 'client' AS relantionship
FROM customers
UNION
SELECT company_name, contact_name, city, 'proveedor' AS relationship
FROM suppliers;

# 2. Extraer todos los pedidos gestionados por "Nancy "Davolio"
SELECT *
FROM orders
WHERE employee_id IN(
SELECT first_name = "Nancy"
FROM employees);

# 3. Extraed todas las empresas que no han comprado en el año 1997:
SELECT company_name, country
FROM customers
WHERE customer_id NOT IN(
SELECT customer_id
FROM orders
WHERE YEAR(order_date) = 1997);

# 4. Extraed toda la información de los pedidos donde tengamos "Konbu":
SELECT *
FROM orders
WHERE order_id IN(
SELECT order_details.order_id
FROM order_details
INNER JOIN products
ON products.product_id = order_details.product_id
WHERE product_name = "Konbu");