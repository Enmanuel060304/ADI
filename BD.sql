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

CREATE UNIQUE INDEX [IX_Rol_Nombre]
    ON [Rol] ([Nombre]);
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

CREATE UNIQUE INDEX [IX_Empleado_Nombre]
    ON [Empleado] ([Nombre], [Apellido], [Telefono], [email]);
GO

CREATE TABLE [Cliente]
(
    [id]       UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre]   NVARCHAR(50)     NOT NULL,
    [Apellido] NVARCHAR(50)     NOT NULL,
    [Telefono] NVARCHAR(50)     NOT NULL,
    [Email]    NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Customer_id] PRIMARY KEY ([id])
);
GO

CREATE UNIQUE INDEX [IX_Cliente_Nombre]
    ON [Cliente] ([Nombre], [Apellido], [Telefono], [Email]);

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


CREATE UNIQUE INDEX [IX_Proveedor_name]
    ON [Proveedor] ([nOmbre], [Apellido], [Telefono], [Email]);
GO

CREATE TABLE [venta]
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Cliente_id]  UNIQUEIDENTIFIER NOT NULL,
    [Empleado_id] UNIQUEIDENTIFIER NOT NULL,
    [Fecha]       DATETIMEOFFSET   NOT NULL,
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

CREATE UNIQUE INDEX [IX_Linea_Nombre]
    ON [Linea] ([Nombre]);
GO

CREATE TABLE [Categoria]
(
    [id]     UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre] NVARCHAR(50)     NOT NULL,
    Id_Linea UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Categoria_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Linea_id] FOREIGN KEY ([Id_Linea]) REFERENCES [Linea] ([id])
);
GO


CREATE UNIQUE INDEX [IX_Categoria_Nombre]
    ON [Categoria] ([Nombre]);
GO


CREATE TABLE [Producto]
(
    [id]           UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Nombre]       NVARCHAR(50)     NOT NULL,
    [Precio]       DECIMAL(18, 2)   NOT NULL,
    [Stock]        INT              NOT NULL,
    [Categoria_id] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Producto_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Categoria_id] FOREIGN KEY ([Categoria_id]) REFERENCES [Categoria] ([id])
);
GO

CREATE UNIQUE INDEX [IX_Producto_Nombre]
    ON [Producto] ([Nombre]);
GO

CREATE TABLE [DetalleVenta]
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Venta_id]    UNIQUEIDENTIFIER NOT NULL,
    [Producto_id] UNIQUEIDENTIFIER NOT NULL,
    [Cantidad]    INT              NOT NULL,
    [Descripcion] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_DetalleVenta_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_DetalleVenta_Venta_id] FOREIGN KEY ([Venta_id]) REFERENCES [Venta] ([id]),
    CONSTRAINT [FK_DetalleVenta_Producto_id] FOREIGN KEY ([Producto_id]) REFERENCES [Producto] ([id])
);
GO;


CREATE TABLE [Compra]
(
    [id]           UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Fecha]        DATETIMEOFFSET   NOT NULL,
    [Proveedor_id] UNIQUEIDENTIFIER NOT NULL,
    [Empleado_id]  UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Compra_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Compra_Proveedor_id] FOREIGN KEY ([Proveedor_id]) REFERENCES [Proveedor] ([id]),
    CONSTRAINT [FK_Compra_Empleado_id] FOREIGN KEY ([Empleado_id]) REFERENCES [Empleado] ([id])

);
GO

CREATE TABLE [DetalleCompra]
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Compra_id]   UNIQUEIDENTIFIER NOT NULL,
    [Producto_id] UNIQUEIDENTIFIER NOT NULL,
    [Cantidad]    INT              NOT NULL,
    [Descripcion] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_DetalleCompra_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_DetalleCompra_Compra_id] FOREIGN KEY ([Compra_id]) REFERENCES [Compra] ([id]),
    CONSTRAINT [FK_DetalleCompra_Producto_id] FOREIGN KEY ([Producto_id]) REFERENCES [Producto] ([id])
);
GO


