-- 1 - Contar el número de productos para los que no hay stock.
SELECT count(*) FROM products WHERE UnitsInStock=0;

-- 2 - Sumar el total de unidades en stock de todos los productos cuyo campo Units Order no sea cero.
SELECT sum(UnitsInStock) 'Unidades en Stock' FROM products WHERE UnitsOnOrder!=0;

-- 3 - Contar el número de empleados cuyo nombre empieza por la letra A.
SELECT count(*) FROM employees WHERE FirstName LIKE "A%";
