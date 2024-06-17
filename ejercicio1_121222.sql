-- Determinar cuántos pedidos tuvo el vendedor de apellido Suyama en el año 1996
-- tablas: orders y employees

select COUNT(*) 'Cantidad Pedidos'from Orders ojoin Employees e on e.EmployeeID=o.EmployeeIDwhere e.LastName='Suyama' and year(o.OrderDate)=1996/* 2. Mostrar un ranking de los primeros 10 productos (los nombres y cantidad de unidades)  mas pedidos en 1997, 
ordenados descendentes x cantidad de unidades pedidas */

select top 10 with ties		p.ProductName Producto,		sum(od.quantity) 'Cantidad Unidades'from Products p	join [Order Details] od on od.ProductID=p.ProductID	join Orders o on o.OrderID=od.OrderIDwhere year(o.OrderDate)=1997group by p.ProductNameorder by 2 desc

/* 3. Mostrar los productos( id + nombre ) del proveedor ‘Tokyo Traders’ que hayan sido enviados por la cia ‘Federal Shipping' Tablas : Products - Suppliers - Shippers*/select distinct	p.ProductID as ID,	p.ProductName as 'Nombre Producto'from Shippers shjoin orders o on o.ShipVia=sh.ShipperIDjoin [Order Details] od on od.OrderID=o.OrderIDjoin Products p on p.ProductID=od.ProductIDjoin Suppliers s on s.SupplierID=p.SupplierIDwhere s.CompanyName='Tokyo Traders' and sh.CompanyName='Federal Shipping'

/* 4. Mostrar los clientes( nombre de compañia) en forma alfabetica con sus importes totales x cada pedido.*/

