SELECT * FROM employees WHERE Region = " ";
SELECT * FROM Employees WHERE Region LIKE '_%';
SELECT * FROM Employees WHERE Region != ' ';
SELECT * FROM Employees WHERE TRIM(Region) = '';

-- Usar = y !=
SELECT * FROM Employees WHERE Country = 'Germany' AND Age = 25; -- AND 
SELECT * FROM Employees WHERE EmployeeID IN (1, 3, 7) ORDER BY FirstName; -- ORDER BY, ASC, DESC, LIMIT, GROUP BY
SELECT * FROM Employees WHERE EmployeeID NOT IN (1, 3, 7);
SELECT * FROM Employees WHERE EmployeeID = 1 OR EmployeeID = 7;  -- OR
SELECT * FROM Employees WHERE EmployeeID <5; -- <, <=
SELECT * FROM Employees WHERE EmployeeID BETWEEN 3 AND 6;  
SELECT * FROM Employees WHERE FirstName LIKE 'A%'; -- empieza por A%, termina por %A
SELECT * FROM Employees WHERE SUBSTRING(City, 1, 1) BETWEEN "A" AND "C"; -- de la A a la C,para que no de error usar SUBSTRING     !!!!!!!!!!!!!!!! (se puede poner LOWER(SUBSTRING(ContactName, 1, 1)) BETWEEN "e" AND "p")
SELECT CONCAT(FistName, " ", LastName) FROM Employees;

-- SUM (SUMA CIFRAS)
-- COUNT (*) Cuenta numero de filas
-- LOWER() Para convertir en lowercase (UPPER para uppercase)
-- YEAR(OrderDate)=1997 (coge el año solo)
-- CHAR_LENGTH(FirstName) (devuelve el numero de caracteres de la palabra)
-- EXTRACT(DAY FROM orderdate)=31 AND EXTRACT(MONTH FROM orderdate)=7
-- DIFFERENT
-- LIMIT 15;

-- 10. Imprimir el nombre de los empleados, excluyendo la primera y última letra.
SELECT SUBSTRING(FirstName, 2, LENGTH(FIRSTNAME)-2) FROM employees; 														 --   !!!!!!!!!!!!!!!!!!!!!!!! (enunciado)
-- DATE_FORMAT(birthdate, "%d-%m-%Y") AS "Cumpleaños" 
-- TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS "Años"
SELECT FirstName, LastName, DATEDIFF(HireDate, BirthDate)/356 FROM Employees;
-- SELECT CONCAT_WS('-', FirstName, LastName) FROM employees;
-- SELECT POSITION('mundo' IN 'Hola mundo');
-- WHERE YEAR(ord.OrderDate) BETWEEN 1997 AND YEAR(curdate())
SELECT pro.ProductID, pro.ProductName, sup.Address FROM Products as pro JOIN Suppliers as sup ON pro.SupplierID=sup.SupplierID;  -- JOIN

SELECT sup.Country, COUNT(*) 
FROM Suppliers AS sup WHERE substring(sup.CompanyName, 1, 1)
BETWEEN "E%" AND "P%" GROUP BY sup.Country HAVING COUNT(*)>2;  
-- OrderDate BETWEEN "1997-01-01" AND "1998-12-31";

SELECT*,LEFT(OrderDate, 4) FROM Orders;
SELECT reverse(FirstName) FROM employees;
SELECT *, POSITION("Anne" IN FirstName) FROM Employees;
SELECT CURDATE();
SELECT now();
SELECT year(now());
SELECT year(BirthDate) FROM Employees;
SELECT utc_time();
select version();

SELECT CategoryID, AVG(UnitsInStock) FROM Products;
-- GROUP BY asada HAVING asda;
SELECT DISTINCT Country FROM Customers;  -- Distinct, si a eso le hago COUNT(DISTINCT Country) tengo el numero de paises que hay
SELECT * FROM Products WHERE mod(ProductID, 2)=0; -- modulo
SELECT * FROM Products WHERE ProductID%2=0; -- lo mismo


-- 27. Crear una consulta que muestre el nombre de empleado y el número de empleados que cada uno de los empleados tiene a su cargo
SELECT Boss.EmployeeID, CONCAT(Boss.FirstName," ",Boss.LastName) AS "Boss", COUNT(*) AS "Empleados a cargo" FROM employees AS Boss 
JOIN employees AS Slave ON (Slave.ReportsTo = Boss.EmployeeID)
GROUP BY Boss.EmployeeID; 

-- 30.Crear una consulta que muestre el nombre del jefe y el número de empleados a su cargo de aquel jefe que mas empleados tenga a su cargo
SELECT boss.EmployeeID, CONCAT(Boss.FirstName," ",Boss.LastName) AS "Boss", COUNT(*) AS "Empleados a cargo" FROM employees AS Boss
JOIN employees ON employees.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;


/*
DAY Returns the day of the month for a given date
DAYNAME Returns the weekday name for a given date
DAYOFMONTH Returns the day of the month for a given date
DAYOFWEEK Returns the weekday index for a given date
DAYOFYEAR Returns the day of the year for a given date
*/
