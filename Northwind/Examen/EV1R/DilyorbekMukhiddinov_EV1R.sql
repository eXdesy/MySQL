-- 1.	Recuperar los proveedores cuyo nombre de compañía termine en Ltd. y mostrar el ID de proveedor y nombre de compañía, traduciendo al castellano los nombres de las columnas.
SELECT SupplierID AS "ID de los proveedores", CompanyName AS "Nombre de la compañia" FROM suppliers WHERE CompanyName LIKE '%Ltd.';

-- 2.	Mostrar toda la información de los proveedores cuyo nombre de contacto comienza por la cadena chXr donde la X representa un único carácter cualquiera.
SELECT * FROM suppliers WHERE ContactName LIKE 'Ch%r';

-- 3.	Mostrar los productos con descuento junto con el ID de pedido y el empleado que atendió el pedido.
SELECT pro.*, ordt.OrderID, ordt.Discount, empl.LastName, empl.FirstName, ord.EmployeeID FROM products AS pro 
JOIN orderdetails AS ordt ON pro.ProductID = ordt.ProductID 
JOIN orders AS ord ON ordt.OrderID = ord.OrderID
JOIN employees AS empl ON ord.EmployeeID = empl.EmployeeID
WHERE ordt.Discount != 0;

-- 4.	Contar los clientes de cada país que disponen de FAX.
SELECT * FROM customers WHERE Fax != " " GROUP BY CustomerID;

-- 5.	Contar los pedidos enviados por la compañía de envíos número 3.


-- 6.	Calcular el nivel de reordenamiento medio de los productos que empiezan por C.
SELECT AVG(ReorderLevel) FROM products WHERE ProductName LIKE 'C%';

-- 7.	Contar el número de categorías que cuentan con imagen.
SELECT COUNT(*) FROM categories WHERE Picture != NULL;

-- 8.	Mostrar los proveedores de Londres.
SELECT * FROM suppliers WHERE City IN ("London");

-- 9.	Obtener el total de unidades en stock de los productos con ID par.
SELECT SUM(UnitsInStock) FROM products WHERE ProductID %2;

-- 10.	Por cada empleado mostrar la descripción de su territorio junto con el ID de territorio y empleado.
SELECT ter. TerritoryDescription, emplter.TerritoryID, empl.EmployeeID FROM employees AS empl 
JOIN employeeterritories AS emplter ON empl.EmployeeID = emplter.EmployeeID
JOIN territories AS ter ON emplter.TerritoryID = ter.TerritoryID;
