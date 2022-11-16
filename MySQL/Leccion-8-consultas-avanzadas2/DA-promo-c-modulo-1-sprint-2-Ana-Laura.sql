USE northwind;

# 1. Relación entre numero de pedidos y máxima carga:
SELECT employee_id, COUNT(order_id) AS numero_de_pedidos, MAX(freight)
FROM orders
GROUP BY employee_id;

# 2. Descartar pedidos sin fecha y ordénalos:
SELECT employee_id, COUNT(order_id) AS numero_de_pedidos, MAX(freight)
FROM orders
WHERE shipped_date is NULL
GROUP BY employee_id;

# 3. Números de pedidos por día:
SELECT DAY(order_date) AS DAY, MONTH(order_date) AS MONTH, YEAR(order_date) AS YEAR, 
COUNT(order_id) AS numero_de_pedidos
FROM orders
GROUP BY order_date;

# 4. Número de pedidos por mes y año:
SELECT MONTH(order_date) AS MONTH, YEAR(order_date) AS YEAR, 
COUNT(order_id) AS numero_de_pedidos
FROM orders
GROUP BY MONTH, YEAR;

# 5. Seleccionad las ciudades con 4 o más empleadas:
SELECT DISTINCT city
FROM employees
WHERE COUNT(employee_id) >= 4
GROUP BY city;



