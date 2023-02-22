-- Crear una base de datos llamada WAREHOUSES2, destinada a almacenar información sobre unos almacenes. 
CREATE DATABASE WAREHOUSES2;
USE WAREHOUSES2;

-- La base de datos debe tener dos tablas:
-- Warehouses:
-- con un campo Code de tipo entero no nulo, clave primaria.
-- con un campo Location de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Capacity de tipo entero no nulo.
CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL, PRIMARY KEY (Code)
 );

-- Boxes:
-- con un campo Code de tipo cadena variable de tamaño máximo 255, no nulo, clave primaria.
-- con un campo Contents de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Value de tipo real no nulo.
-- con un campo Warehouse de tipo entero no nulo, clave ajena hacia la tabla Warehouses.
CREATE TABLE Boxes (
    Code VARCHAR(255) NOT NULL,
    Contents VARCHAR(255) NOT NULL,
	Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL, PRIMARY KEY (Code), FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 );