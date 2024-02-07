-- 0) Crear las tablas e insertar datos   
CREATE TABLE DEPARTAMENTOS (  
Codigo INT PRIMARY KEY AUTO_INCREMENT,   
Nombre VARCHAR(100),   
Presupuesto INT  
);   

CREATE TABLE EMPLEADOS (   
DNI VARCHAR(8) PRIMARY KEY,   
Nombre VARCHAR(100),   
Apellidos VARCHAR(255),   
Departamento INT,   
FOREIGN KEY (Departamento) REFERENCES DEPARTAMENTOS(Codigo) ); 
 
INSERT INTO DEPARTAMENTOS (Nombre, Presupuesto) VALUES 
    ('Ventas', 100000), 
    ('Desarrollo', 150000), 
    ('Recursos Humanos', 80000), 
    ('Marketing', 120000), 
    ('Finanzas', 90000);  

INSERT INTO EMPLEADOS (DNI, Nombre, Apellidos, Departamento) VALUES 
    ('12345678', 'Juan', 'Pérez', 1), 
    ('23456789', 'María', 'López', 2), 
    ('34567890', 'Pedro', 'González', 1), 
    ('45678901', 'Laura', 'Martínez', 3), 
    ('56789012', 'Carlos', 'Sánchez', 2), 
    ('67890123', 'Ana', 'Rodríguez', 1), 
    ('78901234', 'Miguel', 'Hernández', 4), 
    ('89012345', 'Isabel', 'Díaz', 3), 
    ('90123456', 'Sergio', 'Torres', 2), 
    ('01234567', 'Elena', 'Gómez', 4), 
    ('34561234', 'Laura', 'Fernández', 1), 
    ('45672345', 'Carlos', 'Gómez', 2), 
    ('56783456', 'Sofía', 'Torres', 3), 
    ('67894567', 'Alejandro', 'Hernández', 4), 
    ('78905678', 'Marta', 'Martínez', 5), 
    ('89016789', 'Raúl', 'Sánchez', 1), 
    ('90127890', 'Eva', 'López', 2), 
    ('01238901', 'Daniel', 'García', 3), 
    ('12349012', 'Ana', 'Vega', 4), 
    ('23450123', 'Javier', 'Díaz', 5); 


--1) Obtener los apellidos de los empleados
SELECT Apellidos FROM Empleados;


--2) Obtener los apellidos de los empleados sin repeticiones
SELECT DISTINCT Apellidos FROM Empleados;


--3) Obtener todos los datos de los empleados que se apellidan "López"
SELECT * FROM EMPLEADOS WHERE Apellidos='López';


--4) Obtener todos los datos de los empleados que se apellidan "López" y los que se apellidan "Pérez"
SELECT * FROM Empleados WHERE Apellidos='López' OR Apellidos='Pérez';


--5) Obtener los datos de los empleados que trabajan en el departamento 4
SELECT * FROM Empleados WHERE Departamento=4;


--6) Obtener los datos de los empleados que trabajan en el departamento 3 o para el 4
SELECT * FROM Empleados WHERE Departamento IN (3, 4);


--7) Obtener todos los datos de los empleados cuyo apellido comience por 'G'
SELECT * FROM Empleados WHERE Apellidos LIKE 'G%';


--8) Obtener el presupuesto total de todos los departamentos 
SELECT SUM(Presupuesto) FROM Departamentos;


--9) Obtener el numero de empleados en cada departamento.
SELECT DISTINCT Departamento, COUNT(*) FROM Empleados GROUP BY Departamento;


--10) Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento. 
SELECT * FROM Empleados JOIN Departamentos ON Empleados.Departamento = Departamentos.Codigo;

--11) Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 100.000 
SELECT Nombre, Apellidos FROM Empleados WHERE Departamento IN (SELECT Codigo FROM Departamentos WHERE Presupuesto > 100000);


--12) Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos 
SELECT * FROM Departamentos WHERE Presupuesto > (SELECT AVG(Presupuesto) FROM Departamentos);


--13) Obtener  los  nombres  (únicamente  los  nombres)  de  los  departamentos  que  tienen más  de  dos  empleados 
SELECT Nombre FROM Departamentos WHERE Codigo IN (SELECT Departamento FROM Empleados GROUP BY Departamento HAVING COUNT(Departamento) > 2);


--14) Añadir un nuevo departamento:  ‘Calidad’, con presupuesto de 40.000  ¤ y código 11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109 
INSERT INTO Departamentos (Codigo, Nombre, Presupuesto)
    -> VALUES (11, 'Calidad', 40000);
INSERT INTO Empleados (DNI, Nombre, Apellidos, Departamento)
    -> VALUES (89267109, 'Esther', 'Vázquez', 11);


--15) Aplicar un recorte del presupuesto a todos los departamentos del 10%
UPDATE Departamentos SET Presupuesto = Presupuesto * 0.9;


--16) Reasignar a los empleados del departamento de desarrollo al departamento de marketing
UPDATE Empleados SET Codigo = 4 WHERE Codigo = 2;


--17) Despedir a todso los empleados del departamento de ventas (1)
DELETE FROM Empleados WHERE Departamento = 1;


--18) Despedir a todos los empleados de los departamentos cuyo presupuesto sea mayor de 90.000
DELETE FROM Empleados WHERE Departamento IN (
    SELECT Codigo FROM Departamentos WHERE Presupuesto > 90000
);


--19) Despedir a todos los empleados
DELETE FROM Empleados;