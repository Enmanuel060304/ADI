CREATE DATABASE ADI_DB;
USE ADI_DB;

GO;
-- Create the Table for the Rol
CREATE TABLE [Rol]
(
    [id]   UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [name] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Rol_id] PRIMARY KEY ([id])
);

GO;

-- Create the Unique Index for the Rol
CREATE UNIQUE INDEX [IX_Rol_name]
    ON [Rol] ([name]);

GO;

-- Create the Table for the Employee
CREATE TABLE [Employee]
(
    [id]       UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [name]     NVARCHAR(50)     NOT NULL,
    [LastName] NVARCHAR(50)     NOT NULL,
    [Phone]    NVARCHAR(50)     NOT NULL,
    [email]    NVARCHAR(50)     NOT NULL,
    [password] NVARCHAR(50)     NOT NULL,
    [rol_id]   UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Employee_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Employee_Rol_Id] FOREIGN KEY ([rol_id]) REFERENCES [Rol] ([id])
);

GO;

-- Create the Unique Index for the Employee
CREATE UNIQUE INDEX [IX_Employee_name]
    ON [Employee] ([name], [LastName], [email], [Phone], [password]);

GO;

-- Create the Table for the Customer
CREATE TABLE [Customer]
(
    [id]       UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [name]     NVARCHAR(50)     NOT NULL,
    [LastName] NVARCHAR(50)     NOT NULL,
    [Phone]    NVARCHAR(50)     NOT NULL,
    [Email]    NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Customer_id] PRIMARY KEY ([id])
);

GO;
-- Create the Unique Index for the Customer
CREATE UNIQUE INDEX [IX_Customer_name]
    ON [Customer] ([name], [LastName], [Phone], [Email]);

GO;
-- Create the Table for the Supplier
CREATE TABLE Supplier
(
    [id]       UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Name]     NVARCHAR(50)     NOT NULL,
    [LastName] NVARCHAR(50)     NOT NULL,
    [Phone]    NVARCHAR(50)     NOT NULL,
    [Email]    NVARCHAR(50)     NOT NULL,
    [Address]  NVARCHAR(50)     NOT NULL,
    CONSTRAINT [PK_Supplier_id] PRIMARY KEY ([id])

);

GO;

-- Create the Unique Index for the Supplier
CREATE UNIQUE INDEX [IX_Supplier_name]
    ON [Supplier] ([Name], [LastName], [Phone], [Email])

GO;

-- CREATE TABLE SALES
CREATE TABLE Sale
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Customer_id] UNIQUEIDENTIFIER NOT NULL,
    [Employee_id] UNIQUEIDENTIFIER NOT NULL,
    [Date]        DATETIMEOFFSET   NOT NULL,
    CONSTRAINT [PK_Sale_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Sale_Customer_id] FOREIGN KEY ([Customer_id]) REFERENCES [Customer] ([id]),
    CONSTRAINT [FK_Sale_Employee_id] FOREIGN KEY ([Employee_id]) REFERENCES [Employee] ([id])

);

GO;

-- CREATE TABLE Line
CREATE TABLE Line
(
    [id]   UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Name] NVARCHAR(50)     NOT NULL
        CONSTRAINT [PK_Line_id] PRIMARY KEY ([id])
);

GO;

--CREATE INDEX FOR LINE.Name

CREATE UNIQUE INDEX [IX_Line_Name]
    ON [Line] ([Name]);

GO;

CREATE TABLE Category
(
    [id]    UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Name]  NVARCHAR(50)     NOT NULL,
    Id_Line UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Category_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Line_id] FOREIGN KEY ([Id_Line]) REFERENCES [Line] ([id])
);

GO;

--Create index for Category.Name
CREATE UNIQUE INDEX [IX_Category_Name]
    ON [Category] ([Name]);

GO;

-- CREATE TABLE PRODUCT
CREATE TABLE Product
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Name]        NVARCHAR(50)     NOT NULL,
    [Price]       DECIMAL(18, 2)   NOT NULL,
    [Stock]       INT              NOT NULL,
    [Category_id] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Product_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Category_id] FOREIGN KEY ([Category_id]) REFERENCES [Category] ([id])
);

GO;

-- CREATE INDEX FOR PRODUCT.Name
CREATE UNIQUE INDEX [IX_Product_Name]
    ON [Product] ([Name]);

GO;

--CREATE TABLE FOR SALEDETAIL
CREATE TABLE SalesDetail
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [id_Product]  UNIQUEIDENTIFIER NOT NULL,
    [Amount]      DECIMAL(10, 2)   NOT NULL,
    [Description] NVARCHAR(50)     NOT NULL,
    CONSTRAINT [FK_SalesDetail_Product_id] FOREIGN KEY ([id_Product]) REFERENCES [Product] ([id]),
    CONSTRAINT [PK_SalesDetail_id] PRIMARY KEY ([id])

);

GO;

--CREATE TABLE FOR PURCHASE
CREATE TABLE Purchase
(
    [id]          UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Date]        DATETIMEOFFSET   NOT NULL,
    [Supplier_id] UNIQUEIDENTIFIER NOT NULL,
    [Employee_id] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Purchase_id] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Purchase_Supplier_id] FOREIGN KEY ([Supplier_id]) REFERENCES [Supplier] ([id]),
    CONSTRAINT [FK_Purchase_Employee_id] FOREIGN KEY ([Employee_id]) REFERENCES [Employee] ([id])

);

GO;

--CREATE TABLE FOR PURCHASEDETAIL
CREATE TABLE PurchaseDetail
(
    Id_Purchase UNIQUEIDENTIFIER NOT NULL,
    Id_Product  UNIQUEIDENTIFIER NOT NULL,
    Amount      DECIMAL(10, 2)   NOT NULL,
    Description NVARCHAR(50)     NOT NULL,
    CONSTRAINT [FK_PurchaseDetails_Purchase_id] FOREIGN KEY ([Id_Purchase]) REFERENCES [Purchase] ([id]),
    CONSTRAINT [FK_PurchaseDetails_Product_id] FOREIGN KEY ([Id_Product]) REFERENCES [Product] ([id])
);

GO;


