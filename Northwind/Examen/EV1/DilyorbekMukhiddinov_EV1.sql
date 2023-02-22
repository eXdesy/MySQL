-- 1. Muestre el ID de categoría, nombre de categoría y descripción (en este mismo orden) 
-- para todas las categorías existentes. La cabecera de las columnas del grid de resultado 
-- deben mostrarse exactamente como ID de categoría, Nombre de categoría y Descripcion, 
-- respetando los espacios. Los nombres de las distintas categorías deben aparecer completamente 
-- en mayúsculas.


-- 2. Por cada producto muestre el nombre de producto, longitud en caracteres del nombre de 
-- producto, precio unitario redondeado al entero inferior más cercano, número de unidades en 
-- stock y ganancia. La ganancia de cada producto se calcula utilizando el número de unidades 
-- del producto y el precio unitario redondeado de dicho producto.


-- 3. Cuente la cantidad de productos que pertenecen a la categoría “Bebidas”.
SELECT COUNT(products.UnitsInStock) AS "Bebidas" FROM products 
JOIN categories ON products.CategoryID = categories.CategoryID 
WHERE categories.CategoryName = "Beverages";

-- 4. Por cada producto muestre el nombre de producto, nombre de la compañía proveedora y 
-- ciudad de la compañía proveedora, para aquellos productos sin stock.


-- 5. Muestre los proveedores con algún valor visible en el campo Homepage.
SELECT * FROM suppliers WHERE HomePage NOT LIKE "";

-- 6. Halle el total de unidades en stock para aquellos productos cuya descripción de 
-- categoría es “Carnes preparadas”.
SELECT COUNT(products.UnitsInStock), categories.Description FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.Description = "Prepared meats";

-- 7. Por cada cliente halle la cantidad total de pedidos, sólo para aquellos clientes de 
-- Alemania, Canada o Venezuela que tienen algún valor visible en el campo Region.
SELECT customers.*, COUNT(orderdetails.Quantity) FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
WHERE customers.Country IN("Germany", "Canada", "Venezuela") AND customers.Region NOT LIKE ""
GROUP BY customers.CustomerID;

-- 8. Por cada cliente, pedido realizado y empleado asociado, muestre los distintos productos 
-- (id de producto).
SELECT customers.CustomerID, orders.OrderID, employees.EmployeeID FROM customers 
JOIN orders ON customers.CustomerID = orders.CustomerID 
JOIN employees ON orders.EmployeeID = employees.EmployeeID
GROUP BY customers.CustomerID;

-- 9. Halle la edad media de los representantes de ventas de Londres y Redmond que sean mujeres.
SELECT LastName, FirstName, City, BirthDate FROM employees 
WHERE TitleOfCourtesy LIKE "Ms%" AND City = "London" OR "Redmond" AND Title = "Sales Represantive" 
HAVING AVG(BirthDate); 

-- 10. Por cada ciudad muestre el número de empleados conedad superior a 66 años. (2022 - 66 = 1956)
SELECT LastName, Firstname, City, BirthDate 
FROM northwind.employees WHERE BirthDate <= "1956-01-01"
GROUP BY City;
