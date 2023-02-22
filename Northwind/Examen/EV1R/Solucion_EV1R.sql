-- 1.Recuperar los proveedores cuyo nombre de compañía termine en Ltd. y mostrar el ID de proveedor y nombre de compañía, traduciendo al castellano los nombres de las columnas.
SELECT SUP.SUPPLIERID 'ID DE PROVEEDOR', SUP.COMPANYNAME 'NOMBRE DE COMAPAÑÍA' 
FROM SUPPLIERS AS SUP
WHERE SUP.COMPANYNAME LIKE '%LTD.';

-- 2.Mostrar toda la información de los proveedores cuyo nombre de contacto comienza por la cadena chXr donde la X representa un único carácter cualquiera.
SELECT SUP.* 
FROM SUPPLIERS AS SUP 
WHERE SUP.CONTACTNAME LIKE 'CH_R%';
 
-- 3.Mostrar los productos con descuento junto con el ID de pedido y el empleado que atendió el pedido. 
SELECT ORDT.UnitPrice*0.50 'DESCUENTO', ORD.ORDERID, EMP.EMPLOYEEID
FROM ORDERS AS ORD
JOIN employees AS EMP
ON(ORD.EMPLOYEEID = EMP.EMPLOYEEID)
JOIN orderdetails AS ORDT
ON(ORD.ORDERID = ORDT.ORDERID);

-- 4.Contar los clientes de cada país que disponen de FAX.
SELECT COUNT(CUS.COUNTRY)'CLIENTES DISPONE FAX'
FROM CUSTOMERS AS CUS
WHERE FAX <> '';

-- 5.	Contar los pedidos enviados por la compañía de envíos número 3. 
SELECT COUNT(ORD.ORDERID)'PEDIDO ENVIADOS'
FROM ORDERS AS ORD 
WHERE ORD.SHIPVIA = 3;

-- 6.	Calcular el nivel de reordenamiento medio de los productos que empiezan por C. 
SELECT PRODUCTNAME
FROM PRODUCTS AS PRD
WHERE PRODUCTNAME LIKE 'C%';

-- 7.	Contar el número de categorías que cuentan con imagen. 
SELECT COUNT(CAT.CATEGORYID)'NÚMERO DE CATEGORÍA CON IMAGEN'
FROM CATEGORIES AS CAT
WHERE PICTURE <> '';

-- 8.	Mostrar los proveedores de Londres. 
SELECT SUP.SUPPLIERID, SUP.CITY
FROM SUPPLIERS AS SUP
WHERE CITY = 'LONDON';

-- 9.	Obtener el total de unidades en stock de los productos con ID par.
SELECT SUM(PRD.UnitsInStock)'TOTAL UNIDADES EN STOCK'
FROM PRODUCTS AS PRD;
 
-- 10.	Por cada empleado mostrar la descripción de su territorio junto con el ID de territorio y empleado.
SELECT EMP.FIRSTNAME, EMP.LASTNAME, EMTR.EMPLOYEEID, EMTR.TERRITORYID, TER.TERRITORYDESCRIPTION
FROM EMPLOYEETERRITORIES AS EMTR
JOIN TERRITORIES AS TER
ON (TER.TERRITORYID = EMTR.TERRITORYID)
JOIN employees AS EMP
ON (EMP.EMPLOYEEID = EMTR.EMPLOYEEID)
GROUP BY EMPLOYEEID;