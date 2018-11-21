Drop procedure IF EXISTS `ClassesOfClient`;

DELIMITER %%
CREATE PROCEDURE `ClassesOfClient` (Id Int)
BEGIN
	Select A.Nome , A.Descrição from Aula as A where idAula in 
	( select PA.idAula from Pacote_tem_Aula as PA where idPacote in
		(select CP.idPacote from Cliente_tem_Pacote as CP where CP.idCliente = Id));
END %%
DELIMITER ;