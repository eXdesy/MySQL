-- 1. De la tabla pedidos (Orders), imprimir por cada empleado el número de pedidos. Debe mostrarse el ID de empleado como ID DEL EMPLEADO y el número de pedidos como NUM_PEDIDOS.
SELECT EmployeeID AS "ID DEL EMPLEADO", count(OrderID) AS "NUM_PEDIDOS" FROM orders GROUP BY EmployeeID;

-- 2. De la tabla Order Details, por cada pedido, imprimir el ID de pedido y el total de unidades.
SELECT OrderID, SUM(Quantity) AS "TOTAL" FROM OrderDetails GROUP BY (OrderID);

-- 3. Repetir el ejercicio anterior imprimiendo solo aquellos pedidos con un número total de unidades inferior a 50.
SELECT  OrderID, SUM(Quantity) FROM orderdetails GROUP BY OrderID HAVING SUM(Quantity)<50;

-- 4. En la tabla empleados, por cada país imprimir el número de empleados que ostentan el cargo de “Sales Representative”. Imprimir el nombre del país y el número.
SELECT Country, COUNT(Title) as "Nº de empleados que son Sales Representative" FROM Employees WHERE Title = "Sales Representative" GROUP BY Country ;

-- 5. En la tabla empleados, por cada país imprimir el número de empleados que NO ostentan el cargo de “Sales Representative”. Imprimir el nombre del país y el número.
SELECT Title, Country, count(Title) FROM employees GROUP BY Country, Title HAVING (Title LIKE "Sales Representative");
