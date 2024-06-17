create database curso_fisica;

use curso_fisica;

drop table if exists Alumnos;

create table Alumnos(
	DNI varchar(8) not null primary key,
    Apellido varchar(50) not null,
    Nombre varchar(50) not null,
    email varchar(100),
    Telefono varchar(50)
    );
    
describe Alumnos;

-- Comentario de una sola línea
# Otro comentario de una sola línea

/* Comentario de varias líneas.
insert into Alumnos values('31480305', 'Aguirre', 'Adrián Eduardo', 'fabricioaguirretec@gmail.com', '1157481815');
insert into Alumnos values('33643163', 'Alvarez', 'Diego Alejandro', 'diegotealvarez.da@gmail.com', '1169955180');
insert into Alumnos values('40972368', 'Appelhans', 'Ivan Leonel', 'ivan.appel.98@gmail.com', '');
insert into Alumnos values('27665614', 'Arce', 'Sergio Daniel', 'sergiosedico@hotmail.com.ar', '1134949810');
*/

select * from Alumnos;

alter table Alumnos add column Observaciones varchar(100) null;
alter table Alumnos add column ID int unsigned first;

alter table Alumnos modify Observaciones text null;

select DNI,Apellido,Nombre from Alumnos order by Apellido asc limit 5;

update Alumnos set Observaciones = 'Ninguna' where Observaciones = null;

create table Clases(
ID_clase int unsigned not null auto_increment primary key,
Fecha date not null,
dia varchar(10),
tipo enum('Presencial','Virtual'),
temas text
);

describe Clases;

create table Asistencia(
	fecha_clase date not null,
    DNI varchar(8) not null,
    estado enum('Presente','Ausente') not null default 'Ausente',
    foreign key (DNI) references Alumnos(DNI),
    foreign key (fecha_clase) references Clases(Fecha)
);
    
show tables;

