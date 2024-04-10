CREATE PROCEDURE sp_venta @id_cliente INT,
                         @id_producto INT,
                         @cantidad INT
AS
    IF (SELECT ID
        FROM PRODUCTO
        WHERE ID = @id_producto) = 0
        BEGIN
            PRINT 'No se Puede realizar el proceso de venta';
            RETURN
        END
    ELSE
        BEGIN
            DECLARE @stock int
            set @stock = (SELECT STOCK
                          FROM PRODUCTO
                          WHERE ID = @id_producto)
            UPDATE PRODUCTO
            SET STOCK = @stock - @cantidad
            WHERE ID = @id_producto

            INSERT INTO VENTA (ID, ID_CLIENTE, ID_EMPLEADO, FECHA)
            VALUES (1, @id_cliente, 1, GETDATE())

            print 'Venta Realizada'
        end
GO

EXEC sp_venta 1, 1, 20

SELECT * FROM VENTA
SELECT * FROM PRODUCTO
SELECT * FROM EMPLEADO