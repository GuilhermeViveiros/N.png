CREATE PROCEDURE `AddPackageForClient` (Id Int, IdPacote Int,X DateTime , Y DateTime)
BEGIN
INSERT INTO Ciente_tem_Pacote
	(idCliente,idPacote,Data_inicial,Data_final)
    VALUES
	(Id,IdPacote,X,Y);
END
