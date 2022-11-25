USE northwind;

# 1. Extraed información de los productos "Beverages":

SELECT product_id, product_name, category_id
FROM products
WHERE category_id IN (
	SELECT category_id
	FROM categories
	WHERE category_name = 'Beverages');

# 2. Extraed la lista de paises donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

SELECT country
FROM customers
WHERE country NOT IN (
	SELECT country
	FROM suppliers)
	GROUP BY country;

# 3. Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread" (product_id 6):

SELECT orders.order_id, customers.company_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
	WHERE orders.order_id IN (
	SELECT order_id
	FROM order_details
	WHERE quantity > 20 AND product_id = 6);

# 4. Extraed los 10 productos más caros:

-- Sin subconsulta, la manera que primero se nos ocurrio:
SELECT product_name AS 'Productos_mas_caros', unit_price AS precio_unidad
FROM products
	ORDER BY unit_price DESC
	LIMIT 10;

-- Con subconsulta

SELECT product_name AS 'Productos_mas_caros', unit_price AS precio_unidad
FROM products 
WHERE unit_price > ANY (SELECT unit_price FROM products )
	ORDER BY unit_price DESC
	LIMIT 10;

# BONUS: Qué producto es más popular