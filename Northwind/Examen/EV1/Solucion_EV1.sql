-- 1. Muestre el ID de categoría, nombre de categoría y descripción (en este mismo orden) para todas las categorías existentes. La cabecera de las columnas del grid de resultado deben mostrarse exactamente como ID de categoría, Nombre de categoría y Descripcion, respetando los espacios. Los nombres de las distintas categorías deben aparecer completamente en mayúsculas.
SELECT CategoryID "ID de categoría", UPPER(CategoryName) "Nombre de categoría", Description "Descripcion"
FROM Categories;

-- 2. Por cada producto muestre el nombre de producto, longitud en caracteres del nombre de producto, precio unitario redondeado al entero inferior más cercano, número de unidades en stock y ganancia. La ganancia de cada producto se calcula utilizando el número de unidades del producto y el precio unitario redondeado de dicho producto.
SELECT * FROM PRODUCTS;
SELECT ProductName "Nombre de producto", length(ProductName) "Longitud en caracteres del nombre de producto", floor(UnitPrice) "Precio redondeado", UnitsInStock "Unidades en stock", UnitsOnOrder*round(UnitPrice) "Ganancia"
FROM products;

-- 3. Cuente la cantidad de productos que pertenecen a la categoría “Bebidas”.
SELECT count(*) "Nº Productos"
FROM Products AS pro
JOIN Categories AS cat
ON pro.CategoryID = cat.CategoryID
WHERE cat.CategoryName LIKE "Beverages";

-- 4. Por cada producto muestre el nombre de producto, nombre de la compañía proveedora y ciudad de la compañía proveedora, para aquellos productos sin stock.
SELECT pro.ProductName, supp.CompanyName, supp.City
FROM Suppliers AS supp
JOIN Products AS pro
ON pro.SupplierID = supp.SupplierID
WHERE pro.UnitsInStock = 0;

-- 5. Muestre los proveedores con algún valor visible en el campo Homepage.
SELECT * FROM Suppliers
WHERE HomePage!=" ";

-- 6. Halle el total de unidades en stock para aquellos productos cuya descripción de categoría es “Carnes preparadas”.
SELECT sum(pro.UnitsInStock) "Unidades de Carnes preparadas"
FROM Products AS pro
JOIN Categories AS cat
ON pro.CategoryID = cat.CategoryID
WHERE cat.Categoryname LIKE "Meat/Poultry";

-- 7. Por cada cliente halle la cantidad total de pedidos, sólo para aquellos clientes de Alemania, Canada o Venezuela que tienen algún valor visible en el campo Region.
SELECT cust.CompanyName, count(*) "Nº Total de pedidos", cust.Country
FROM Customers AS cust
JOIN Orders AS ord
ON cust.CustomerID = ord.CustomerID
WHERE cust.Country IN ("Germany", "Canada","Venezuela") AND Region!=" "
GROUP BY cust.CustomerID;

-- 8. Por cada cliente, pedido realizado y empleado asociado, muestre los distintos productos (id de producto).
SELECT cust.CompanyName, ord.OrderID, emp.EmployeeID, ordd.ProductID
FROM Orders AS ord
JOIN Employees AS emp
ON ord.EmployeeID = emp.EmployeeID
JOIN Customers AS cust
ON cust.CustomerID = ord.CustomerID
JOIN OrderDetails AS ordd
ON ordd.OrderID = ord.OrderID;

-- 9. Halle la edad media de los representantes de ventas de Londres y Redmond que sean mujeres.
SELECT AVG(datediff(curdate(),BirthDate)/365) "Edad Media empleadas de Londres y Redmond"
FROM Employees
WHERE TitleOfCourtesy IN ("Ms.","Mrs.") AND City IN ("London","Redmond") AND Title LIKE "Sales Representative";

-- 10. Por cada ciudad muestre el número de empleados con edad superior a 66 años.
SELECT City, count(*) "Nº de Empleados", substr(datediff(curdate(),BirthDate)/365,1,2) AS Edad
FROM Employees
GROUP BY Edad
HAVING Edad > 66;