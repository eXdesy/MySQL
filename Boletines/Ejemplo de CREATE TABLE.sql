-- CREATE DATABASE:
-- https://www.mysqltutorial.org/mysql-create-database/
CREATE DATABASE Wishlist;
USE Wishlist;

-- CREATE TABLE:
-- https://www.mysqltutorial.org/mysql-create-table/
CREATE TABLE Lista(
	Codigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL NOT NULL
);
INSERT INTO Lista(Nombre,Precio) VALUES('Nike-Brasilia',13);
INSERT INTO Lista(Nombre,Precio) VALUES('Nike-Elemental',18);
INSERT INTO Lista(Nombre,Precio) VALUES('Vans-Old Skool liii',30);

-- FOREING KEY:
-- https://www.mysqltutorial.org/mysql-foreign-key/

-- ALTER TABLE:
-- https://www.mysqltutorial.org/mysql-alter-table.aspx

-- AUTO_INCREMENT:
-- https://www.mysqltutorial.org/sql_autoincrement.asp
