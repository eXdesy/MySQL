-- 1. Mostrar todos los empleados y todos sus atributos.
SELECT * FROM employees;

-- 2. Mostrar todos los productos y todos sus atributos.
SELECT * FROM products;

-- 3. Mostrar el código, nombre y categoría de los productos.
SELECT ProductID, ProductName, CategoryID FROM products;

-- 4. Mostrar los productos que pertenecen a la categoría 2.
SELECT * FROM products WHERE CategoryID=2;

-- 5. Productos que pertenecen a la categoría 2 y 4.
SELECT * FROM products WHERE CategoryID=2 AND CategoryID=4;

-- 6. Productos que pertenecen a la categoría 2 o 4.
SELECT * FROM products WHERE CategoryID=2 OR CategoryID=4;

-- 7. Mostrar id de producto, nombre de producto y precio unitario para todos aquellos productos cuyo precio unitario sea superior a 100.
SELECT ProductID, ProductName, UnitPrice FROM products WHERE UnitPrice >100;

-- 8. Mostrar el producto con nombre “tofu”.
SELECT * FROM products WHERE ProductName="tofu";

-- 9. Mostrar los productos cuyo ID se encuentra en la categoría, 2, 3 o 4. Hacerlo de dos formas distintas.
SELECT CategoryID FROM products WHERE CategoryID IN (2,3,4);
SELECT CategoryID FROM products WHERE CategoryID=2 OR CategoryID=3 OR CategoryID=4;

-- 10. Mostrar los productos cuyo ID de proveedor se encuentra en la categoría 3,5 o 8.
SELECT SupplierID FROM products WHERE SupplierID IN (3,5,8);

-- 11. Mostrar los productos cuyo precio oscila entre 30 y 60 dólares.
SELECT UnitPrice FROM products WHERE UnitPrice BETWEEN 30 AND 60;

-- 12. Mostrar los productos cuyo stock está entre 0 y 10.
SELECT ProductID, UnitsInStock FROM products WHERE UnitsInStock BETWEEN 0 AND 10;

-- 13. Mostrar todos los productos que empiezan con ‘c’.
SELECT ProductName FROM products WHERE ProductName LIKE "C%";

-- 14. Ordenar todos los productos por nombre, en orden ascendente.
SELECT * FROM products ORDER BY ProductName ASC;

-- 15. Ordenar todos los productos por ID, en orden descendente.
SELECT * FROM orders ORDER BY OrderDate DESC;

-- 16. Seleccione todos los campos de la tabla cliente, ordenados por nombre del contacto de la compañía, alfabéticamente.
SELECT * FROM customers ORDER BY ContactName ="A&Z";
SELECT * FROM customers ORDER BY ContactName ASC;

-- 17. Seleccione todos los campos de la tabla órdenes, ordenados por fecha de la orden, descendentemente.
SELECT * FROM orders ORDER BY OrderDate DESC;

-- 18. Seleccione todos los campos de la tabla detalle de la orden, ordenada por cantidad pedida. Ascendentemente.
SELECT * FROM orderdetails ORDER BY Quantity ASC;

-- 19. Obtener todos los productos, cuyo nombre comienzan con la letra P y tienen un precio unitario comprendido entre 10 y 120 dólares.
SELECT * FROM Products ORDER BY ProductName LIKE "P%" AND UnitPrice >=10 AND UnitPrice <=120;

-- 20. Obtener todos los clientes de los países de: USA, Francia o UK. Hacer de dos formas.
SELECT * FROM customers WHERE Country IN ("USA","France","UK");
SELECT * FROM customers WHERE Country IN ("USA"and"France"and"UK");

-- 21. Obtener todos los productos discontinuados (Discontinued=1) o sin stock, que pertenecen a la categoría 1, 3, 4 o 7.
SELECT * FROM products WHERE (Discontinued = 1 or UnitsInStock = 0) AND (CategoryID IN (1, 3, 4, 7));

-- 22. Obtener todas las órdenes hechas por el empleado con código: 2, 5 o 7 en el año 1996.
SELECT * FROM orders where EmployeeID IN (2,5,7) AND OrderDate LIKE "1996%";
SELECT * FROM ORDERS WHERE (EmployeeID= 2 OR EmployeeID = 5 OR EmployeeID= 7) AND (OrderDate LIKE "1996%");

-- 23. Seleccionar todos los clientes que cuenten con Fax (valor distinto de null).
SELECT * FROM customers WHERE fax IS NOT NULL;

-- 24. Seleccionar todos los empleados que cuentan con un jefe (campo Reports To).
SELECT * FROM employees WHERE ReportsTo IS NOT NULL;

-- 25. Seleccionar todos los campos del cliente, cuya compañía empiecen con letra A hasta la D y pertenezcan al país de USA, ordenarlos por la dirección.
SELECT * FROM employees WHERE CompanyName LIKE "A%D" AND Country = "USA" ORDER BY Address;

-- 26. Seleccionar todos los campos del cliente, cuya compañía empiecen con las letras de la B a la G, y pertenezcan al país de UK, ordenarlos por nombre de la compañía.
SELECT * FROM customers WHERE (CompanyName BETWEEN "B%" AND "G%") AND (COUNTRY= "UK") ORDER BY CompanyName ASC;

-- 27. Seleccionar los productos vigentes cuyos precios unitarios están entre 35 y 250, sin stock en almacén, pertenecientes a las categorías 1, 3, 4, 7 o 8, que son distribuidos 
-- por los proveedores, 2, 4, 6, 7, 8 o 9
SELECT * FROM Northwind.Products WHERE (UnitPrice>= 35 AND UnitPrice<=250) AND UnitsInStock=0 AND CategoryID IN (1,3,4,7,9) AND SupplierID IN (2,4,6,7,8,9);

-- 28. seleccionar todos los campos de los productos descontinuados, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9, que tengan stock en almacén, y al 
-- mismo tiempo que sus precios unitarios estén entre 39 y 190, ordenados por código de proveedores y precio unitario de manera ascendente.
SELECT * FROM products WHERE Discontinued=1 AND (SupplierID IN (1, 3, 7, 8, 9) AND UnitPrice BETWEEN 39 AND 190) ORDER BY SupplierID AND UnitPrice ASC;
