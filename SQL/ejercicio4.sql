/*  1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE pedidos (
id INT PRIMARY KEY,
usuario_id INT,
producto_id INT,
CONSTRAINT FK_usuario_id
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
CONSTRAINT FK_producto_id
	FOREIGN KEY (producto_id) REFERENCES productos(id) );

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */
INSERT INTO public.pedidos(id, usuario_id, producto_id)
VALUES 
(1,1,1)
(2,2,2)
(3,3,3)

/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */ 

SELECT 
usuarios.nombre, 
COALESCE (productos.nombre, 'No se realizo pedido') AS producto
FROM public.usuarios usuarios
LEFT JOIN public.pedidos pedidos ON pedidos.usuario_id = usuarios.id
LEFT JOIN public.productos productos ON productos.id = pedidos.producto_id;

/* Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT 
usuarios.nombre
FROM public.usuarios usuarios 
LEFT JOIN public.pedidos pedidos ON usuarios.id = pedidos.usuario_id
LEFT JOIN public.productos productos ON productos.id = pedidos.producto_id
WHERE pedidos.id IS NOT NULL OR pedidos.usuario_id IS NULL;

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */
 
ALTER TABLE public.pedidos 
ADD COLUMN cantidad INT;

UPDATE public.pedidos 
SET cantidad = 1 
WHERE id = 1 

