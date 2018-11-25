USE `Npng`;
DROP procedure IF EXISTS `ClientsWithClassWithSchedule`;


DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClientsWithClassWithSchedule`(Cliente Int , Aula Int , X DateTime , Y DateTime)
BEGIN
Select * From Cliente as C where idCliente in
	(select idCliente from Cliente_tem_Pacote where idPacote in
		(select CP.idPacote from Aula_tem_Horário as AH 
			inner join Pacote_tem_Aula as PA on AH.idAula = PA.idAula
				inner join Cliente_tem_Pacote as CP on CP.idPacote = PA.idPacote
					where  AH.Horário_Inicio = X and AH.Horário_Fim = Y and A.idAula = Aula and C.idCliente = Cliente));
END %%
DELIMITER ;