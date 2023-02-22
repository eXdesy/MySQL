-- 1. Por cada pedido, mostrar el número de líneas (tabla OrderDetails).
SELECT count(OrderID) FROM orderdetails GROUP BY OrderID;

-- 2. Por cada producto, mostrar el número de líneas (tabla OrderDetails).
SELECT count(ProductID) FROM orderdetails GROUP BY ProductID;

-- 3. Por cada cliente, mostrar el número de pedidos.
SELECT COUNT(OrderID), CustomerID FROM orders GROUP BY CustomerID;

-- 4. Repetir el anterior sólo con los clientes de Londres.
SELECT COUNT(OrderID), CustomerID, ShipCity FROM orders WHERE ShipCity = 'London' GROUP BY CustomerID;

-- 5. Repetir el ejercicio 1 mostrando sólo aquellos que tienen más de 4 líneas.
SELECT count(OrderID), OrderID FROM orderdetails GROUP BY OrderID having (count(OrderID))>4;

-- 6. Por cada cliente, mostrar el número de pedidos sólo para los clientes con más de 10 pedidos.
SELECT COUNT(OrderID), CustomerID FROM orders GROUP BY CustomerID HAVING (COUNT(OrderID))>10;

-- 7. Mostrar el número de empleados en cada ciudad.
SELECT COUNT(EmployeeID), City FROM employees GROUP BY City;

-- 8. Mostrar el número de empleados en cada ciudad que tenga al menos dos empleados.
SELECT City, COUNT(EmployeeID) FROM employees GROUP BY City HAVING (COUNT(EmployeeID))>1;

-- 9. Mostrar el número de empleados en cada ciudad que tengan el cargo de ‘Sales representative’, para aquellas ciudades con al menos dos empleados de este cargo. Ordenar por el número de empleados.
SELECT COUNT(EmployeeID), City, Title FROM employees WHERE Title = "Sales Representative" GROUP BY City HAVING (COUNT(EmployeeID))>2;

-- 10. Muestra las distintas ciudades en las que hay empleados.
SELECT City FROM employees GROUP BY City;

-- 11. Cuenta las ciudades en las que hay empleados.
SELECT City, COUNT(EmployeeID)"	Employers" FROM employees GROUP BY City;

-- 12. Por cada país y ciudad de envío, mostrar el total de pedidos.
SELECT DISTINCT ShipCountry, ShipCity, COUNT(EmployeeID) FROM orders GROUP BY ShipCity, ShipCountry;

-- 13. Por cada país y ciudad, contar los empleados que tienen el cargo de ‘Sales representative’.
SELECT Country, City, COUNT(EmployeeID), Title FROM employees WHERE Title = "Sales Representative" GROUP BY City, Country;

-- 14. Por cada país y ciudad, contar el número de clientes.
SELECT ShipCountry, ShipCity, COUNT(ShipName) FROM orders GROUP BY ShipCountry, ShipCity;

-- 15. Repetir el anterior mostrando sólo aquellos que tienen más de un cliente.
SELECT ShipCountry, ShipCity, COUNT(ShipName) FROM orders GROUP BY ShipCountry, ShipCity HAVING (COUNT(ShipName))>1;

-- 16. Por cada producto, hallar la cantidad de unidades vendidas y la media por pedido.
SELECT SUM(Quantity), AVG (Quantity) AS "Media por pedido", ProductID FROM orderdetails GROUP BY ProductID;

-- 17. Por cada pedido, contar los distintos productos vendidos (no la cantidad).
SELECT OrderID,count(ProductID) from orderdetails GROUP BY OrderID ;

-- 18. Repetir el anterior mostrando solo los pedidos con un único producto.
SELECT OrderID,count(ProductID) from orderdetails GROUP BY OrderID HAVING count(ProductID)=1;

-- 19. En la tabla de proveedores (suppliers), contar el número de proveedores por cada título de contacto (Contact Title).
SELECT ContactTitle, COUNT(SupplierID) FROM northwind.suppliers GROUP BY ContactTitle;

-- 20. Contar el número de productos que empiezan por la letra C.
SELECT count(ProductName) 'Productos C%' FROM Products WHERE ProductName LIKE 'C%';

-- 21. Contar el número de pedidos que fueron realizados en un mes de Julio (OrderDate).
SELECT count(*) 'Pedidos en Julio' FROM Orders WHERE extract(MONTH from OrderDate)=7;

-- 22. Contar el número de pedidos realizados por el cliente DUMON en el año 1997.
SELECT COUNT(*) AS "Nº pedidos", CustomerID FROM orders WHERE YEAR(OrderDate)=1997 GROUP BY CustomerID HAVING CustomerID="DUMON";

-- 23. Contar el número de pedidos (Orders) en los que los años de sus campos de tipo fecha no son exactamente iguales.
SELECT count(*) AS "Número de pedidos con años de los campos tipo fecha diferentes" FROM orders WHERE YEAR(OrderDate)!=YEAR(RequiredDate) 
AND YEAR(OrderDate)!=YEAR(ShippedDate) AND YEAR(RequiredDate)!=YEAR(ShippedDate);
