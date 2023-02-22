-- Crear una base de datos llamada MOVIES2, destinada a almacenar películas que se proyectan en varios cines.
CREATE DATABASE MOVIES2;
USE MOVIES2;

-- La base de datos debe tener dos tablas:
-- Movies:
-- con un campo Code de tipo entero, clave primaria.
-- con un campo Title de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Rating de tipo cadena variable de tamaño máximo 255.
CREATE TABLE Movies (
   Code INTEGER PRIMARY KEY,
   Title VARCHAR(255) NOT NULL,
   Rating VARCHAR(255) 
 );

-- MovieTheaters:
-- con un campo Code de tipo entero, clave primaria.
-- con un campo Name de tipo cadena variable de tamaño máximo 255, no null.
-- con un campo Movie de tipo entero, como clave ajena hacia la tabla Movies.
 CREATE TABLE MovieTheaters (
   Code INTEGER PRIMARY KEY,
   Name VARCHAR(255) NOT NULL,
   Movie INTEGER, FOREIGN KEY (Movie) REFERENCES Movies(Code)
 );