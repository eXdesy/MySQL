-- 1. Selecciona todas las filas de la tabla de empleados.
SELECT * FROM employees;

-- 2. Repite lo anterior, pero mostrando sólo el nombre y primer apellido de cada empleado.
SELECT LastName, FirstName FROM employees;

-- 3. Repite lo anterior, pero mostrando la cabecera de las columnas en español.
SELECT LastName "Nombre", FirstName "Apellido" FROM employees;

-- 4. Selecciona todas las filas de la tabla de pedidos y anota cuántas hay en total. 
SELECT * FROM orders; -- (830 Pedidos)

-- A continuación, selecciona de nuevo todas las filas pero mostrando únicamente el ID de pedido, contando de nuevo cuántas hay. ¿Coincide con la anotación anterior? ¿Por qué?
SELECT OrderID FROM orders; -- (830 Pedidos)

-- 5. Muestra el nombre de las distintas compañías proveedoras, renombrando la cabecera de la columna como Nombre de compañía (respeta los espacios).
SELECT CompanyName "Nombre de compañía" FROM suppliers;

-- 6. Muestra el ID de producto y nombre de producto de todos los productos.
SELECT ProductID, ProductName FROM products;

-- 7. Visualiza todo el contenido de la tabla de productos. 
SELECT * FROM products;

-- A continuación haz lo mismo con la tabla de pedidos, y de nuevo.
SELECT * FROM orders;

-- Haz lo mismo con la tabla de detalle de pedidos. ¿El contenido de las tres tablas guarda alguna similitud o relación? ¿Crees que tienen algo que ver?
SELECT * FROM orderdetails;
