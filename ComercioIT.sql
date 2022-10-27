create database ComercioIT;

use ComercioIT;

drop table if exists Productos;

create table Productos(
	idProducto int(11) unsigned not null auto_increment primary key,
    Nombre varchar(50) not null,
    Precio double,
    Marca varchar(30) not null,
    Categoria varchar(30) not null,
    Stock int(6) not null,
    Disponible boolean default false
);

# drop table Productos;

show databases;

ALTER TABLE `Productos` ADD Observaciones VARCHAR(100);

ALTER TABLE `Productos` ADD CodigoDeBarras VARCHAR(13) NOT NULL, 
    ADD CodigoInt INT NOT NULL;

ALTER TABLE `Productos` CHANGE Observaciones Comentarios VARCHAR(100);

ALTER TABLE `Productos` MODIFY CodigoDeBarras VARCHAR(13) UNIQUE NOT NULL;
ALTER TABLE `Productos` MODIFY Comentarios VARCHAR(200);
ALTER TABLE `Productos` MODIFY CodigoInt VARCHAR(12) UNIQUE NOT NULL;
ALTER TABLE `Productos` DROP Comentarios;
ALTER TABLE `Productos` ADD Comentarios VARCHAR(150);

-- RENAME TABLE Productos TO Articulos;
-- DESCRIBE Articulos;
RENAME TABLE Articulos TO Productos;

-- Carga de datos.
-- Forma completa
INSERT INTO `Productos` (Nombre, Precio, Marca, Categoria, Stock, Disponible, CodigoDeBarras, CodigoInt, Comentarios) VALUES ('iPhone 5', 499.99, 'Apple', 'Smartphone', 10, false, '7790139100985', 'SP002A2B5IP',NULL);
-- Forma simplificada.
INSERT INTO `Productos` VALUES (0, 'G52', 249.99, 'Motorola', 'Smartphone', 15, true, '7790139110985', 'SP002A2C6IP',NULL);
SELECT * FROM `Productos`;

DESCRIBE Productos;