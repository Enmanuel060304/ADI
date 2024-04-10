USE ADI_DB

--Procedimiento almacenado para agregar empleados

Drop procedure sp_Guardar_emple--**Para borrar el procedimiento de almacenamiento


CREATE PROCEDURE sp_Guardar_emple
@NomEmpleado varchar(50),
@ApellEmpleado varchar(50),
@EmailEmpleado varchar(50),
@TelefEmpleado varchar(50),
@DirecEmpleado varchar(50),
@IdRole int
As
	Begin
		If exists(Select * from EMPLEADO where NOMBRE = @NomEmpleado)
			Begin
				If exists(Select * from EMPLEADO where APELLIDO = @ApellEmpleado)
					begin
						Print 'El empleado ya existe'
					end
					Else
						Begin
							Insert Into EMPLEADO ( NOMBRE, APELLIDO, EMAIL, TELEFONO, DIRECCION, ID_ROLE) values
							(@NomEmpleado,@ApellEmpleado,@EmailEmpleado,@TelefEmpleado,@DirecEmpleado,@IdRole)
							Print'El empleado se ha agregado correctamente'
						End
						
			End
		Else
			if exists(Select * from EMPLEADO where EMAIL = @EmailEmpleado)
				Begin
					print 'El correo ya lo esta usando otro empleado, no se puede compartir cuentas'
				End
			Else
				If exists (Select * from EMPLEADO where TELEFONO = @TelefEmpleado)
					Begin
						Print 'El numero de telefono ya esta siendo usado por otro empleado, no se puede compartir celulares'
					end
				Else
					Begin
						Insert Into EMPLEADO ( NOMBRE, APELLIDO, EMAIL, TELEFONO, DIRECCION, ID_ROLE) values
						(@NomEmpleado,@ApellEmpleado,@EmailEmpleado,@TelefEmpleado,@DirecEmpleado,@IdRole)
						Print'El empleado se ha agregado correctamente'
					End
	End
Go

Exec sp_Guardar_emple 'Alejandro Mauricio', 'Guevara Zapata','Alejandro@gmail.com', '81547862', 'Juan roshmore', 1


---Editar la tabla de empleado

