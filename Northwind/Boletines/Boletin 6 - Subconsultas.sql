-- 0. Ciudades que tienen menos clientes (customers) que la ciudad de Buenos Aires.
SELECT City, COUNT(*) AS CantidadClientes
FROM Customers
GROUP BY City
HAVING CantidadClientes < (SELECT COUNT(*)
							FROM Customers
							WHERE City = 'Buenos Aires');

-- 1. Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades en stock de los
-- productos de la categoría 4.
SELECT *
FROM Products
WHERE UnitsInStock * UnitPrice > (SELECT MAX(UnitsInStock * UnitPrice)
									FROM Products
									WHERE CategoryID = 4);

-- 2. Nombre de los empleados que son jefes.
SELECT CONCAT(Jefe.FirstName, ' ', Jefe.LastName) 'Jefes'
FROM employees AS Jefe, employees AS Empleado
WHERE Empleado.ReportsTo = Jefe.EmployeeID
GROUP BY Jefe.EmployeeID;

-- 3. Productos cuya categoría empiezan por la letra C.
SELECT ProductID, ProductName
FROM Products
WHERE CategoryID IN (SELECT CategoryID
					FROM Categories
                    WHERE CategoryName LIKE 'C%');

-- 4. Pedidos cuyo valor de carga (Freight) está por encima de la media.
SELECT *
FROM Orders
WHERE Freight > (SELECT AVG(Freight) AS MediaDeCarga 
				FROM Orders);

-- 5.Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades en stock de los productos 
-- de la categoría 4.
SELECT ProductID, UnitsInStock AS Conteo
FROM Products
HAVING Conteo > (SELECT MAX(UnitsInStock)
				FROM Products
				WHERE CategoryID = '4');

-- Teniendo en cuenta que "Valor" es como precio.
SELECT * 
FROM Products
WHERE UnitsInStock * UnitPrice > 
								(SELECT MAX(UnitsInStock * UnitPrice)
								FROM Products
								WHERE CategoryID = 4);

-- 6. Escribir una consulta para recuperar el nombre de la compañía e ID de proveedor
-- de aquellos proveedores que viven en un país que tiene mas proveedores que Alemania.
SELECT CompanyName, SupplierID
FROM Suppliers
WHERE Country IN 
				(SELECT Country
                FROM Suppliers
                GROUP BY Country
                HAVING Count(*) >
								(SELECT Count(*)
                                FROM Suppliers
                                WHERE Country='Germany'));


SELECT CompanyName, SupplierID, Country, count(*)"Proveedores"
 FROM suppliers
 GROUP BY Country
 HAVING Proveedores > 
					(SELECT count(*)"proveedores" 
					FROM suppliers 
					WHERE Country ="Germany");
    
-- 7. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados
-- que tienen una edad superior a la edad media.
SELECT FirstName, LastName, substring(datediff(curdate(),BirthDate)/365,1,2) AS Edad
FROM Employees
WHERE ROUND(substring(datediff(curdate(),BirthDate)/365,1,2)) >
																(SELECT AVG(substring(datediff(curdate(),BirthDate)/365,1,2))
                                                                FROM Employees);

SELECT FirstName, LastName,TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())
FROM employees 
WHERE ROUND(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())) > (SELECT AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
														FROM employees);

-- 8. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados
-- que tienen una edad superior a la edad media de aquellos empleados con el título de 'Sales Representative'.
SELECT FirstName, LastName,TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Edad
FROM employees 
WHERE ROUND(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())) > (SELECT AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
														FROM employees
                                                        WHERE Title = "Sales Representative");

-- 9. Escribir una consulta para recuperar todos los datos de los empleados que tienen una edad superior a la edad de Margaret Peacock.
SELECT *
FROM employees
WHERE (year(now())-year(birthdate)) > (SELECT (year(now())-year(birthdate)) 'edad'
                                       FROM employees
                                       WHERE FirstName = 'Margaret' AND LastName = 'Peacock');

-- 10. Escribir una consulta para recuperar el ID de pedido, ID de cliente y nombre de compañía. Trabaje sin hacer joins entre orders y customers.
SELECT OrderID, CustomerID, CompanyName
FROM Orders
WHERE CustomerID IN (SELECT CustomerID, CompanyName
					FROM Customers);

-- 11.  Nombre de compañías de clientes que no han hecho pedidos en el 1996. No usar JOIN.
SELECT CompanyName AS "Clientes sin pedidos en 1996"
FROM Customers
WHERE CustomerID IN (SELECT CustomerID 
					FROM orders
					WHERE year(OrderDate)!="1996");

-- 12. Nombre de productos suministrados por proveedores de Japón. No usar JOIN.
SELECT ProductName
FROM Products
WHERE SupplierID IN (SELECT SupplierID
					FROM Suppliers
					WHERE Country = "Japan");

-- 16. Subconsulta para obtener los nombres de categorias con un número de productos
-- superior al número de productos que pertenecen a la categoría 'condiments'.
SELECT CategoryName
FROM Categories
WHERE CategoryID LIKE "Condiments" < (SELECT count(*) FROM Products);

(SELECT count(ProductID), CategoryName
FROM Products AS pro
JOIN categories AS cat
ON pro.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName="Contiments");

-- 17. Subconsulta para obtener los ID de aquellos empleados que tienen un número
-- de pedidos superior a la media de pedidos por empleado.
-- NOTA: Esta caso es curioso porque realizamos una SUBSELECT dentro del FROM para poder hacer el average de los pedidos que viene referenciado
-- desde dentro de la tabla generada provisionalmente.

SELECT EmployeeID, count(*) AS Pedidos
FROM Orders
GROUP BY EmployeeID
HAVING Count(*) >
					(SELECT Count(*)/(SELECT Count(*) FROM Employees)
					FROM Orders);
                    
-- Otra forma de hacerlo sería realizando una SUBSELECT en el FROM, como en este caso.             
SELECT 
    orders.EmployeeID, COUNT(*) pedidos
FROM
    orders
GROUP BY EmployeeID
HAVING pedidos > (SELECT 
        AVG(Pedidos)
    FROM
        (SELECT 
            COUNT(*) AS Pedidos
        FROM
            orders
        GROUP BY orders.EmployeeID) TablaConteo);

-- 18: productos cuyo valor de unidades en stock sea superior al valor máximo de unidades en stock 
-- de los productos de la categoría 1 y 3.

SELECT ProductID, UnitsInStock
FROM Products
WHERE UnitsInStock > (SELECT MAX(UnitsInStock)
                      FROM Products
                      WHERE CategoryID="1" OR CategoryID="3");

-- 19: escribir una consulta para recuperar todos los datos de los empleados que tienen una edad inferior 
-- a la edad de Anne Dodsworth o Janet Leverling.

SELECT *
FROM employees
WHERE (year(now())-year(birthdate)) < (SELECT (year(now())-year(birthdate)) 'edad'
                                       FROM employees
                                       WHERE (FirstName = 'Anne' AND LastName = 'Dodsworth')) OR (FirstName = 'Janet' AND LastName = 'Leverling');

-- 20: escribir una consulta para recuperar los paises que tiene mas proveedores que la suma
-- de proveedores que tienen Brasil y España.
SELECT Country
FROM suppliers
GROUP BY Country
HAVING COUNT(*) >
				(SELECT COUNT(*)
                FROM suppliers
                WHERE Country LIKE "Spain" OR Country LIKE "Brazil");


-- 21: escribir una consulta para recuperar el nombre de la compañía e ID de proveedor
-- de aquellos proveedores que viven en un país que tiene mas proveedores que la suma
-- de proveedores que tienen Brasil y España.



-- 22: ciudades que tienen más clientes que Madrid.

SELECT 
    City
FROM
    Customers
GROUP BY City
HAVING COUNT(*) > (SELECT 
        COUNT(*)
    FROM
        Customers
    WHERE
        City = 'Madrid');
        
-- 23: ciudades que tienen más clientes que Madrid y Sevilla o Seville. Hacer con MAX.

SELECT City
FROM Customers
GROUP BY City
HAVING MAX(count(*)) >
                (SELECT COUNT(*)
                FROM Customers
                WHERE City LIKE "Madrid" OR "Sevilla");

-- 24: ciudades que tienen más clientes que Madrid o Sevilla o Seville. Hacer con SUMA.
SELECT City
FROM Customers
GROUP BY City
HAVING SUM(count(*)) >
                (SELECT COUNT(*)
                FROM Customers
                WHERE City LIKE "Madrid" OR "Sevilla");

-- 25: ciudades que tienen más clientes que la suma de clientes de Madrid, Sevilla o Seville y Lisboa.
SELECT 
    City
FROM
    Customers
GROUP BY City
HAVING SUM(COUNT(*)) > (SELECT 
        COUNT(*)
    FROM
        Customers
    WHERE
        City IN (Madrid AND Sevilla OR Sevilla AND Lisboa));

-- 26: Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados
-- que tienen una edad igual o superior a la edad media empleados.

SELECT 
    CONCAT_WS(' ', FirstName, LastName) AS Empleado,
    SUBSTRING(DATEDIFF(CURDATE(), BirthDate) / 365,
        1,
        2) AS Edad
FROM
    Employees
WHERE
    ROUND(SUBSTRING(DATEDIFF(CURDATE(), BirthDate) / 365,
                1,
                2)) >= (SELECT 
            AVG(SUBSTRING(DATEDIFF(CURDATE(), BirthDate) / 365,
                    1,
                    2))
        FROM
            Employees);

-- 27: Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados
-- que tienen una edad igual o superior a la edad media de los empleados con el cargo Sales Representative.

SELECT 
    CONCAT_WS(' ', FirstName, LastName) AS Empleado,
    SUBSTRING(DATEDIFF(CURDATE(), BirthDate) / 365,
        1,
        2) AS Edad
FROM
    Employees
WHERE
    ROUND(SUBSTRING(DATEDIFF(CURDATE(), BirthDate) / 365,
                1,
                2)) >= (SELECT 
            AVG(SUBSTRING(DATEDIFF(CURDATE(), BirthDate) / 365,
                    1,
                    2))
        FROM
            Employees
        WHERE
            Title = 'Vice President, Sales');

-- 28: Productos cuyo valor de unidades en stock sea superior al valor mínimo de unidades en stock de los productos 
-- de la categoría 4 o superior al valor mínimo de unidades en stock de los productos de la categoría 6.

SELECT 
    pro.*
FROM
    Products AS pro
WHERE
    pro.UnitsInStock > (SELECT 
            MIN(UnitsInStock)
        FROM
            Products
        WHERE
            CategoryID LIKE 4)
        OR pro.UnitsInStock > (SELECT 
            MIN(UnitsInStock)
        FROM
            Products
        WHERE
            CategoryID LIKE 6);

-- 29: Productos cuya categoría empieza por la letra C o D. -- DUDA
SELECT * from categories WHERE CategoryName LIKE "C%";

SELECT * FROM Products AS pro GROUP BY CategoryID HAVING pro.CategoryID =
(SELECT count(*) from categories WHERE CategoryName LIKE "C%") OR
CategoryID = (SELECT count(*) from categories WHERE CategoryName LIKE "D%");


-- 30: Ciudades que tienen menos clientes (customers) que la ciudad de Buenos Aires y Munich.

-- 31: empleados que son más jóvenes que Margaret, Laura y Michael.