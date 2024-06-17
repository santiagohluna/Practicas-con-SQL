drop database laboratorio;

-- Proyecto integrador 
-- ===================

-- Etapa 1.1

-- Ejercicio 1.
create database laboratorio;
-- Ejercicio 2.
use laboratorio;
-- Ejercicio 3.
create table facturas(
	Letra char,
    Numero int,
    ClienteID int,
    ArticuloID int,
    Fecha date,
    Monto double,
    primary key (Letra,Numero)
);

describe facturas;

-- Ejercicio 4
create table articulos(
	ArticuloID int primary key,
    Nombre varchar(50),
    Precio double,
    Stock int
);

desc articulos;

-- Ejercicio 5.
create table clientes(
	CienteID int primary key,
    Nombre varchar(25),
    Apellido varchar(25),
    CUIT char(16),
    Direccion varchar(50),
    Comentarios varchar(50)
);

-- Ejercicio 6.
show databases;

-- Ejercicio 7.
show tables;

-- Ejercicio 9.
desc clientes;

-- Etapa 1.2

-- Ejercicio 1.
alter table facturas change ClienteID IDCliente int;
alter table facturas change ArticuloID IDArticulo int;
alter table facturas modify Monto double unsigned;

-- Ejercicio 2.
alter table articulos change ArticuloID IDArticulo int;
alter table articulos modify Nombre varchar(75);
alter table articulos modify Precio double unsigned not null;
alter table articulos modify Stock int unsigned not null;

-- Ejercicio 3.
alter table clientes change ClienteID IDCliente int;
alter table clientes modify Nombre varchar(30) not null;
alter table clientes modify Apellido varchar(35) not null;
alter table clientes change Comentarios Observaciones tinytext;

-- Etapa 1.3.

-- Ejercicio 1.
insert into facturas values('A',29,14,335,'2021-03-18',1589.50);
insert into facturas values('A',39,26,157,'2021-04-12',979.75);
insert into facturas values('B',8,17,95,'2021-04-25',513.35);
insert into facturas values('B',12,5,411,'2021-05-03',2385.70);
insert into facturas values('B',19,50,157,'2021-05-26',979.75);

select * from facturas;

-- Ejercicio 2.
desc articulos;
insert into articulos values(95,'Webcam con micrófono plug & play',513.35,39);
insert into articulos values(157,'Apple AirPods Pro',979.75,152);
insert into articulos values(335,'Lavasecarropas automático Samsung',1589.50,12);
insert into articulos values(411,'Gloria Trevi / Gloria / CD+DVD',2385.70,2);

select * from articulos;

-- Ejercicio 3.
desc clientes;
insert into clientes values(5,'Santiago','González','23-24582359-9','Uriburu 588 - 7ºA','VIP');
insert into clientes values(14,'Gloria','Fernández','23-35965952-5','Constitución 323','GBA');
insert into clientes values(17,'Gonzalo','López','23-33587416-0','Arias 2624','GBA');
insert into clientes values(26,'Carlos','García','23-42321230-9','Pasteur 322 - 2ºC','VIP');
insert into clientes values(50,'Micaela','Altieri','23-22885566-5','Santamarina 1255','GBA');

select * from clientes;

-- Etapa 2.

-- Ejercicio 1. Importar la tabla clientes_neptuno.
desc clientes_neptuno;

-- Ejercicio 2.
alter table clientes_neptuno 
	modify IDCliente varchar(5) primary key,
    modify NombreCompania varchar(100) not null,
    modify Pais varchar(15) not null;

-- Ejercicio 3.
alter table clientes rename contactos;

-- Ejercicio 4. Importar la tabla Clientes.
desc clientes;

-- Ejercicio 5.
alter table clientes 
	modify COD_CLIENTE varchar(7) primary key,
    modify EMPRESA varchar(100) not null,
    modify ciudad varchar(25) not null,
    modify telefono int unsigned,
    modify responsable varchar(30);
    
-- Ejercicio 6. Importar la tabla pedidos.
desc pedidos;

-- Ejercicio 7.
alter table pedidos
	modify numero_pedido int unsigned primary key,
    modify codigo_cliente varchar(7) not null,
    modify fecha_pedido date not null,
    modify forma_pago enum('Aplazado','Contado','Tarjeta'),
    modify enviado enum('Sí','No');
    
-- Ejercicio 8. Importar la tabla productos.
desc productos;

-- Ejercicio 9.
alter table productos
	modify cod_producto int unsigned primary key,
    modify seccion varchar(20) not null,
    modify nombre varchar(40) not null,
    modify importado enum('Verdadero','Falso'),
    modify origen varchar(25) not null,
    modify dia int unsigned not null,
    modify mes int unsigned not null,
    modify ano int unsigned not null;
    
-- Etapa 2.2

-- Ejercicios 1, 2 y 3.
desc nacimientos;

-- Ejercicios 4 y 5.
desc pedidos_neptuno;

-- Ejercicios 6, 7 y 8.
desc empleados;

-- Etapa 2.3.

-- Ejercicio 1.
select * from clientes_neptuno;

-- Ejercicio 2. 
select NombreCompania, Ciudad, Pais from clientes_neptuno;

-- Ejercicio 3.
select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais asc;

-- Ejercicio 4.
select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais, ciudad asc;

-- Ejercicio 5.
select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais, ciudad asc limit 10;

-- Ejercicio 6. 
select NombreCompania, Ciudad, Pais from clientes_neptuno order by pais, ciudad asc limit 5 offset 10;

-- Etapa 2.4

-- Ejercicio 1.
select * from nacimientos where nacionalidad = 'Extranjera';

-- Ejercicio 2.
select * from nacimientos where edad_madre < 18 order by edad_madre;

-- Ejercicio 3.
select * from nacimientos where edad_madre = edad_padre;

-- Ejercicio 4.
select * from nacimientos where edad_padre - edad_madre <= 40; 

-- Ejercicio 5.
select * from clientes_neptuno where Pais = 'Argentina';

-- Ejercicio 6. 
select * from clientes_neptuno where Pais <> 'Argentina' order by Pais;

-- Ejercicio 7.
select * from nacimientos where semanas < 20 order by semanas desc;

-- Ejercicio 8.
select * from nacimientos where sexo = 'Femenino' and nacionalidad = 'Extranjera' and estado_civil_madre = 'Soltera' and edad_madre > 40;

-- Ejercicio 9.
select * from clientes_neptuno where Pais in('Argentina','Brasil','Venezuela') order by Pais, Ciudad;

-- Ejercicio 10.
select * from nacimientos where semanas between 20 and 25 order by semanas asc;

-- Ejercicio 11.
select * from nacimientos where comuna in(1101,3201,5605,8108,9204,13120,15202) order by comuna asc;

-- Ejercicio 12.
select * from clientes_neptuno where IDCliente like 'C%';

-- Ejercicio 13.
select * from clientes_neptuno where Ciudad like 'B____';

-- Ejercicio 14.
select * from nacimientos where hijos_total > 10;

-- Etapa 3.1.

-- Ejercicios 1, 2 y 3. Respaldo de bases de datos.

-- Etapa 3.2

-- Ejercicio 1.
select idcliente ID,nombrecompania 'Nombre de Companía', concat(direccion,' - ',ciudad,' - ',pais) as 'Ubicación' from clientes_neptuno;

-- Ejercicio 2.
select idcliente ID,nombrecompania 'Nombre de Companía', concat_ws(' - ',direccion,ciudad,pais) as 'Ubicación' from clientes_neptuno;

-- Ejercicio 3.
select idcliente ID, upper(nombrecompania) Empresa, concat_ws(' - ',direccion,ciudad,pais) as 'Ubicación' from clientes_neptuno;

-- Ejercicio 4.
select lower(idcliente) CODIGO, upper(nombrecompania) Empresa, concat_ws(' - ',direccion,ciudad,pais) as 'Ubicación' from clientes_neptuno;

-- Ejercicio 5.
select fecha,left(sexo,1) SEXO,left(tipo_parto,1) TIPO from nacimientos;

-- Ejercicio 6.
select *,upper(concat(left(ciudad,1),left(pais,1),right(pais,2))) as CODIGO from clientes_neptuno;

-- Ejercicio 7.
select sexo, fecha, tipo_parto, atenc_part, local_part, substring(fecha,4,2) as MES from nacimientos order by MES;

-- Ejercicio 8.
select sexo, fecha, tipo_parto, replace(nacionalidad,'Chilena','Ciudadana') as Nacionalidad from nacimientos;

-- Etapa 3.3

-- Ejercicio 1.
select * from pedidos_neptuno where year(FechaPedido) = 1998;

-- Ejercicio 2.
select * from pedidos_neptuno where year(FechaPedido) = 1997 and month(FechaPedido) between 8 and 9;

-- Ejercicio 3.
select * from pedidos_neptuno where day(FechaPedido) = 1;

-- Ejercicio 4.
select *,datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS' from pedidos_neptuno;

-- Ejercicio 5.
select *,datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', dayname(FechaPedido) as DIA from pedidos_neptuno;

-- Ejercicio 6.
select *,datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', dayname(FechaPedido) as DIA, dayofyear(FechaPedido) as 'DIA DEL AÑO' from pedidos_neptuno;

-- Ejercicio 7.
select *, 
	datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
    dayname(FechaPedido) as DIA, 
    dayofyear(FechaPedido) as 'DIA DEL AÑO',
    monthname(FechaPedido) as MES 
     from pedidos_neptuno;

-- Ejercicio 8.
select *, 
	datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
    dayname(FechaPedido) as DIA, 
    dayofyear(FechaPedido) as 'DIA DEL AÑO',
    monthname(FechaPedido) as MES,
	adddate(FechaPedido, interval 30 day) as 'Primer vencimiento'
    from pedidos_neptuno;
    
-- Ejercicio 9.
select *, 
	datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
    dayname(FechaPedido) as DIA, 
    dayofyear(FechaPedido) as 'DIA DEL AÑO',
    monthname(FechaPedido) as MES,
	adddate(FechaPedido, interval 30 day) as 'Primer vencimiento',
    adddate(FechaPedido, interval 2 month) as 'Segundo vencimiento'
    from pedidos_neptuno;
    
-- Etapa 3.4

-- Ejercicio 1.
select *, round(cargo*0.21,2) as IVA from pedidos_neptuno;

-- Ejercicio 2.
select *, round(cargo*0.21,2) as IVA, round(cargo*1.21,2) as NETO from pedidos_neptuno;

-- Ejercicio 3.
select *, 
	round(cargo*0.21,2) as IVA, 
    round(cargo*1.21,2) as NETO, 
    floor(round(cargo*1.21,2)) as 'Redondeo a favor del cliente' 
    from pedidos_neptuno;

-- Ejercicio 4.
select *, 
	round(cargo*0.21,2) as IVA, 
    round(cargo*1.21,2) as NETO, 
    floor(round(cargo*1.21,2)) as 'Redondeo a favor del cliente',
    ceil(round(cargo*1.21,2)) as 'Redondeo a favor de la empresa'
    from pedidos_neptuno;
    
-- Etapa 3.5
    
-- Ejercicio 1
select count(*) from pedidos_neptuno;
    
-- Ejercicio 2
select count(*) as 'Entregas Speedy Express' from pedidos_neptuno where Transportista = 'Speedy Express';
    
-- Ejercicio 3
select count(*) as VENTAS from pedidos_neptuno where left(empleado,1) = 'C';
select count(*) as VENTAS from pedidos_neptuno where Empleado like 'C%';

-- Ejercicio 4
select round(avg(PrecioUnidad),2) as 'PRECIO PROMEDIO' from productos_neptuno;

-- Ejercicio 5
select  round(avg(PrecioUnidad),2) as 'PRECIO PROMEDIO', 
	round(min(PrecioUnidad),2) as 'PRECIO INFERIOR' 
    from productos_neptuno;

-- Ejercicio 6
select round(avg(PrecioUnidad),2) as 'PRECIO PROMEDIO', 
	round(min(PrecioUnidad),2) as 'PRECIO INFERIOR',
    round(max(PrecioUnidad),2) as 'PRECIO MAXIMO'
    from productos_neptuno;

-- Ejercicio 7
select NombreCategoria as CATEGORIA, round(max(PrecioUnidad),2) as 'PRECIO MAXIMO' from productos_neptuno group by NombreCategoria;

-- Ejercicio 8
select Transportista, count(*) as Entregas from pedidos_neptuno group by Transportista;
select Transportista, count(idpedido) as Entregas from pedidos_neptuno group by Transportista;

-- Ejercicio 9
select sexo, count(sexo) as NACIMIENTOS from nacimientos group by sexo;

-- Ejercicio 10
select NombreCompania as Cliente, round(sum(cargo),2) as 'Total gastos' from pedidos_neptuno group by Cliente;

-- Ejercicio 11
select seccion as Seccion, count(seccion) as Cantidad from productos group by seccion order by Cantidad desc;

-- Ejercicio 12
select year(FechaPedido) as 'Año', 
	monthname(FechaPedido) as 'Mes', 
    count(IdPedido) as 'Ventas' 
    from pedidos_neptuno group by FechaPedido order by 'Año', month(FechaPedido);
    
-- Ejercicio 13
select Empleado, 
	round(sum(Cargo),2) as 'Facturación',
    round(avg(cargo),2) as Promedio,
    max(cargo) as 'Mejor venta',
    min(cargo) as 'Peor venta',
    count(cargo) as Ventas
	from pedidos_neptuno group by Empleado;
    
set sql_safe_updates = 0;

-- Etapa 4

-- Etapa 4.1

-- Ejercicio 1
select * from nacimientos;
create table varones select * from nacimientos where sexo = 'Masculino';

-- Ejercicio 2
create table mujeres select * from nacimientos where sexo = 'Femenino';

-- Ejercicio 3
create table indeterminados select * from nacimientos where sexo = 'Indeterminado';

-- Ejercicio 4
drop table nacimientos;

-- Etapa 4.2

-- Ejercicio 1
select * from clientes_neptuno;
update clientes_neptuno set Pais = 'USA' where Pais = 'Estados Unidos';

-- Ejercicio 2
update clientes_neptuno set NombreCompania = upper(NombreCompania);

-- Ejercicio 3
update clientes_neptuno set Ciudad = upper(Ciudad), Pais = upper(Pais);

-- Ejercicio 4
alter table empleados add column nombre_empleado varchar(30) after IdEmpleado;
update empleados set nombre_empleado = concat(Apellidos,', ',Nombre);
alter table empleados drop Apellidos, drop Nombre;
select * from empleados;

-- Ejercicio 5
alter table clientes add column Tipo varchar(3);
update clientes set Tipo = 'VIP' where ciudad = 'Madrid';
select * from clientes;

-- Ejercicio 6
alter table clientes modify telefono varchar(13);
update clientes set telefono = concat('+34-',telefono);
select * from clientes;

-- Ejercicio 7
alter table productos add column Fecha date;
update productos set fecha = concat(ano,'-',mes,'-',dia);
alter table productos drop dia, drop mes, drop ano;
update productos set origen = 'ESPAÑA' where origen = 'ESPANA';
select * from productos;

-- Ejercicio 8
alter table productos_neptuno modify Suspendido varchar(2);
update productos_neptuno set Suspendido = if(Suspendido = '0','NO','SI');
select * from productos_neptuno;

-- Ejercicio 9
update productos_neptuno set PrecioUnidad = truncate(PrecioUnidad*1.1,2);
select * from productos_neptuno;

-- Ejercicio 10
update proveedores set Region = null where Region = '';
select * from proveedores;

-- Ejercicio 11
update clientes set Ciudad = concat(left(Ciudad,1),lower(substring(Ciudad,2,char_length(Ciudad))));
select * from clientes;

-- Ejercicio 12
create table productos_suspendidos select * from productos_neptuno where Suspendido = 'SI';
select * from productos_suspendidos;

-- Etapa 4.3

-- Ejercicio 1
update productos_neptuno set Suspendido = 'SI' where IdProveedor = 1;
select * from productos_neptuno; 
drop table productos_suspendidos;
create table productos_suspendidos select * from productos_neptuno where Suspendido = 'SI';
select * from productos_suspendidos;
delete from productos_neptuno where Suspendido = 'SI';

-- Etapa 5.1

-- Ejercicio 1
select * from productos_neptuno where preciounidad > (select round(avg(PrecioUnidad),2) from productos_neptuno) order by NombreProducto asc;

-- Ejercicio 2
 select * from productos_neptuno where preciounidad > (select max(PrecioUnidad) from productos_suspendidos) order by PrecioUnidad desc;
 
 -- Ejercicio 3
select * from varones where semanas < (select max(semanas) from indeterminados) order by semanas asc;

-- Ejercicio 4
select * from productos_neptuno where left(NombreProducto,1) = (select left(Nombre,1) from empleados where IdEmpleado = 8) order by NombreProducto;

-- Ejercicio 5
select * from productos_neptuno where IdProveedor = (select max(IdProveedor) from productos_neptuno) order by NombreProducto; 

-- Ejercicio 6
select * from productos_neptuno where NombreCategoria = 'Bebidas' and PrecioUnidad > (select max(Preciounidad) from productos_neptuno where NombreCategoria = 'Condimentos');

-- Ejercicio 7
select * from mujeres where edad_madre > (select max(edad_madre) from varones);

-- Ejercicio 8
select NombreCompania, Ciudad, Pais from clientes_neptuno where NombreCompania in (select NombreCompania from pedidos_neptuno where cargo > 500.0) order by NombreCompania;

-- Etapa 5.2

-- Ejercicio 1
select IdCliente, NombreCompania, Ciudad, Pais, 
case
	when Pais in ('México', 'Canadá', 'USA') then 'América del Norte'
    when Pais in ('Argentina', 'Brasil', 'Venezuela') then 'América del Sur'
    else 'Europa' end as 'Contiente' from clientes_neptuno;

-- Ejercicio 2
select IdPedido, NombreCompania, FechaPedido, Cargo, case
	when cargo > 700.0 then 'Exclente'
    when cargo > 500.0 then 'Muy bueno'
    when cargo > 250.0 then 'Bueno'
    when cargo > 50.0 then 'Regular'
    else 'Malo' end as 'Evaluación'
from pedidos_neptuno order by cargo desc;

-- Ejercicio 3
select IdProducto, NombreProducto, NombreCategoria, PrecioUnidad, case
	when PrecioUnidad > 100.0 then 'Deluxe'
    when PrecioUnidad > 10.0 then 'Regular'
    else 'Económico' end as 'Tipo'
from productos_neptuno order by PrecioUnidad desc;

-- Etapa 5.3

-- Ejercicio 1
select * from mujeres where semanas < 20
union
select * from varones where semanas < 20
union
select * from indeterminados where semanas < 20 order by semanas desc;

-- Ejercicio 2
desc mujeres;
select * from mujeres where fecha like '%/09/%' and semanas > 40 and nacionalidad = 'Chilena' and estado_civil_madre = 'Casada'
union
select * from varones where fecha like '%/09/%' and semanas > 40 and nacionalidad = 'Chilena' and estado_civil_madre = 'Casada'
union
select * from indeterminados where fecha like '%/09/%' and semanas > 40 and nacionalidad = 'Chilena' and estado_civil_madre = 'Casada';

-- Ejercicio 3
select * from productos_neptuno where PrecioUnidad > 80.0
union 
select * from productos_suspendidos where PrecioUnidad > 80.0
order by NombreProducto;

-- Ejercicio 4
select *, 'A la venta' as 'Condición' from productos_neptuno where PrecioUnidad > 80.0
union 
select *, 'Suspendido' as 'Condición' from productos_suspendidos where PrecioUnidad > 80.0
order by NombreProducto;

-- Ejercicio 5
select * from productos_neptuno where NombreCategoria = 'Bebidas'
union
select * from productos_suspendidos where NombreCategoria = 'Bebidas'
order by NombreProducto;

-- Ejercicio 6
insert into productos_suspendidos select * from productos_neptuno where IdProducto = 43;
select * from productos_suspendidos order by NombreProducto;

-- Ejercicio 7
select * from productos_neptuno where NombreCategoria = 'Bebidas'
union
select * from productos_suspendidos where NombreCategoria = 'Bebidas'
order by NombreProducto;

-- Ejercicio 8
select * from productos_neptuno where NombreCategoria = 'Bebidas'
union all
select * from productos_suspendidos where NombreCategoria = 'Bebidas'
order by NombreProducto;

-- Ejercicio 9
select * from productos_suspendidos;
delete from productos_suspendidos where IdProducto = 43;

-- Etapa 5.4

-- Ejercicio 1
create table equipos(
	equipo varchar(20) primary key
	);
desc equipos;

-- Ejercicio 2
insert into equipos values ('Argentina'), ('Brasil'), ('Paraguay'), ('Chile'), ('Uruguay'), ('Colombia'), ('Ecuador'), ('Perú'), ('Bolivia'), ('Venezuela');

select * from equipos;

-- Ejercicio 3
select * from equipos L cross join equipos V where L.equipo <> V.equipo order by L.equipo;

-- Ejercicio 4
select IdProducto, NombreProducto, nombre_empleado from productos_neptuno inner join empleados on productos_neptuno.idproducto = empleados.idempleado;

-- Etapa 5.5

-- Ejercicio 1
select proveedores.NombreContacto, productos_neptuno.IdProducto, productos_neptuno.NombreProducto, productos_neptuno.PrecioUnidad from proveedores join productos_neptuno on proveedores.idproveedor = productos_neptuno.idproveedor order by proveedores.NombreContacto, productos_neptuno.NombreProducto;

-- Ejercicio 2
select proveedores.NombreContacto, productos_neptuno.IdProducto, productos_neptuno.NombreProducto, productos_neptuno.PrecioUnidad from proveedores, productos_neptuno where proveedores.idproveedor = productos_neptuno.idproveedor order by proveedores.NombreContacto, productos_neptuno.NombreProducto;