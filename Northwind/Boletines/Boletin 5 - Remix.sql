-- (A la atención de su señoría, este enunciado ha sido preparado para que lo entienda a vuestra merced. Espero que sea de su gusto y no genera ambigüedades, puesto que este servidor 
-- suyo lo ha preparado con gran cuidado. Si así no fuere, pardiez que me lleve el diablo y se coma mi alma.)

-- 1. Contar la cantidad de pedidos que han sido realizados por un cliente de México.
SELECT COUNT(*) AS "Pedidos", customers.CustomerID FROM customers
JOIN orders ON customers.CustomerID = customers.CustomerID
WHERE customers.Country="Mexico"
GROUP BY customers.CustomerID; 

-- 2. Por cada pedido adjunta, además de su información, el nombre de la  compañía que lo ha enviado (ShipVia).
SELECT shippers.CompanyName, orders.* FROM shippers
JOIN orders ON orders.ShipVia = shippers.ShipperID;

-- 3. Imprimir toda la información de los clientes, con los nombres de las columnas traducidos al castellano y separando con espacios aquellos nombres compuestos de varias palabras.
SELECT customers.CustomerID AS "ID del Cliente", customers.CompanyName AS "Nombre de la compañía", customers.ContactName AS "Contacto", customers.ContactTitle AS "Título", customers.Address AS "Dirección", customers.City AS "Ciudad", customers.PostalCode AS "Código Postal", customers.Country AS "País", customers.Phone AS "Teléfono" FROM customers;

-- 4. Por cada producto, mostrar su nombre y la descripción de la categoría a la que pertenece.
SELECT products.ProductName, categories.Description FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 5. Mostrar los países y cantidad de empleados que tiene cada país.
SELECT COUNT(*), employees.Country FROM employees
GROUP BY employees.Country;

-- 6. Contar los pedidos que han sido realizados por clientes de España.
SELECT COUNT(*) AS "Pedidos", customers.CustomerID FROM customers
JOIN orders ON customers.CustomerID = customers.CustomerID
WHERE customers.Country="Spain"
GROUP BY customers.CustomerID; 

-- 7. Mostrar los pedidos realizados por clientes de Suecia y Argentina.
SELECT COUNT(*) AS "Pedidos", customers.CustomerID FROM customers
JOIN orders ON customers.CustomerID = customers.CustomerID
WHERE customers.Country="Sweeden" OR customers.Country="Argentina"
GROUP BY customers.CustomerID; 

-- 8. Por cada pedido, mostrar el descuento medio.
SELECT orderdetails.OrderID, AVG(Discount) FROM orderdetails
GROUP BY orderdetails.OrderID;

-- 9. Por cada pedido, contar los productos que incluye, solo para aquellos  pedidos que cuentan con más de tres productos y han sido atendidos por un empleado estadounidense.
SELECT orderdetails.OrderID, COUNT(*) FROM products
JOIN orderdetails ON orderdetails.ProductID = products.ProductID
JOIN orders ON orders.OrderID = orderdetails.OrderID
JOIN employees ON employees.EmployeeID = orders.EmployeeID
WHERE UnitsInStock>3 AND employees.Country="USA";

-- 10. Mostrar los nombres y apellidos de todos los empleados utilizando una única columna, ordenándolos por edad, de mayor a menor.
SELECT CONCAT(employees.FirstName, " ", employees.LastName) AS "Nombre y apellidos" FROM employees
ORDER BY employees.BirthDate ASC;

-- 11. Por cada compañía de envíos, mostrar su nombre y contar el número de pedidos que ha enviado.
SELECT shippers.CompanyName, COUNT(*) FROM shippers
JOIN orders ON orders.ShipVia = shippers.ShipperID
GROUP BY shippers.CompanyName;

-- 12. Mostrar el nombre de los países a los que pertenecen los distintos clientes y empleados, de forma que no se repitan.
SELECT DISTINCT customers.Country, employees.Country FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 13. Contar los distintos ID de territorios.
SELECT COUNT(*) FROM territories;

-- 14. Contar el número de categorías cuyo nombre empieza por C y termina por S, dando un alias a la columna.
SELECT COUNT(*) AS "Categorias" FROM categories
WHERE categories.CategoryName LIKE "C%" AND "%S";

-- 15. Mostrar los distintos territorios, adjuntando también la descripción de región (RegionDescription).
SELECT territories.*, region.RegionDescription FROM territories
JOIN region ON region.RegionID = territories.RegionID;

-- 16. Contar el número de filas de la tabla customerdemographics.
SELECT COUNT(*) FROM customerdemographics; 

-- 17. Mostrar los nombres de ciudades de los proveedores en orden alfabético inverso, pero solo para aquellas cuyo nombre de ciudad comienza de la A a la C incluidas ambas letras.
SELECT suppliers.City FROM suppliers
WHERE SUBSTRING(City, 1, 1) BETWEEN "A" AND "C"
ORDER BY suppliers.City DESC;

-- 18. Por cada nombre de compañía de envíos contar el número de distintos productos  enviados. Es decir, que si una compañía de envíos envía una bata, tres bicis y siete jerseys de 
-- cuello de pico estampados a un cliente zamorano y luego la misma compañía de envíos envía una bata a un cliente jienense, esa compañía de envíos (que Dios la guarde en su alma) había 
-- enviado tres productos distintos.
SELECT suppliers.CompanyName, COUNT(*) FROM suppliers
JOIN products ON products.SupplierID = suppliers.SupplierID
GROUP BY suppliers.CompanyName;