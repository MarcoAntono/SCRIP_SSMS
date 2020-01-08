USE neptuno
GO

SELECT IdEmpleado,Apellidos,Nombre,cargo,direccion,ciudad
FROM dbo.Empleados;

SELECT * FROM sys.all_columns a WHERE a.name = 'dbo.Empleados';

GO

CREATE PROC LISTAR_EMPLEADO_ALL
AS
BEGIN
   SELECT IdEmpleado,Apellidos,Nombre,cargo,direccion,ciudad
FROM dbo.Empleados; 
END
GO

EXEC LISTAR_EMPLEADO_ALL
GO

ALTER PROC  INSERT_EMPLEADO_NE
@IdEmpleado  INT,
@Apellidos VARCHAR(50),
@Nombre VARCHAR(50),
@cargo VARCHAR(50),
@direccion VARCHAR(50),
@ciudad VARCHAR(50)
AS 
SET NOCOUNT ON
BEGIN
    --DECLARE @StrMensaje as VARCHAR(30) = '';
	BEGIN TRY
		INSERT INTO dbo.Empleados (IdEmpleado,Apellidos,Nombre ,cargo,direccion,ciudad)
		values (@IdEmpleado,@Apellidos,@Nombre ,@cargo,@direccion,@ciudad);
	   SELECT 'SE REGISTRO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
	SELECT 'ERROR AL REGISTRAR '
	END CATCH
	--SELECT @StrMensaje
END
GO

EXEC INSERT_EMPLEADO_NE  511,'Matos','Marco','Representante de ventas','oventry HouseMiner Rd','Londres'
GO
     dto.IdEmpleado = 111;
            dto.Apellidos = "Matos";
            dto.Nombre = "Marco";
            dto.cargo = "Representante de ventas";
            dto.direccion = "Coventry HouseMiner Rd.";
            dto.ciudad = "Londres";

CREATE PROC  UPDATE_EMPLEADO_NE
@IdEmpleado  INT,
@Apellidos VARCHAR(50),
@Nombre VARCHAR(50),
@cargo VARCHAR(50),
@direccion VARCHAR(50),
@ciudad VARCHAR(50)
AS 
SET NOCOUNT ON
BEGIN
    DECLARE @StrMensaje as VARCHAR(30) = '';
	BEGIN TRY
		UPDATE dbo.Empleados 
		SET Apellidos = @Apellidos,Nombre  = @Nombre ,cargo = @cargo,direccion = @direccion,ciudad = @ciudad
		WHERE  IdEmpleado = @IdEmpleado;		
		SET @StrMensaje = 'SE ACTUALIZO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
	SET @StrMensaje = 'ERROR AL ACTUALIZAR '
	END CATCH
	SELECT @StrMensaje
END
GO

CREATE PROC  DELETE_EMPLEADO_NE
@IdEmpleado  INT
AS 
SET NOCOUNT ON
BEGIN
    DECLARE @StrMensaje as VARCHAR(30) = '';
	BEGIN TRY
		DELETE FROM dbo.Empleados 		
		WHERE  IdEmpleado = @IdEmpleado;		
		SET @StrMensaje = 'SE ELIMINO CORRECTAMENTE'
	END TRY
	BEGIN CATCH
	SET @StrMensaje = 'ERROR AL ELIMINAR'
	END CATCH
	SELECT @StrMensaje
END
GO

exec DELETE_EMPLEADO_NE 1
GO


alTER PROC SP_LISTAR_DETALLE
@IdEmpleado INT
AS
BEGIN
SELECT  IdPedido,IdCliente,IdEmpleado,FechaPedido,FechaEntrega,FechaEnvio,FormaEnvio,Cargo,Destinatario,CiudadDestinatario FROM dbo.Pedidos 
 WHERE IdEmpleado = @IdEmpleado;
END
GO
exec SP_LISTAR_DETALLE 2
go

CREATE PROC SP_LISTADETALLE_PEDIDO
@idpedido INT
AS
BEGIN
SELECT  idpedido,idproducto,preciounidad,cantidad,descuento
FROM dbo.detallesdepedidos WHERE idpedido = @idpedido 
END
GO

EXEC SP_LISTADETALLE_PEDIDO 10248



SELECT * FROM dbo.productos;
SELECT * FROM dbo.clientes;
SELECT * FROM dbo.proveedores;
SELECT * FROM dbo.Empleados; 

select column_name
from db_
where table_name = 'dbo.detallesdepedidos'
