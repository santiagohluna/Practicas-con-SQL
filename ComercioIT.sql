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

# show databases;

describe Productos;