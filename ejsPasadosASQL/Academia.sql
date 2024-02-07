CREATE TABLE Profesores (
    DNI int(8) primary key,
    Nombre varchar(25) not null,
    Apellidos varchar(100) not null,
    Telefono int(9) not null,
    Direccion varchar(100) not null
    );

CREATE TABLE Cursos (
    Codigo_curso int(5) primary key,
    Titulo varchar(70) not null,
    Programa_curso varchar(300) not null,
    Duracion int(2) not null
);

CREATE TABLE Promocion(
    Codigo_promocion int(5) primary key AUTO_INCREMENT,
    Fecha_inicio varchar(10) not null,
    Fecha_fin varchar(10),
    Profesor varchar(25) not null,
    Foreign key (Profesor) References Profesores (DNI),
    Curso int(5) not null,
    Foreign key (Curso) References Cursos (Codigo_curso)
);

CREATE TABLE Alumnos (
    DNI int(8),
    Direccion VARCHAR(100) NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Telefono INT NOT NULL,
    Edad INT NOT NULL,
    PRIMARY KEY (DNI),
    CHECK (999999999 >= Telefono and Telefono > 99999999), 
    CHECK (Edad >= 18 and Edad<120)
);

CREATE TABLE Empresas (
    CIF varchar(13),
    Nombre VARCHAR(30) NOT NULL,
    Telefono INT NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (CIF)
);

CREATE TABLE AlumnosEmpresas (
    DNI int(8) not null,
    CIF varchar(13) not null,
    Foreign key (DNI) References Alumnos (DNI),
    Foreign key (CIF) References Empresas (CIF)
);

CREATE TABLE AlumnosPromocion (
    DNI int(8) not null,
    Codigo_promocion int(5) primary key AUTO_INCREMENT,
    Foreign key (DNI) References Alumnos (DNI),
    Foreign key (Codigo_promocion) References Promocion (Codigo_promocion),
    Notas int(2),
    CHECK (notas>0 && notas<10);
);


INSERT INTO AlumnosEmpresas(DNI,CIF)
VALUES (12312312,'FU498G3KZ'),
(32132121,'FE498G3KZ'),
(21321313,'FU478G3KZ'),
(12332116,'FU498G3KC'),
(32154369,'FU498G0KZ'
);


INSERT INTO Profesores (DNI,Nombre,Apellidos,Telefono,Direccion) 
VALUES (12312312,'Pepito','TuVieja',666666669,'C/ Vijifilis 3'),
    (32132121,'Tomas','Turbao',666666696,'C/ PajaRita 69'), 
    (21321313,'Elba','Ginas',666966666,'C/ Wow 1'),
    (12332116,'Angel','Muñoz',696969666,'C/ Tombola tomboleto 4'),
    (32154369,'Sopa','Sopitas',684684123,'C/ Increible hombre calvo 8'
);

INSERT INTO Cursos (Codigo_curso,Titulo,Programa_curso,Duracion)
VALUES (12345,'Sesador de pollos','Aprender a sesar pollos 4h diarias',2),
    (54321,'Peinador de calvos','Peinadito cr7 a calvitos 1h diaria',10),
    (32112,'Perseguidor coches aparcados','Ardua tarea para personas valientes 3h diarias',1),
    (89767,'Testeador de camas','Testeas camas, que rico 30h diarias',40),
    (98712,'Cata de agua del vater','Es importante saber donde se defeca 2h cada hora', 4
);

INSERT INTO Promocion (Fecha_inicio,Fecha_fin,Profesor,Curso)
VALUES 
    ('01/01/2000','31/12/2002','12312312',12345),
    ('02/02/2010','10/01/2020','12332116',54321),
    ('01/01/2003','28/12/2004','32154369',32112),
    ('08/01/2000',null,'32132121',89767),
    ('15/01/2012','09/12/2016','21321313',98712
);

INSERT INTO Empresas (CIF, Nombre, Telefono, Direccion)
VALUES 
    ('FU498G3KZ', 'Midstle', 955454853, 'C/ Calle'),
    ('FE498G3KZ', 'Pescados Jaime', 956983541, 'C/ Avenida'),
    ('FU478G3KZ', 'Compañia', 935454853, 'C/ Paseo'),
    ('FU498G3KC', 'Zaibatsu', 955464853, 'C/ Bulevar'),
    ('FU498G0KZ', 'Alimerka', 955454859, 'C/ Rotonda'
);


INSERT INTO Alumnos (DNI, Direccion, Nombre, Telefono, Edad)
VALUES (48319322, 'C/ Calle', 'Tilin', 987456213, 18),
    (26520300, 'C/ Paseo', 'Tolon', 756539061, 19),
    (67754712, 'C/ Cosa', 'Pepe', 743579540, 18),
    (05781412, 'C/ Pim', 'Sech', 786850342, 21),
    (47884717, 'C/ Pum', 'Fernando', 724144567, 19
);

INSERT INTO AlumnosPromocion (DNI, Codigo_promocion, Notas)
VALUES (48319322, 1, 5),
    (26520300, 2, 10),
    (67754712, 3, 7),
    (05781412, 4, 8),
    (47884717, 5, 6);