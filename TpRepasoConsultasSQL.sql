USE ConsultasSQL;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    salario INT(10) NOT NULL
);

INSERT INTO empleados (nombre, edad, salario) VALUES
('Carlos Pérez', 30, 55000),
('Ana Gómez', 28, 60000),
('Luis Fernández', 35, 45000);

SELECT * FROM empleados
WHERE salario > 50000;

UPDATE empleados
SET edad = 29
WHERE id = 2;

DELETE FROM empleados
WHERE id = 3;

SELECT COUNT(*) AS total_empleados
FROM empleados;

SELECT * FROM empleados
WHERE nombre LIKE 'A%';

CREATE TABLE departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL
);

INSERT INTO departamentos (nombre, ubicacion) VALUES
('Marketing', 'Buenos Aires'),
('Recursos Humanos', 'Mar Del Plata'),
('Administracion','Buenos Aires');

ALTER TABLE empleados
ADD COLUMN departamento_id INT,
ADD CONSTRAINT fk_departamento
FOREIGN KEY (departamento_id) REFERENCES departamentos(id);

UPDATE empleados SET departamento_id = 1 WHERE id IN (1);
UPDATE empleados SET departamento_id = 2 WHERE id IN (2);
UPDATE empleados SET departamento_id = 3 WHERE id IN (3);

SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

SELECT * FROM empleados
ORDER BY edad DESC;

SELECT * FROM empleados
WHERE edad BETWEEN 25 AND 40;

SELECT * FROM empleados
ORDER BY salario DESC
LIMIT 3;




