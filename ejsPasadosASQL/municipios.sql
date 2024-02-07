    CREATE TABLE VIVIENDAS(
        codigo INT PRIMARY KEY AUTO_INCREMENT,
        direccion VARCHAR(100) NOT NULL,
        cp INT(5) NOT NULL,
        m2 INT (3) NOT NULL
    );

    CREATE TABLE MUNICIPIOS(
        codigo INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(100) NOT NULL,
        provincia VARCHAR(20) NOT NULL
    );
    
    CREATE TABLE PERSONAS(
        DNI INT(8) PRIMARY KEY,
        nombre VARCHAR(30) NOT NULL,
        tlf INT(9) NOT NULL,
        cabeza BOOLEAN NOT NULL,
        codigoV INT,
        codigoM INT,
        FOREIGN KEY (codigoV) REFERENCES VIVIENDAS(codigo)
    );