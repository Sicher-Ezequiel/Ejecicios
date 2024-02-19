
/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE productos(
id INT PRIMARY KEY,
nombre VARCHAR(255),
precio NUMERIC )

/* 2. Inserta al menos cinco registros en la tabla "Productos" */
INSERT INTO public.productos(id,nombre,precio)
VALUES 
(1,'camiseta',10),
(2,'pantalon',12),
(3,'sudadera',20),
(4,'zapatilla',30.5),
(5,'botas',50)

/*  3. Actualiza el precio de un producto en la tabla "Productos */
UPDATE productos
SET precio = 40
WHERE id = 4

/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM productos 
WHERE id = 1

/*  5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos"). */
SELECT 
usuarios.nombre,
productos.nombre AS producto
FROM public.usuarios usuarios
INNER JOIN public.productos productos
ON usuarios.id_producto = productos.id

