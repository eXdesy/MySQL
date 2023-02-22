-- 1. Obtener todas las ordenes hechas por el empleado King Robert
SELECT orders.OrderID, employees.LastName, employees.FirstName FROM orders
JOIN employees ON ord.EmployeeID = emp.EmployeeID 
WHERE emp.FirstName="Robert" AND emp.LastName="King";

-- 2. Obtener todas las ordenes hechas por el empleado King Robert, Davolio Nancy y Fuller Andrew
SELECT orders.OrderID, CONCAT(employees.LastName," ", employees.FirstName), employees.EmployeeID FROM orders 
JOIN employees ON orders.EmployeeID = employees.EmployeeID 
WHERE employees.FirstName="Robert" AND employees.LastName="King" 
OR employees.FirstName="Nancy" AND employees.LastName="Davolio" 
OR employees.FirstName="Andrew" AND employees.LastName="Fuller";

-- 3. Obtener todas las ordenes por el cliente cuya compania es "Que del?cia"
SELECT * FROM orders 
JOIN customers ON (orders.CustomerID = customers.CustomerID)
WHERE customers.CompanyName = "Que del?cia";

-- 4. Obtener todos los productos(codigo, nombre, precio, stock) del pedido 10257
SELECT products.ProductID, products.ProductName, products.UnitPrice, products.UnitsInStock FROM products 
JOIN orderdetails ON products.ProductID = orderdetails.ProductID 
WHERE OrderID="10257";

-- 5. Obtener todos los productos(codigo, nombre, precio, stock) de los pedidos hechos desde 1997 hasta la fecha de hoy
SELECT products.ProductID, products.ProductName, products.UnitPrice, products.UnitsInStock FROM products
JOIN orderdetails ON products.ProductID = orderdetails.ProductID
JOIN orders ON orderdetails.OrderID = orders.OrderID
WHERE orders.OrderDate BETWEEN "1997-01-01" AND CUREDATE();

-- 6. Mostar el ID del pedido, fecha del pedido y el total de productos de cada pedido.
SELECT orders.OrderID, orders.OrderDate, SUM(orderdetails.Quantity) FROM orders 
JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
GROUP BY OrderID;
SELECT orders.OrderID, orders.OrderDate, COUNT(*) AS "total productos" FROM orders
JOIN orderdetails ON orders.OrderID = orderdetails.OrderID 
GROUP BY orderdetails.OrderID;
 
-- 7. Obtener el nombre de todas las categorias y los nombres de sus productos, precio y stock.
SELECT products.CategoryName, products.ProductName, products.UnitPrice, products.UnitsInStock FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 8. Obtener el número de productos por cada categoría mostrando el nombre de la categoría, solamente para las categorías 3, 5 y 8. Ordenar por el nombre de la categoría.
SELECT COUNT(*), categories.CategoryName, categories.CategoryID FROM categories
JOIN products ON categories.CategoryID = products.CategoryID
WHERE categories.CategoryID IN (3, 5, 8)
GROUP BY CategoryName;

-- 9. Visualizar el nombre de la categoria y el numero de productos que hay por cada categoria.
SELECT COUNT(*), categories.CategoryName, products.UnitsInStock FROM categories
JOIN products ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryName;

-- 10. Por cada pedido, obtener el ID de pedido, ID de producto, ID de proveedor y el nombre de la compañía.
SELECT orderdetails.OrderID, orderdetails.ProductID, suppliers.SupplierID, suppliers.CompanyName FROM orderdetails
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 11. Por cada pedido, obtener el ID de pedido, ID de empleado y el nombre de empleado.
SELECT orders.OrderID, orders.EmployeeID, employees.FirstName FROM orders
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 12. Por cada producto, obtener el ID de producto, ID de categoría y el nombre de categoría.
SELECT products.ProductID, products.CategoryID, categories.CategoryName FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 13. Por cada empleado, imprimir el ID de empleado, nombre, apellido e ID de territorio.
SELECT employees.EmployeeID, CONCAT(employees.FirstName, " ", LastName), employeeterritories.TerritoryID FROM employees
JOIN employeeterritories ON employeeterritories.EmployeeID = employees.EmployeeID;

-- 14. Por cada cliente, mostrar el ID de cliente, nombre de contacto y pedidos.
SELECT customers.CustomerID, customers.ContactName, orders.OrderID FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID;

-- 15. Por cada cliente, mostrar el ID de cliente, nombre de contacto y numero total pedidos.
SELECT customers.CustomerID, customers.ContactName, COUNT(*) AS "Total de pedidos" FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID;

-- 16. Por cada pedido presente en orderdetails, imprimir toda su información y además, el nombre de la categoría a la que pertenece.
SELECT orderdetails.*, categories.CategoryID FROM orderdetails
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 17. Por cada pedido, mostrar el ID de pedido, dirección del cliente y dirección del empleado.
SELECT orders.OrderID, customers.Address AS "Dirección cliente", employees.Address AS "Dirección empleado" FROM orders
JOIN customers ON customers.CustomerID = orders.CustomerID
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 18. Por cada producto, mostrar el ID de producto, nombre de producto y dirección del proveedor.
SELECT products.ProductID, products.ProductName, suppliers.Address AS "Dirección proveedor" FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 19. Visualizar el nombre de la compañía y el id del cliente, fecha, precio unitario y producto de la orden
SELECT customers.CompanyName, customers.CustomerID, orders.OrderDate, orderdetails.UnitPrice, orderdetails.ProductID FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID;

-- 20. Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece
SELECT products.ProductName, products.UnitPrice, products.UnitsInStock, categories.CategoryName FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 21. Mostrar el nombre del producto, el precio producto, el código del proveedor y el nombre de la compañía proveedora
SELECT products.ProductName, products.UnitPrice, suppliers.SupplierID, suppliers.CompanyName FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 22. Mostrar el id del pedido, fecha, código del producto, precio, código del empleado y su nombre completo
SELECT orders.OrderID, orders.OrderDate, products.ProductID, products.UnitPrice, employees.EmployeeID, CONCAT(employees.FirstName, " ",employees.LastName) FROM orders
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 23. Calcular el stock de productos por cada categoria. Mostrar el nombre de la categoria y el stock por categoria
SELECT SUM(products.UnitsInStock), categories.CategoryID, categories.CategoryName FROM products
JOIN categories ON categories.CategoryID = products.CategoryID
GROUP BY categories.CategoryName;

-- 24. Obtener el nombre del cliente, nombre del proveedor, nombre del empleado y el nombre de los productos que estan en la orden 10794
SELECT customers.ContactName, suppliers.ContactName, CONCAT(employees.FirstName," ", employees.LastName), products.ProductName FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
JOIN employees ON employees.EmployeeID = orders.EmployeeID
WHERE orders.OrderID="10794";

-- 25. Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra, código del producto, cantidad pedida del producto, nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor, usar Join
SELECT customers.CompanyName, orders.OrderID, orders.OrderDate, products.ProductID, products.QuantityPerUnit, products.ProductName, suppliers.CompanyName, suppliers.City FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 26. Seleccionar cuantos proveedores tengo en cada país, considerando solo a los nombres de los proveedores que comienzan con la letra E hasta la letra P, además de mostrar solo los países donde tenga más de 2 proveedores 
SELECT COUNT(*), suppliers.Country, suppliers.ContactName FROM suppliers
WHERE LOWER(SUBSTRING(ContactName, 1, 1)) BETWEEN "e" AND "p"
GROUP BY suppliers.Country HAVING suppliers.ContactName>2;

-- 27. Crear una consulta que muestre el nombre de empleado y el número de empleados que cada uno de los empleados tiene a su cargo
SELECT Boss.EmployeeID, CONCAT(Boss.FirstName," ",Boss.LastName) AS "Boss", COUNT(*) AS "Empleados a cargo" FROM employees AS Boss 
JOIN employees AS Slave ON (Slave.ReportsTo = Boss.EmployeeID)
GROUP BY Boss.EmployeeID; 

-- 28. Crear una consulta que muestre el nombre de empleado, el número de pedidos tramitado por cada empleado, de aquellos empleados que han tramitado mas de 15 pedidos
SELECT CONCAT(employees.FirstName,' ', employees.LastName) AS "Empleado", COUNT(*) AS "Pedidos" FROM employees
JOIN orders ON (employees.EmployeeID = orders.EmployeeID)
GROUP BY employees.EmployeeID HAVING COUNT(*)>15;

-- 29. Crear una consulta que muestre el nombre del cliente, el número de pedidos que nos ha realizado el cliente, el dinero que nos ha dejado en la empresa, de todos los clientes que sean de USA y que nos han realizado mas de 5 pedidos
SELECT customers.ContactName, COUNT(*) AS "Pedidos", SUM(orderdetails.UnitPrice*orderdetails.Quantity) AS "Dinero empresa" FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
WHERE Country="USA"
GROUP BY customers.ContactName HAVING COUNT(*)>5; 

-- 30. Crear una consulta que muestre el nombre del jefe y el número de empleados a su cargo de aquel jefe que mas empleados tenga a su cargo
SELECT boss.EmployeeID, CONCAT(Boss.FirstName," ",Boss.LastName) AS "Boss", COUNT(*) AS "Empleados a cargo" FROM employees AS Boss
JOIN employees ON employees.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;

-- 31. Obtener el nombre del cliente y el número de pedidos del cliente que mas pedidos ha realizado en la empresa
SELECT customers.ContactName, COUNT(*) AS "Pedidos", orders.OrderID FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID;