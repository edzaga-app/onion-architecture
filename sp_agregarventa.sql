USE [onion_architecture]
GO
/****** Object:  StoredProcedure [dbo].[SP_AGREGARVENTA]    Script Date: 29/02/2024 10:46:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  ALTER PROCEDURE [dbo].[SP_AGREGARVENTA]
    @Numero INT,
    @Fecha DATETIME,
    @Total DECIMAL(18, 2),
    @ClienteId INT
AS
BEGIN
    INSERT INTO Ventas (numero, fecha, total, cliente_id)
    VALUES (@Numero, @Fecha, @Total, @ClienteId)
END;