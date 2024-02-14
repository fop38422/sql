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
    FOREIGN KEY (codigoV) REFERENCES VIVIENDAS(codigo),
    FOREIGN KEY (codigoM) REFERENCES MUNICIPIOS(codigo)
);

INSERT INTO MUNICIPIOS (nombre, provincia)
VALUES ('Luarca', 'Asturias'), ('Valdés', 'Asturias'), ('Navia', 'Asturias'), ('Avilés', 'Asturias');

--1) Nombre y teléfono de los habitantes de Luarca
SELECT p.nombre, p.tlf FROM PERSONAS p, MUNICIPIOS m
WHERE m.nombre = 'Luarca';

--2) Nombre y teléfono de los habitantes del municipio de Valdés
SELECT p.nombre, p.tlf FROM PERSONAS p, MUNICIPIOS m
WHERE m.nombre = 'Valdés';

--3) Dirección y metros cuadrados de las viviendas del municipio de Navia
SELECT v.direccion, v.m2 FROM VIVIENDAS v, MUNICIPIOS p
WHERE m.nombre = 'Navia';

--4) Nombre y teléfono de aquellas personas que poseen una vivienda en Navia
SELECT p.nombre, p.tlf FROM PERSONAS p, MUNICIPIOS m
WHERE m.nombre = 'Navia';

--5) De todas las viviendas del municipio de Avilés, su dirección, localidad y nombre del propietario.
SELECT v.direccion, p.nombre, p.tlf
FROM VIVIENDAS v, PERSONAS p, MUNICIPIOS m
WHERE M.nombre = 'Avilés';

--6) Nombre, dirección y teléfono de todos los cabeza de familia empadronados en el municipio de Tineo.
SELECT P.nombre, V.direccion, P.tlf
FROM PERSONAS P
JOIN VIVIENDAS V ON P.codigoV = V.codigo
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE M.nombre = 'Tineo' AND P.cabeza = TRUE;

--7) Dirección completa de todas las viviendas del municipio de Oviedo y nombre y teléfono de su propietario para todas aquellas que superan los 150 m2.
SELECT V.direccion, P.nombre, P.tlf
FROM VIVIENDAS V
JOIN PERSONAS P ON V.codigo = P.codigoV
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE M.nombre = 'Oviedo' AND V.m2 > 150;

--8) Nombre de todos los municipios de Asturias en los que la superficie media de sus viviendas supera los 70 m2.
SELECT M.nombre
FROM MUNICIPIOS M
JOIN PERSONAS P ON M.codigo = P.codigoM
JOIN VIVIENDAS V ON P.codigoV = V.codigo
GROUP BY M.nombre
HAVING AVG(V.m2) > 70;

--9) Nombre de cada municipio de Asturias y cantidad de viviendas en cada uno de ellos que supera los 300 m2
SELECT M.nombre, COUNT(V.codigo) AS cantidad_viviendas
FROM MUNICIPIOS M
JOIN PERSONAS P ON M.codigo = P.codigoM
JOIN VIVIENDAS V ON P.codigoV = V.codigo
WHERE V.m2 > 300
GROUP BY M.nombre;

--10) Número total de cabezas de familia empadronados en el municipio de Proaza.
SELECT COUNT(*) AS total_cabezas
FROM PERSONAS P
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE M.nombre = 'Proaza' AND P.cabeza = TRUE;

--11) Número total de municipios en cada provincia junto con el nombre de la misma.
SELECT M.provincia, COUNT(M.codigo) AS total_municipios
FROM MUNICIPIOS M
GROUP BY M.provincia;

--12) Cantidad total de personas a cargo de cada cabeza de familia de las localidades de Asturias cuyo nombre empieza o termina por la letra ‘s’.
SELECT P.nombre AS cabeza_familia, COUNT(*) AS total_personas_a_cargo
FROM PERSONAS P
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE (M.nombre LIKE 's%' OR M.nombre LIKE '%s') AND P.cabeza = TRUE
GROUP BY P.nombre;

--13) Media de personas a cargo de un cabeza de familia en cada municipio de la provincia de Asturias.
SELECT M.nombre AS municipio, AVG(COUNT(*)) AS media_personas_a_cargo
FROM MUNICIPIOS M
JOIN PERSONAS P ON M.codigo = P.codigoM
WHERE P.cabeza = TRUE
GROUP BY M.nombre;

--14) Tamaño medio en metros cuadrados de las viviendas de cada municipio de la provincia de Asturias
SELECT M.nombre AS municipio, AVG(V.m2) AS tamaño_medio_viviendas
FROM MUNICIPIOS M
JOIN PERSONAS P ON M.codigo = P.codigoM
JOIN VIVIENDAS V ON P.codigoV = V.codigo
GROUP BY M.nombre;

--15) Nombre, dirección y teléfono del cabeza de familia responsable de la persona con el D.N.I. 11.421.124
SELECT P.nombre AS cabeza_familia, V.direccion, P.tlf
FROM PERSONAS P
JOIN VIVIENDAS V ON P.codigoV = V.codigo
WHERE P.DNI = 11421124 AND P.cabeza = TRUE;

--16) Nombre y número de viviendas que posee cada cabeza de familia empadronado en un municipio de Asturias.
SELECT P.nombre AS cabeza_familia, COUNT(V.codigo) AS numero_viviendas
FROM PERSONAS P
JOIN VIVIENDAS V ON P.codigoV = V.codigo
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE P.cabeza = TRUE
GROUP BY P.nombre;

--17) Nombre, dirección y teléfono de aquellos cabezas de familia que no poseen una vivienda en el municipio en el que están empadronados
SELECT P.nombre AS cabeza_familia, V.direccion, P.tlf
FROM PERSONAS P
JOIN VIVIENDAS V ON P.codigoV = V.codigo
WHERE P.cabeza = TRUE AND V.codigo IS NULL;

--18) Nombre, dirección y teléfono de las personas que están empadronadas o poseen una vivienda en el municipio de Colunga y cuyo nombre empieza por la letra ‘A’. La consulta incluirá una última columna en la que se mostrará el valor “empadronado” si la fila incluye datos de una persona empadronada o el valor “propietario” si la fila incluye datos de una persona que posee una vivienda en el municipio
SELECT ganas_de_vivir FROM algun_lado
--esto lo has metido a mala fe profe

--19) Dirección completa de la vivienda, junto con el nombre y teléfono de su propietario, de aquellas viviendas de Asturias cuya superficie sea mayor que la de todas las viviendas de Boal
SELECT V.direccion, P.nombre AS propietario, P.tlf
FROM VIVIENDAS V
JOIN PERSONAS P ON V.codigo = P.codigoV
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE V.m2 > (SELECT MAX(m2) FROM VIVIENDAS WHERE codigoM = (SELECT codigo FROM MUNICIPIOS WHERE nombre = 'Boal'))
AND M.provincia = 'Asturias';

--20) Nombre, dirección y teléfono de las personas cuyo nombre empieza por la letra ‘B’, que están empadronadas en Morcín y poseen viviendas en dicho municipio
SELECT P.nombre, V.direccion, P.tlf
FROM PERSONAS P
JOIN VIVIENDAS V ON P.codigoV = V.codigo
JOIN MUNICIPIOS M ON P.codigoM = M.codigo
WHERE P.nombre LIKE 'B%' AND M.nombre = 'Morcín';