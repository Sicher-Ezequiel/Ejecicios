/* EJERCICIO 2 */

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */

CREATE TABLE usuarios(
id INT PRIMARY KEY,
nombre VARCHAR(255),
edad INT)

/*3. Inserta dos registros en la tabla "Usuarios". */
INSERT INTO usuarios(id,nombre,edad)
VALUES (1,'ezequiel',30),
       (2,'lucas',25);

/*
4. Actualiza la edad de un usuario en la tabla "Usuarios". */
UPDATE public.usuarios 
SET edad = 26
WHERE id= 2

/*
5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM public.usuarios
WHERE id = 2

/* 
Nivel de dificultad: Moderado */

/* 
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */
CREATE TABLE ciudades(
id INT PRIMARY KEY,
nombre VARCHAR(255),
pais VARCHAR(255))

/*
2. Inserta al menos tres registros en la tabla "Ciudades". */
INSERT INTO ciudades(id,nombre,pais)
VALUES (1,'Tarragona','españa'),
       (2,'Buenos Aires','Argentina'),
	     (3,'Paris','Francia');

/* 
3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */
ADD COLUMN id_ciudad INT,
ADD CONSTRAINT FK_usuarios_ciudades	
FOREIGN KEY (id_ciudad) REFERENCES ciudades(id);

/* 
4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN). */
SELECT
usuarios.nombre AS nombre,
ciudades.nombre,
ciudades.pais 
FROM public.usuarios usuarios
LEFT JOIN public.ciudades ciudades 
ON ciudades.id = usuarios.id_ciudad 

/*
5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN). */
SELECT
usuarios.nombre AS Nombre,
ciudades.nombre AS ciudad,
ciudades.pais AS Pais
FROM public.usuarios usuarios
INNER JOIN public.ciudades ciudades 
ON ciudades.id = usuarios.id_ciudad 