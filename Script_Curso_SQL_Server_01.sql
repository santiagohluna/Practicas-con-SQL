/*
	Comentario en bloque

	Curso: Fundamentos de programación en SQL Server
	Autor: Santiago Luna
	Fecha: 05/12/2022

*/

-- Comentario en línea

-- Crear base de datos de trabajo
create database EduIT_lu_mie

/*
	Fecha: 05/12/2022
*/

	--1 . clausula where
select 
	p.ProductID as IdProducto,
	p.ProductName as NombreProducto,
	p.UnitsInStock as Stock,
	p.UnitPrice as Precio,
	p.SupplierID as idProveedor,
	s.CompanyName as NombreProveedor
	from Products as p,Suppliers as s
	where p.SupplierID=s.SupplierID

	-- con join

	select 
	p.ProductID as IdProducto,
	p.ProductName as NombreProducto,
	p.UnitsInStock as Stock,
	p.UnitPrice as Precio,
	p.SupplierID as idProveedor,
	s.CompanyName as NombreProveedor
	from Products as p
	join Suppliers as s on s.SupplierID=p.SupplierID

	-- MOSTRAR ID DEL PRODUCTO, NOMBRE, NOMBRE CATEGORIA, STOCK
-- productos : 77   categorias 8
select 
	p.ProductID,
	p.ProductName,
	c.CategoryName as Categoria,
	p.UnitsInStock as Stock
from Products as p
inner join Categories as c on c.CategoryID=p.CategoryID

select
	o.OrderID,
	o.OrderDate,
	o.Freight,
	o.CustomerID,
	c.CompanyName as Cliente
from Customers as c
left join Orders as o on o.CustomerID=c.CustomerID
where  o.OrderID is null


*/