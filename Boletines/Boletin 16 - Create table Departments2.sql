-- Crear una base de datos llamada Departments2. 
CREATE DATABASE DEPARTMENTS2;
USE DEPARTMENTS2;

-- La base de datos debe tener dos tablas:
-- Departments:
-- con un campo Code de tipo entero, clave primaria.
-- con un campo Name de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Budget de tipo decimal, no nulo.
CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL ,
  Budget DECIMAL NOT NULL 
);

-- Employees:
-- con un campo SSN de tipo entero, clave primaria.
-- con un campo Name de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo LastName de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Department de tipo entero no nulo, clave ajena hacia la tabla Departments.
CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL ,
  LastName VARCHAR(255) NOT NULL ,
  Department INTEGER NOT NULL, FOREIGN KEY (department) REFERENCES Departments(Code) 
)