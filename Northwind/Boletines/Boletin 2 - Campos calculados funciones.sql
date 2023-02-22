-- 1 Seleccionar las órdenes de compra (Orders) realizadas por el empleado con código entre el 2 y 5 con fecha de pedido del 31 de julio de cualquier año. Buscar información sobre la función EXTRACT.
SELECT * FROM orders WHERE EmployeeID>=2 AND EmployeeID<=5 AND (EXTRACT(MONTH FROM OrderDate)=7) AND (EXTRACT(DAY FROM OrderDate)=31);

-- 2 Seleccionar las órdenes de compra realizadas por el empleado con código 3, de cualquier año, pero solo de los últimos 5 meses (agosto-diciembre). Buscar información sobre la función MONTH.
SELECT * FROM orders WHERE EmployeeID=3 AND (EXTRACT(MONTH FROM OrderDate) BETWEEN 8 AND 12);

-- 3 Seleccionar los detalles de las órdenes de compras (tabla OrderDetails) que tengan cantidades entre 10 y 250.
SELECT * FROM orderdetails WHERE Quantity BETWEEN 10 AND 250;

-- 4 Seleccionar los detalles de las órdenes de compras cuyo coste (precio unitario x unidades) se encuentre entre 10 y 330. Mostrar el coste como TOTAL.
SELECT Quantity, UnitPrice"TOTAL" FROM orderdetails  WHERE Quantity AND UnitPrice BETWEEN 10 AND 330;

-- 5 Hacer un listado de todos los países a los que pertenecen los distintos clientes (buscar información sobre el operador DISTINCT).
SELECT DISTINCT Country FROM customers;

-- 6 Mostrar los 15 productos más vendidos.
SELECT * FROM orderdetails  order by Quantity DESC LIMIT 15 ;

-- 7 Imprimir el nombre de todos los empleados, así como la longitud en caracteres del mismo (en dos columnas).
SELECT FirstName, length(FirstName) FROM employees;

-- 8 Imprimir en una única columna el nombre y apellidos de todos los empleados, concatenados.
SELECT concat(LastName, " ", FirstName) AS Nombres FROM employees;

-- 9 Imprimir el nombre de los empleados en minúsculas y el apellido en mayúsculas.
SELECT LCASE(Firstname), upper(Lastname) from employees;

-- 10 Imprimir el nombre de los empleados, excluyendo la primera y última letra.
SELECT SUBSTRING(FIRSTNAME,2,LENGTH(FIRSTNAME)-2) employees;

-- 11 Imprimir el nombre, apellidos y fecha de nacimiento de todos los empleados. La fecha de nacimiento debe estar en el formato europeo (DD—MM--AAAA).
SELECT FirstName, LastName, date_format(BirthDate, "%d-%m-%Y") AS "BirthDate" FROM employees;

-- 12 Por cada empleado, imprimir junto a su nombre y apellidos, el número de años que han transcurrido desde su nacimiento hasta su contratación.
SELECT FirstName, LastName, DATEDIFF(HireDate,BirthDate)/365 AS DATEDIFF FROM employees;

-- 13 Por cada empleado, imprimir el número de años que han transcurrido desde su contratación hasta la fecha actual.
SELECT (period_diff(date_format(curdate(),"%Y%m"),date_format(HireDate,"%Y%m"))) "Meses transcurridos desde contrato hasta hoy" FROM employees;

-- 14 Repetir el ejercicio anterior expresando el resultado en meses.
SELECT timestampdiff(MONTH, HireDate, curdate()) FROM employees;

-- 15 Repetir el ejercicio anterior expresando el resultado en días.
SELECT DATE_FORMAT(BirthDate, "%W") AS "Day", FirstName, LastName FROM employees;

-- 16 Imprimir el nombre del día de la semana en el que nació cada empleado, junto con su nombre y apellidos.
SELECT FirstName, LastName, dayname(BirthDate) AS "Dia en que nacio" FROM employees;

-- 17 Imprimir el nombre del mes en el que fue contratado cada empleado, junto con su nombre y apellidos.
SELECT FirstName, LastName, monthname(BirthDate) AS "Mes en que nacio" FROM employees;

-- 18 Por cada pedido, imprimir el id de pedido, nombre del producto y beneficio (precio unitario x unidades del pedido).
SELECT FirstName AS "Nombre", LastName AS "Apellido", HireDate AS "Fecha de Contratación", DATEDIFF(CURDATE(), HireDate) AS "Días que lleva contratado" FROM employees;

-- 19 Por cada empleado, imprimir nombre, apellidos, fecha de contratación y antigüedad en días (días que lleva contratado).
SELECT  FirstName, LastName, HireDate, TIMESTAMPDIFF(DAY, HireDate, CURDATE()) AS "Antigüedad en días", TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS "Edad de contratación" FROM employees;

-- 20 Repetir el ejercicio anterior añadiendo una nueva columna con la edad a la que fue contratado.
SELECT FirstName, LastName, HireDate, DATEDIFF(current_timestamp,HireDate), datediff(HireDate,BirthDate)/365 AS "Edad" FROM employees;

-- 21 Seleccionar los 7 productos con precio más caro, que cuenten con stock en almacén. Buscar información sobre la función LIMIT.
SELECT * FROM products WHERE UnitsInStock > 0 ORDER BY UnitPrice DESC LIMIT 7;

-- 22 Seleccionar los 9 productos con menos stock en almacén, que pertenezcan a la categoría 3, 5 u 8.
SELECT ProductName, UnitsInStock, CategoryID FROM products WHERE CategoryID IN(3,5,8) ORDER BY UnitsInStock ASC LIMIT 9;
