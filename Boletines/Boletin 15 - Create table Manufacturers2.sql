-- Crear una base de datos llamada Manufacturers2. 
CREATE DATABASE MANUFACTURERS2;
USE MANUFACTURERS2;

-- La base de datos debe tener dos tablas:
-- Manufacturers:
-- con un campo Code de tipo entero, clave primaria.
-- con un campo Name de tipo cadena variable de tamaño máximo 255, no null.
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL, PRIMARY KEY (Code)   
);

-- Products:
-- con un campo Code de tipo entero, clave primaria.
-- con un campo Name de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Price de tipo decimal, no nulo.
-- con un campo Manufacturer de tipo entero no nulo, clave ajena hacia la tabla Manufacturers.
CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL, PRIMARY KEY (Code), FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
);