Drop database if exists DBRepuestosAutomotriz_in5cm;
create database DBRepuestosAutomotriz_in5cm;
use DBRepuestosAutomotriz_in5cm;

create table Proveedores(
	id_proveedor int auto_increment not null,
	nombre_proveedor varchar(60) not null,
	telefono_proveedor int not null,
	direccion varchar(100) not null,
	email_proveedor varchar(100) not null,
	primary key PK_id_proveedor(id_proveedor)
);

create table Empleados(
	id_empleado int auto_increment not null,
	nombre_empleado varchar(60) not null,
	apellido_empleado varchar(60) not null,
	puesto_empleado varchar(20) null,
	email_empleado varchar(100) not null,
	primary key PK_id_empleado(id_empleado)
);

create table Repuestos(
	id_repuesto int auto_increment not null,
	nombre_repuesto varchar(60) not null,
	categoria_repuesto varchar(60) not null,
	precio_compra double not null,
	precio_venta double not null,
	id_proveedor int not null,
	primary key PK_id_repuesto(id_repuesto),
	constraint FK_repuesto_proveedor foreign key (id_proveedor)
		references proveedores(id_proveedor) on delete cascade
);

create table Ventas(
	id_venta int auto_increment not null,
	fecha_venta date not null,
	cantidad int not null,
	total double not null,
	id_empleado int not null,
	id_repuesto int not null,
	primary key PK_id_venta(id_venta),
	constraint FK_ventas_empleado foreign key (id_empleado)
		references Empleados(id_empleado) on delete cascade,
	constraint FK_ventas_repuestos foreign key (id_repuesto)
		references Repuestos(id_repuesto) on delete cascade
);

-- De la tabla Proveedores
delimiter $$
	create procedure sp_proveedores_create (
		in p_nombre_proveedor varchar(60),
		in p_telefono_proveedor int,
		in p_direccion varchar(100),
		in p_email_proveedor varchar(100))
	begin
		insert into Proveedores (nombre_proveedor, telefono_proveedor, direccion, email_proveedor)
        values (p_nombre_proveedor, p_telefono_proveedor, p_direccion, p_email_proveedor);
	end $$
delimiter ;

delimiter $$
	create procedure sp_proveedores_listar()
    begin
		select * from Proveedores order by id_proveedor;
    end $$
delimiter ;

delimiter $$
	create procedure sp_proveedores_actualizar (
		in p_id_proveedor int,
		in p_nombre_proveedor varchar(60),
		in p_telefono_proveedor int,
		in p_direccion varchar(100),
		in p_email_proveedor varchar(100))
	begin
		update Proveedores
        set nombre_proveedores = p_nombre_proveedores,
			telefono_proveedor = p_telefono_proveedor,
			direccion = p_direccion,
            email_proveedor = p_email_proveedor
		where id_proveedor = p_id_proveedor;
    end $$
delimiter ;

delimiter $$
	create procedure sp_proveedores_eliminar (in p_id_proveedor int)
    begin
		delete from Proveedores where id_proveedor = p_id_proveedor;
    end $$
delimiter ;

-- De la tabla Empleados
delimiter $$
	create procedure sp_empleados_create (
		in p_nombre_empleado varchar(60),
		in p_apellido_empleado varchar(60),
		in p_puesto_empleado varchar(20),
		in p_email_empleado varchar(100))
	begin
		insert into Empleados (nombre_empleado, apellido_empleado, puesto_empleado, email_empleado)
        values (p_nombre_empleado, p_apellido_empleado, p_puesto_empleado, p_email_empleado);
	end $$
delimiter ;

delimiter $$
	create procedure sp_empleados_listar()
    begin
		select * from Empleados order by id_empleado;
    end $$
delimiter ;

delimiter $$
	create procedure sp_empleados_actualizar (
		in p_id_empleado int,
		in p_nombre_empleado varchar(60),
		in p_apellido_empleado varchar(60),
		in p_puesto_empleado varchar(20),
		in p_email_empleado varchar(100))
	begin
		update Empleados
        set nombre_empleado = p_nombre_empleado,
			apellido_empleado = p_apellido_empleado,
			puesto_empleado = p_puesto_empleado,
            email_empleado = p_email_empleado
		where id_empleado = p_id_empleado;
    end $$
delimiter ;

delimiter $$
	create procedure sp_empleados_eliminar (in p_id_empleado int)
    begin
		delete from Empleados where id_empleado = p_id_empleado;
    end $$
delimiter ;

-- De la tabla Repuestos
delimiter $$
	create procedure sp_repuestos_create (
		in p_nombre_repuesto varchar(60),
		in p_categoria_repuesto varchar(60),
		in p_precio_compra double,
		in p_precio_venta double,
        in p_id_proveedor int)
	begin
		insert into Repuestos (nombre_repuesto, categoria_repuesto, precio_compra, precio_venta, id_proveedor)
        values (p_nombre_repuesto, p_categoria_repuesto, p_precio_compra, p_precio_venta, p_id_proveedor);
	end $$
delimiter ;

delimiter $$
	create procedure sp_repuestos_listar()
    begin
		select * from Respuestos order by id_repuesto;
    end $$
delimiter ;

delimiter $$
	create procedure sp_repuestos_actualizar (
		in p_id_repuesto int,
		in p_nombre_repuesto varchar(60),
		in p_categoria_repuesto varchar(60),
		in p_precio_compra double,
		in p_precio_venta double,
        in p_id_proveedor int)
	begin
		update Repuestos
        set nombre_repuesto = p_nombre_repuesto,
			categoria_repuesto = p_categoria_repuesto,
			precio_compra = p_precio_compra,
            precio_venta = p_precio_venta,
            id_proveedor = p_id_proveedor
		where id_repuesto = p_id_repuesto;
    end $$
delimiter ;

delimiter $$
	create procedure sp_repuestos_eliminar (in p_id_repuesto int)
    begin
		delete from Repuestos where id_repuesto = p_id_repuesto;
    end $$
delimiter ;

-- De la tabla Ventas
delimiter $$
	create procedure sp_ventas_create (
		in p_fecha_venta date,
		in p_cantidad int,
		in p_total double,
		in p_id_empleado int,
        in p_id_repuesto int)
	begin
		insert into Ventas (fecha_venta, cantidad, total, id_empleado, id_repuesto)
        values (p_fecha_venta, p_cantidad, p_total, p_id_empleado, p_id_repuesto);
	end $$
delimiter ;

delimiter $$
	create procedure sp_ventas_listar()
    begin
		select * from Ventas order by id_venta;
    end $$
delimiter ;

delimiter $$
	create procedure sp_ventas_actualizar (
		in p_id_venta int,
		in p_fecha_venta date,
		in p_cantidad int,
		in p_total double,
		in p_id_empleado int,
        in p_id_repuesto int)
	begin
		update Repuestos
        set fecha_venta = p_fecha_venta,
			cantidad = p_cantidad,
			total = p_total,
            id_empleado = p_id_empleado,
            id_repuesto = p_id_repuesto
		where id_venta = p_id_venta;
    end $$
delimiter ;

delimiter $$
	create procedure sp_ventas_eliminar (in p_id_venta int)
    begin
		delete from Ventas where id_venta = p_id_venta;
    end $$
delimiter ;

call sp_proveedores_create('AutoPartes López', 55511111, 'Zona 1, Ciudad', 'contacto@lopez.com');
call sp_proveedores_create('Repuestos García', 55522222, 'Zona 2, Ciudad', 'ventas@garcia.com');
call sp_proveedores_create('Motores del Norte', 55533333, 'Zona 3, Ciudad', 'info@motoresnorte.com');
call sp_proveedores_create('AutoRepuestos Díaz', 55544444, 'Zona 4, Ciudad', 'diaz@autorep.com');
call sp_proveedores_create('Distribuidora Central', 55555555, 'Zona 5, Ciudad', 'central@dist.com');
call sp_proveedores_create('Partes Express', 55566666, 'Zona 6, Ciudad', 'express@partes.com');
call sp_proveedores_create('Repuestos Premium', 55577777, 'Zona 7, Ciudad', 'premium@rep.com');
call sp_proveedores_create('Autopartes El Sol', 55588888, 'Zona 8, Ciudad', 'elsol@auto.com');
call sp_proveedores_create('Repuestos Unidos', 55599999, 'Zona 9, Ciudad', 'unidos@rep.com');
call sp_proveedores_create('AutoTech', 55510101, 'Zona 10, Ciudad', 'autotech@correo.com');

-- Datos de la tabla Empleados
call sp_empleados_create('Carlos', 'Pérez', 'Vendedor', 'carlos@empresa.com');
call sp_empleados_create('Ana', 'Gómez', 'Cajera', 'ana@empresa.com');
call sp_empleados_create('Luis', 'Martínez', 'Administrador', 'luis@empresa.com');
call sp_empleados_create('María', 'López', 'Vendedor', 'maria@empresa.com');
call sp_empleados_create('Jorge', 'Ramírez', 'Bodega', 'jorge@empresa.com');
call sp_empleados_create('Sofía', 'Castro', 'Cajera', 'sofia@empresa.com');
call sp_empleados_create('Pedro', 'Méndez', 'Vendedor', 'pedro@empresa.com');
call sp_empleados_create('Lucía', 'Hernández', 'Bodega', 'lucia@empresa.com');
call sp_empleados_create('Miguel', 'Flores', 'Supervisor', 'miguel@empresa.com');
call sp_empleados_create('Elena', 'Morales', 'Vendedor', 'elena@empresa.com');

-- Datos de la tabla Repuestos
call sp_repuestos_create('Filtro de aceite', 'Motor', 25.00, 40.00, 1);
call sp_repuestos_create('Bujía', 'Motor', 15.00, 30.00, 2);
call sp_repuestos_create('Pastillas de freno', 'Frenos', 60.00, 95.00, 3);
call sp_repuestos_create('Amortiguador', 'Suspensión', 150.00, 230.00, 4);
call sp_repuestos_create('Batería', 'Eléctrico', 300.00, 450.00, 5);
call sp_repuestos_create('Radiador', 'Enfriamiento', 400.00, 600.00, 6);
call sp_repuestos_create('Correa', 'Motor', 50.00, 80.00, 7);
call sp_repuestos_create('Alternador', 'Eléctrico', 550.00, 800.00, 8);
call sp_repuestos_create('Disco de freno', 'Frenos', 120.00, 180.00, 9);
call sp_repuestos_create('Filtro de aire', 'Motor', 20.00, 35.00, 10);

-- Datos de la tabla Ventas
call sp_ventas_create('2025-01-01', 2, 80.00, 1, 1);
call sp_ventas_create('2025-01-02', 1, 30.00, 2, 2);
call sp_ventas_create('2025-01-03', 3, 285.00, 3, 3);
call sp_ventas_create('2025-01-04', 1, 230.00, 4, 4);
call sp_ventas_create('2025-01-05', 2, 900.00, 5, 5);
call sp_ventas_create('2025-01-06', 1, 600.00, 6, 6);
call sp_ventas_create('2025-01-07', 4, 320.00, 7, 7);
call sp_ventas_create('2025-01-08', 1, 800.00, 8, 8);
call sp_ventas_create('2025-01-09', 2, 360.00, 9, 9);
call sp_ventas_create('2025-01-10', 3, 105.00, 10, 10);