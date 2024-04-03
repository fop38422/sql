CREATE TABLE JUGADORES (
    nombre VARCHAR(50),
    id INT,
    puntos INT
);

DELIMITER $$
CREATE PROCEDURE AgregarJugadores(
    IN nombre VARCHAR(50),
    IN id INT,
    IN puntos INT
)
BEGIN
    INSERT INTO JUGADORES (nombre, id, puntos)
    VALUES (nombre, id, puntos);
END
$$

CREATE PROCEDURE Ganador(IN nombreG VARCHAR(50))
BEGIN
    UPDATE JUGADORES 
    SET puntos = puntos + 1
    WHERE nombre = nombreG;
END$$
DELIMITER ;