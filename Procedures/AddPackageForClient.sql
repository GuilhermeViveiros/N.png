
Drop procedure IF EXISTS `AddPackageForClient`;

DELIMITER %%
CREATE PROCEDURE `AddPackageForClient` (Id Int, IdPacote Int,X DateTime , Y DateTime)
BEGIN
INSERT INTO Cliente_tem_Pacote
	(idCliente,idPacote,Data_inicial,Data_final)
    VALUES
	(Id,IdPacote,X,Y);
END %%
DELIMITER ;
