
DROP DATABASE IF EXISTS facturacion;
CREATE DATABASE facturacion;
USE facturacion;

CREATE TABLE IF NOT EXISTS E01_CLIENTE (
    nro_cliente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS E01_TELEFONO (
    id_telefono INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nro_cliente INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY (nro_cliente) REFERENCES E01_CLIENTE(nro_cliente) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS E01_PRODUCTO (
    codigo_producto INT NOT NULL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0),
    precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE IF NOT EXISTS E01_FACTURA (
    nro_factura INT NOT NULL PRIMARY KEY,
    fecha DATE NOT NULL,
    total_sin_iva DECIMAL(10,2) NOT NULL,
    iva DECIMAL(10,2) NOT NULL,
    nro_cliente INT NOT NULL,
    FOREIGN KEY (nro_cliente) REFERENCES E01_CLIENTE(nro_cliente)
);


CREATE TABLE IF NOT EXISTS E01_DETALLE_FACTURA (
    id_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nro_factura INT NOT NULL,
    codigo_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    subtotal DECIMAL(10,2) NOT NULL CHECK (subtotal >= 0),
    FOREIGN KEY (nro_factura) REFERENCES E01_FACTURA(nro_factura) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (codigo_producto) REFERENCES E01_PRODUCTO(codigo_producto) 
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION
);
