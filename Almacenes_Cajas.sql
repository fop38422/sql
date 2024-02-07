--0) Crea las tablas
CREATE TABLE Almacenes (
    Codigo INT,
    Lugar VARCHAR(100),
    Capacidad INT,
    PRIMARY KEY (Codigo)
);

CREATE TABLE CAJAS (
    NumReferencia VARCHAR(5),
    Contenido VARCHAR(100),
    Valor INT,
    Almacen INT,
    PRIMARY KEY (NumReferencia),
    FOREIGN KEY (Almacen) REFERENCES Almacenes(Codigo)
);


--1) Obtener todos los almacenes
SELECT * FROM Almacenes;


--2) Obtener todas las cajas
SELECT * FROM Cajas;


--3) Obtener todos los tipos de contenidos de las cajas
SELECT DISTINCT Contenido FROM Cajas;


--4) Obtener el valor medio de todas las cajas
SELECT AVG(Valor) FROM Cajas;


--5) Obtener el valor medio de las cajas de cada almacén
SELECT A.Codigo, AVG(C.Valor) FROM Almacenes A, Cajas C 
WHERE C.Almacen = A.Codigo
GROUP BY C.Almacen;


--6) Obtener los códigos de los almacenes en los que el valor medio de las cajas sea mayor que 800
SELECT Almacen FROM CAJAS GROUP BY Almacen HAVING AVG(Valor) > 800;


--7) Obtener el numero de referencia de caja junto con el nombre de la ciudad en que se encuentra
SELECT NumReferencia, Lugar FROM Cajas
JOIN Almacenes ON Codigo = Almacen;


--8) Obtener el número de cajas que hay en cada almacén
SELECT COUNT(*) FROM Cajas GROUP BY Almacen;


--9) Obtener numeros de referencia de las cajas que están en el depósito de materiales
SELECT NumReferencia FROM Cajas WHERE Almacen = 7;


--10) Insertar un nuevo almacén llamado "Depósito" con capacidad de 5000 unidades
INSERT INTO Almacenes (Codigo, Lugar, Capacidad)
VALUES (11, 'Depósito', 5000);