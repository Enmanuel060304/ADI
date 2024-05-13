CREATE DATABASE ADI_DB
GO

USE ADI_DB;
GO

CREATE TABLE [Rol]
(
    [id]     UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Rol_id] PRIMARY KEY ([id])
);
GO

CREATE TABLE [Empleado]
(
    [id]         UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre]     NVARCHAR(50)     NOT NULL,
    [Apellido]   NVARCHAR(50)     NOT NULL,
    [Telefono]   NVARCHAR(50)     NOT NULL,
    [email]      NVARCHAR(50)     NOT NULL,
    [Contraseña] NVARCHAR(50)     NOT NULL,
    [rol_id]     UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Employee_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Employee_Rol_Id] FOREIGN KEY ([rol_id]) REFERENCES [Rol] ([id])
);
GO

CREATE TABLE [Cliente]
(
    [id]       UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre]   NVARCHAR(50),
    [Apellido] NVARCHAR(50),
    [Telefono] NVARCHAR(50),
    [Email]    NVARCHAR(50),
    CONSTRAINT [PK_Customer_id] PRIMARY KEY ([id])
);
GO

CREATE TABLE [Proveedor]
(
    [id]        UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre]    NVARCHAR(50)     NOT NULL,
    [Apellido]  NVARCHAR(50)     NOT NULL,
    [Telefono]  NVARCHAR(50)     NOT NULL,
    [Email]     NVARCHAR(50)     NOT NULL,
    [Direccion] NVARCHAR(200)    NOT NULL,
    CONSTRAINT [PK_Proveedor_id] PRIMARY KEY ([id])

);
GO

CREATE TABLE [venta]
(
    [id]             UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Cliente_id]     UNIQUEIDENTIFIER NOT NULL,
    [Empleado_id]    UNIQUEIDENTIFIER NOT NULL,
    [TotalFacturado] DECIMAL(18, 2)   NOT NULL,
    [TotalDescuento] DECIMAL(18, 2)   NOT NULL,
    [Fecha]          DATETIMEOFFSET   NOT NULL,
    CONSTRAINT [PK_Venta_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Venta_Cliente_id] FOREIGN KEY ([Cliente_id]) REFERENCES [Cliente] ([id]),
    CONSTRAINT [FK_Venta_Empleado_id] FOREIGN KEY ([Empleado_id]) REFERENCES [Empleado] ([id])

);
GO

CREATE TABLE [Linea]
(
    [id]     UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Linea_id] PRIMARY KEY ([id])
);
GO

CREATE TABLE [Categoria]
(
    [id]     UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Categoria_id] PRIMARY KEY ([id]),
);
GO

CREATE TABLE [Producto]
(
    [id]           UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre]       NVARCHAR(50)     NOT NULL,
    [PrecioCompra] DECIMAL(18, 2)   NOT NULL,
    [PrecioVenta]  DECIMAL(18, 2)   NOT NULL,
    [Stock]        INT              NOT NULL,
    [Linea_id]     UNIQUEIDENTIFIER NOT NULL,
    [Categoria_id] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Producto_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Categoria_id] FOREIGN KEY ([Categoria_id]) REFERENCES [Categoria] ([id]),
    CONSTRAINT [FK_Linea_id] FOREIGN KEY ([Linea_id]) REFERENCES [Linea] ([id])
);
GO

CREATE TABLE [DetalleVenta]
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Venta_id]    UNIQUEIDENTIFIER NOT NULL,
    [Producto_id] UNIQUEIDENTIFIER NOT NULL,
    [Precio]      DECIMAL(18, 2)   NOT NULL,
    [Cantidad]    INT              NOT NULL,
    [Descuento]   DECIMAL(18, 2)   NOT NULL,
    [Descripcion] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_DetalleVenta_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_DetalleVenta_Venta_id] FOREIGN KEY ([Venta_id]) REFERENCES [Venta] ([id]),
    CONSTRAINT [FK_DetalleVenta_Producto_id] FOREIGN KEY ([Producto_id]) REFERENCES [Producto] ([id])
);
GO;


CREATE TABLE [Compra]
(
    [id]             UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Proveedor_id]   UNIQUEIDENTIFIER NOT NULL,
    [Empleado_id]    UNIQUEIDENTIFIER NOT NULL,
    [TotalFacturado] DECIMAL(18, 2)   ,
    [TotalDescuento] DECIMAL(18, 2)   ,
    [Descuento]      DECIMAL(18, 2)   ,
    [Fecha]          DATETIMEOFFSET   NOT NULL,
    CONSTRAINT [PK_Compra_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Compra_Proveedor_id] FOREIGN KEY ([Proveedor_id]) REFERENCES [Proveedor] ([id]),
    CONSTRAINT [FK_Compra_Empleado_id] FOREIGN KEY ([Empleado_id]) REFERENCES [Empleado] ([id])

);
GO
--MODIFICAR LA TABLA COMPRA Y PERMITIR QUE TOTALFACTURADO Y TOTALDESCUENTO ACEPTEN VALORES NULL
ALTER TABLE Compra
ALTER COLUMN Descuento DECIMAL(18, 2) NULL
GO

CREATE TABLE [DetalleCompra]
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Compra_id]   UNIQUEIDENTIFIER NOT NULL,
    [Producto_id] UNIQUEIDENTIFIER NOT NULL,
    [Precio]      DECIMAL(18, 2)   NOT NULL,
    [Cantidad]    INT              NOT NULL,
    [Descuento]   DECIMAL(18, 2),
    [Descripcion] NVARCHAR(250),
    CONSTRAINT [PK_DetalleCompra_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_DetalleCompra_Compra_id] FOREIGN KEY ([Compra_id]) REFERENCES [Compra] ([id]),
    CONSTRAINT [FK_DetalleCompra_Producto_id] FOREIGN KEY ([Producto_id]) REFERENCES [Producto] ([id])
);
GO
/*editar descuentos y descripcion de detalecompra y ponlo, que acepten valores nulllos*/

/*
*indices unicos de cada tabla
*/

CREATE UNIQUE INDEX [IX_Rol_Nombre]
    ON [Rol] ([Nombre]);
GO

CREATE UNIQUE INDEX [IX_Empleado_Nombre]
    ON [Empleado] ([Nombre], [Apellido], [Telefono], [email]);
GO

CREATE UNIQUE INDEX [IX_Cliente_Nombre]
    ON [Cliente] ([Nombre], [Apellido], [Telefono], [Email]);
GO

CREATE UNIQUE INDEX [IX_Proveedor_name]
    ON [Proveedor] ([Nombre], [Apellido], [Telefono], [Email]);
GO

CREATE UNIQUE INDEX [IX_Linea_Nombre]
    ON [Linea] ([Nombre]);
GO

CREATE UNIQUE INDEX [IX_Categoria_Nombre]
    ON [Categoria] ([Nombre]);
GO

CREATE UNIQUE INDEX [IX_Producto_Nombre]
    ON [Producto] ([Nombre]);
GO

--insertar datos
INSERT INTO [Rol] ([Nombre])
VALUES ('Administrador'), ('Vendedor');
GO

INSERT INTO [Empleado] ([Nombre], [Apellido], [Telefono], [email], [Contraseña], [rol_id])
VALUES ('Juan', 'Perez', '12345678', '@gmail.com', '123456', 'F1BF3683-0D5C-4E9D-AF2C-3D3737BC24DC'),
       ('Maria', 'Lopez', '12345678', '@gmail.com', '123456', '8CC55898-87A9-4D53-BD3C-5B03622EB8F7');
GO

INSERT INTO [Cliente] ([Nombre], [Apellido], [Telefono], [Email])
VALUES ('Juan', 'Perez', '12345678', '@gmail.com'),
       ('Maria', 'Lopez', '12345678', '@gmail.com');
GO
select * from Cliente

INSERT INTO [Proveedor] ([Nombre], [Apellido], [Telefono], [Email], [Direccion])
VALUES ('Juan', 'Perez', '12345678', '@gmail.com', 'direccion'),
       ('Maria', 'Lopez', '12345678', '@gmail.com', 'direccion');
GO
select * from Proveedor

INSERT INTO [Linea] ([Nombre])
VALUES ('Linea1'), ('Linea2');
GO
select * from Linea

INSERT INTO [Categoria] ([Nombre])
VALUES ('Categoria1'), ('Categoria2');
GO
select * from Categoria

INSERT INTO [Producto] ([Nombre], [PrecioCompra], [PrecioVenta], [Stock], [Linea_id], [Categoria_id])
VALUES ('Producto1', 10, 20, 100, '70069A31-6CE9-4A74-87D8-4EEA98B1AFAF', '6BAAE1F5-28FA-4AE8-9C27-05589AFF7F7A'),
       ('Producto2', 10, 20, 100, '70069A31-6CE9-4A74-87D8-4EEA98B1AFAF', '6BAAE1F5-28FA-4AE8-9C27-05589AFF7F7A');
GO
select * from Producto
go

select * from Compra
go

--crea una factura con compra y detalles compra
CREATE OR ALTER PROCEDURE sp_CrearFactura
    @compra_id UNIQUEIDENTIFIER,
    @Proveedor_id UNIQUEIDENTIFIER,
    @Empleado_id UNIQUEIDENTIFIER,
    @Fecha DATETIMEOFFSET
AS
BEGIN

    BEGIN TRANSACTION;
    BEGIN TRY
        -- Insertar en la tabla Compra
        INSERT INTO Compra (id,Proveedor_id, Empleado_id, Fecha)
        VALUES (@compra_id,@Proveedor_id,@Empleado_id,@Fecha);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacción
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
go

EXEC sp_CrearFactura '69121893-3AFC-4F92-85F3-40BB5E7C7E29', '9D82DF6D-7BB7-42DD-8FD1-0097615EC263', '765B1C5A-9C87-44CB-86EE-3FFEADD50AE7', '2021-10-10 00:00:00.0000000'

create or alter procedure sp_Insertar_Factura
    @compra_id uniqueidentifier,
    @Producto_id uniqueidentifier,
    @Precio decimal(18,2),
    @Cantidad int,
    @Descuento decimal(18,2),
    @Descripcion nvarchar(250)
as
begin
    insert into DetalleCompra (Compra_id, Producto_id, Precio, Cantidad, Descuento, Descripcion)
    values (@compra_id, @Producto_id, @Precio, @Cantidad, @Descuento, @Descripcion)
end
GO

execute sp_Insertar_Factura '69121893-3AFC-4F92-85F3-40BB5E7C7E29', '2231B207-85F5-481E-82F2-01134A730756', 10, 10, 0, 'descripcion'

create or alter procedure sp_Total_Compra
    @compra_id uniqueidentifier
as
begin
    select sum(Precio) as Total from DetalleCompra where Compra_id = @compra_id
    update Compra set TotalFacturado = (select sum(Precio) as Total from DetalleCompra where Compra_id = @compra_id) where id = @compra_id
end

execute sp_Total_Compra '69121893-3AFC-4F92-85F3-40BB5E7C7E29'

select * from DetalleCompra where Compra_id = '69121893-3AFC-4F92-85F3-40BB5E7C7E29'

exec sp_facturas_proveedor '9D82DF6D-7BB7-42DD-8FD1-0097615EC263'


create procedure sp_detalle_compra
    @compra_id uniqueidentifier
as
begin
    select * from DetalleCompra where Compra_id = @compra_id
end
