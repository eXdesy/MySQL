-- Crear una base de datos llamada PIECES2, destinada a almacenar productos de varios proveedores. 
CREATE DATABASE PIEZAS2;
USE PIEZAS2;

-- La base de datos debe tener tres tablas:
-- Pieces: 
-- con un campo CodeID de tipo entero como clave primaria no nula.
-- con un campo Name de tipo texto no nulo.
CREATE TABLE Pieces (
	CodeID INTEGER PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL
);

-- Providers:
-- con un campo CodeID de tipo cadena variable de tamaño máximo 40, como clave primaria no nula.
-- con un campo Name de tipo texto no nulo.
CREATE TABLE Providers (
	CodeID VARCHAR(40) PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL
);

-- Provides:
-- con un campo Piece de tipo entero, clave ajena hacia la tabla Pieces.
-- con un campo Provider de tipo cadena variable de tamaño máximo 40, como clave ajena hacia la tabla Providers.
-- con un campo Price de tipo entero no nulo.
-- la clave primaria la conforman los campos Piece y Provider.
CREATE TABLE Provides (
	Piece INTEGER, FOREIGN KEY (Piece) REFERENCES Pieces(CodeID),
    Provider VARCHAR(40), FOREIGN KEY (Provider) REFERENCES Providers(CodeID),
    Price INTEGER NOT NULL, PRIMARY KEY(Piece, Provider) 
);
