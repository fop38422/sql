CREATE TABLE PAISES (
    nombre varchar(100) NOT NULL,
    id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE LOCALIDADES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES PAISES(id)
);

CREATE TABLE ACCIDENTES (
    posH FLOAT NOT NULL,
    posV FLOAT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT,
    PRIMARY KEY (posH, posV),
    FOREIGN KEY (id_pais) REFERENCES PAISES(id)
);

CREATE TABLE LAGOS (
    superficie INT NOT NULL,
    posH FLOAT NOT NULL,
    posV FLOAT NOT NULL,
    PRIMARY KEY (posH, posV),
    FOREIGN KEY (posH, posV) REFERENCES ACCIDENTES (posH, posV)
);

CREATE TABLE MONTAÑAS (
    altura INT NOT NULL,
    posH FLOAT NOT NULL,
    posV FLOAT NOT NULL,
    PRIMARY KEY (posH, posV),
    FOREIGN KEY (posH, posV) REFERENCES ACCIDENTES (posH, posV)
);

CREATE TABLE RIOS (
    longitud INT NOT NULL,
    posH FLOAT NOT NULL,
    posV FLOAT NOT NULL,
    PRIMARY KEY (posH, posV),
    FOREIGN KEY (posH, posV) REFERENCES ACCIDENTES (posH, posV)
);

CREATE TABLE PASAR (
    km INT NOT NULL,
    posH FLOAT,
    posV FLOAT,
    id_localidad INT,
    PRIMARY KEY (id_localidad, posH, posV),
    FOREIGN KEY (posH, posV) REFERENCES RIOS(posH, posV),
    FOREIGN KEY (id_localidad) REFERENCES LOCALIDADES(id)
);

INSERT INTO Paises (nombre)
VALUES ('España'), ('Francia'), ('Alemania'), ('Italia'), ('Portugal'), ('Reino Unido'), ('Noruega'), ('Suecia'); 

INSERT INTO Localidades (nombre, id_pais)
VALUES ('Madrid', 1), ('París', 2), ('Berlín', 3), ('Roma', 4), ('Lisboa', 5), ('Londres', 6), ('Oslo', 7), ('Estocolmo', 8), ('Barcelona', 1), ('Marsella', 2), ('Hamburgo', 3), ('Milán', 4), ('Oporto', 5), ('Manchester', 6), ('Bergen', 7), ('Gotemburgo', 8); 

INSERT INTO accidentes (posH, posV, nombre, id_pais)
VALUES (3, 37, 'Sierra Nevada', 1);