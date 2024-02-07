--1) nombre articulos de la tienda

	SELECT nombre FROM Articulos;


--2) nombre y precio articulos

	SELECT nombre, precio FROM Articulos;


--3) nombre articulos de 500 o mas baratos

	SELECT nombre FROM Articulos
	WHERE precio <= 500;


--4) nombre articulos entre 500 y 1000

	SELECT nombre FROM Articulos
	WHERE precio BETWEEN 500 AND 1000;


--5) nombre y precio en dolares

	SELECT nombre, precio * 1.1 AS precioDol FROM Articulos;


--6) precio medio de todos los productos

	SELECT avg(precio) AS precio_medio FROM Articulos;


--7) precio medio productos fabricante 2

	SELECT avg(precio) AS precio_medio FROM Articulos WHERE fabricante = 2;


--8) numero productos mas de 600

	SELECT COUNT(*) FROM Articulos WHERE precio > 600;


--9) todos los datos de cada producto (incluido fabricante)

	SELECT * FROM Articulos, Fabricantes;


--10) nombre producto y fabricante de todos los productos

	SELECT ARTICULOS.nombre AS Articulos, FABRICANTES.nombre AS Fabricantes
	FROM ARTICULOS, FABRICANTES
	WHERE FABRICANTES.Codigo=ARTICULOS.fabricante;


--11) precio medio de los artículos de cada fabricante, mostrando el codigo del fabricante

	SELECT Fabricante, avg(precio)
	FROM ARTICULOS
	GROUP BY Fabricante


--12) precio medio de los artículos de cada fabricante, mostrando el nombre del fabricante

	SELECT FABRICANTES.Nombre, avg(articulos.Precio)
	FROM ARTICULOS
	JOIN FABRICANTES ON ARTICULOS.Fabricante=FABRICANTES.Codigo
	GROUP BY articulos.FABRICANTE


--13) Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 600

	SELECT FABRICANTES.Nombre
	FROM FABRICANTES
	JOIN ARTICULOS ON FABRICANTES.Codigo=ARTICULOS.Fabricante
	GROUP BY Fabricante
   	HAVING avg(Precio)>=600


--14) Obtener el nombre y precio del articulo mas barato

	SELECT Nombre, Precio
	FROM ARTICULOS
	WHERE Precio = (SELECT MIN(Precio) FROM ARTICULOS);


--15) Obtener una lista con el nombre y precio del articulo mas caro de cada proveedor

	SELECT F.Nombre AS Fabricante, A.Nombre AS Articulo, A.Precio AS Precio
	FROM ARTICULOS A, FABRICANTES F
	WHERE A.Fabricante=F.Codigo AND A.PRECIO=(
		SELECT MAX(A.Precio) FROM ARTICULOS A WHERE A.Fabricante=F.Codigo;
	);


--16) Añadir altavoces de 70 euros del fabricante 2

	INSERT INTO ARTICULOS (Codigo, Nombre, Precio, Fabricante)
	VALUES (121, 'AirSpeakers Pro Alpha 17X', 70, 2);


--17) Cambiar el nombre del articulo 108 a "impresora"

	UPDATE Articulos
	SET Nombre = 'Impresora'
	WHERE Codigo = 108;


--18) Cambiar todos los precios a su 90%

	UPDATE Articulos
	SET Precio = Precio * 0.9


--19) Borrar los altavoces

	DELETE FROM Articulos
	WHERE Codigo = 121;