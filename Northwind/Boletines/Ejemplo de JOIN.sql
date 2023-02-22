-- 1. Realizar una consulta donde obtengamos el ID de los pedidos asociados a la empleada Nancy Davolio.
-- FORMA 1:
SELECT OrderID, LastName, FirstName FROM orders
JOIN employees ON orders.EmployeeID = employees.EmployeeID
WHERE FirstName="Nancy" AND LastName="Davolio";

-- FORMA 2:
SELECT orders.OrderID, employees.LastName, employees.FirstName FROM orders 
JOIN employees ON orders.EmployeeID = employees.EmployeeID
WHERE employees.FirstName="Nancy" AND employees.LastName="Davolio";
-- Esta forma esta mejor porque permite saber a que tabla pertenece cada columna.

-- FORMA3:
SELECT ord.OrderID, emp.LastName, emp.FirstName FROM orders AS ord 
JOIN employees AS emp ON ord.EmployeeID = emp.EmployeeID
WHERE emp.FirstName="Nancy" and emp.LastName="Davolio";
-- Esta forma es igual al anterior pero con nombres de tablas resumidos.

-- 2. Recuperar todos los campos de la tabla Order, imprimiendo además la compañía del cliente.
SELECT orders.*, customers.CompanyName FROM orders 
JOIN customers ON orders.CustomerID = customers.CustomerID;

-- 3. Por cada producto, mostrar el nombre del producto y el nombre de la compañía que lo provee.
SELECT products.ProductName, suppliers.CompanyName FROM products 
JOIN suppliers ON products.SupplierID = suppliers.SupplierID;

-- 4. Recuperar todos los campos de la tabla Order Details, imprimiendo además el ID de cliente.
SELECT orderdetails.*, orders.CustomerID FROM orderdetails 
JOIN orders ON orders.OrderID = orderdetails.OrderID;
