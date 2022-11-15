-- 1. CREAR UNA BASE DATOS

DROP DATABASE IF EXISTS COLEGIO;
CREATE DATABASE COLEGIO;

-- 2. USAR UNA BASE DE DATOS

USE COLEGIO;

-- 3. CREAR UNA TABLA

DROP TABLE IF EXISTS Alumno;
 
CREATE TABLE Alumno(
  codigo    VARCHAR(4)   NOT NULL,
  nombre    VARCHAR(30)  NOT NULL,
  edad      INT          NOT NULL,
  estatura  DOUBLE       NOT NULL,
  foto      VARCHAR(10)  NOT NULL,
            PRIMARY KEY(codigo)
);

-- 4. MOSTRAR LAS TABLAS DE UNA BASE DE DATOS

SHOW TABLES;

-- 5. DESCRBIR UNA TABLE

DESCRIBE Alumno;

-- 6. INSERTAR REGISTRO EN UNA TABLA

INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A01','Mario Ruiz',23,1.73,'1.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A02','Vanessa Lopez',21,1.71,'2.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A03','Javier Lescano',26,1.72,'3.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A04','Miguel Prado',24,1.72,'4.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A05','Carlos Lopez',21,1.74,'5.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A06','Luis Lopez',23,1.52,'6.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A07','Melissa Perez',22,1.72,'7.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A08','María Lopez',23,1.62,'8.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A09','Arturo Roncal',25,1.72,'9.png');
INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES('A10','Jose Ledezma',24,1.62,'10.png');

-- 7. MOSTRAR TODOS LOS REGISTROS DE UNA TABLA

SELECT * FROM Alumno;