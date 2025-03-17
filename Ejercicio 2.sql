-- 1. Seleccionar todos los registros de una tabla (productos)
SELECT * FROM e01_producto;

-- 2. Seleccionar productos de una determinada marca (ejemplo: 'TechCorp')
SELECT * FROM e01_producto WHERE marca = 'TechCorp';

-- 3. Seleccionar productos en orden alfabético ascendente por nombre
SELECT * FROM e01_producto ORDER BY nombre ASC;

-- 4. Agregar un nuevo producto
INSERT INTO e01_producto (codigo_producto, marca, nombre, descripcion, stock, precio)  
VALUES (6, 'NovaTech', 'Auriculares Bluetooth', 'Auricular Inalámbrico', 20, 80.00);

-- 5. Actualizar el precio del producto con ID 5 a 49.99
UPDATE e01_producto SET precio = 49.99 WHERE codigo_producto = 5;

-- 6. Eliminar el producto con ID 3
DELETE FROM e01_detalle_factura WHERE codigo_producto = 3;
DELETE FROM e01_producto WHERE codigo_producto = 3;


-- 7. Seleccionar productos con precio entre $10 y $50
SELECT * FROM e01_producto WHERE precio BETWEEN 10 AND 50;

-- 8. Seleccionar productos con precio mayor al precio promedio
SELECT * FROM e01_producto WHERE precio > (SELECT AVG(precio) FROM e01_producto);

-- 9. Incrementar en $5 el precio de productos de la marca "Nulla Dignissim Institute"
UPDATE e01_producto SET precio = precio + 5 WHERE marca = 'Nulla Dignissim Institute';

-- 10. Seleccionar teléfonos con código de área distinto de 844 y número mayor a 4369984 o tipo 'F'
SELECT * FROM e01_telefono 
WHERE (LEFT(telefono, 3) <> '844' AND telefono > '4369984') OR telefono LIKE 'F%';

-- 11. Seleccionar los 10 productos más caros
SELECT * FROM e01_producto ORDER BY precio DESC LIMIT 10;

-- 12. Seleccionar facturas del año 2016
SELECT * FROM e01_factura WHERE fecha LIKE '%2016%';

-- 13. Agregar un producto "Nuevo Producto" con precio $29.99
INSERT INTO e01_producto (codigo_producto, marca, nombre, descripcion, stock, precio)  
VALUES (7, 'NovaTech', 'Mouse Bluetooth', 'Ratón Inalámbrico', 30, 29.99);


-- 14. Incrementar el precio en 5% si es menor a $50 o su nombre no contiene "descuento"

SET SQL_SAFE_UPDATES = 0;
UPDATE e01_producto 
SET precio = precio * 1.05  
WHERE (precio < 50 OR nombre NOT LIKE '%descuento%') 
AND codigo_producto IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;


-- 15. Seleccionar teléfonos que no sean del tipo 'F' y cuyo número no sea mayor a 4892549
SELECT * FROM e01_telefono 
WHERE telefono NOT LIKE 'F%' AND telefono <= '4892549';
