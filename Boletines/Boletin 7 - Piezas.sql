CREATE DATABASE PIEZAS;
USE PIEZAS;
CREATE TABLE Pieza (
  Codigo INTEGER PRIMARY KEY NOT NULL,
  Nombre TEXT NOT NULL
  );
 CREATE TABLE Proveedores (
  Codigo VARCHAR(40) 
  PRIMARY KEY NOT NULL,  
  Nombre TEXT NOT NULL 
  );
 CREATE TABLE Provee (
  ID_Pieza INTEGER, 
  FOREIGN KEY (ID_Pieza) REFERENCES Pieza(Codigo),
  ID_Proveedor VARCHAR(40), 
  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(Codigo),  
  Precio INTEGER NOT NULL,
  PRIMARY KEY(ID_Pieza, ID_Proveedor) 
  );

INSERT INTO Proveedores (Codigo, Nombre) VALUES('HAL','Empresas Clarke');
 INSERT INTO Proveedores (Codigo, Nombre) VALUES('RBT','Corporacion Susan Calvin');
 INSERT INTO Proveedores (Codigo, Nombre) VALUES('TNBC','Suministros Skellington');
 
 INSERT INTO Pieza (Codigo, Nombre) VALUES(1,'Piñones');
 INSERT INTO Pieza (Codigo, Nombre) VALUES(2,'Tornillos');
 INSERT INTO Pieza (Codigo, Nombre) VALUES(3,'Tuercas');
 INSERT INTO Pieza (Codigo, Nombre) VALUES(4,'Clavos');
 
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(1,'HAL',10);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(1,'RBT',15);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(2,'HAL',20);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(2,'RBT',15);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(2,'TNBC',14);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(3,'RBT',50);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(3,'TNBC',45);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(4,'HAL',5);
 INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) VALUES(4,'RBT',7);
 
-- 1. Añadir una entrada a la base de datos para indicar que "Suministros Skellington" (code "TNBC") proveerá piñones (code "1") por 7 céntimos cada uno.
INSERT INTO Provee (ID_Pieza, ID_Proveedor, Precio) 
VALUES(1,'TNBC',7);

-- 2. Incrementa todos los precios por un céntimo.
UPDATE Provee SET precio=precio+1;

-- 3. Actualiza la base de datos para reflejar que "Corporacion Susan Calvin" (code "RBT") no proveerá clavos (code 4).
DELETE FROM provee
WHERE ID_Proveedor="RBT" AND ID_Pieza=4;

-- 4. Actualiza la base de datos para reflejar que "Corporacion Susan Calvin" (code "RBT") no proveerá ninguna pieza (el proveedor debe permanecer en la base de datos).
DELETE FROM provee
WHERE ID_Proveedor="RBT";