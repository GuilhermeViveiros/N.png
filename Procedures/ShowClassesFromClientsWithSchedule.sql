USE `Npng`;
DROP procedure IF EXISTS `ShowClassesFromClientsWithSchedule`;

DELIMITER %%

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowClassesFromClientsWithSchedule`(Id INT , Data_inicial  DateTime , Data_final DateTime)
BEGIN
	Select C.Nome From Cliente as C where idCliente in 
     ( select  CP.idCliente from Aula_tem_Horário as AH  
		inner join Aula as A 
			on A.idAula = AH.idAula
				inner join Pacote_tem_Aula as PA
					on A.idAula = PA.idAula
						inner join Cliente_tem_Pacote as CP
							on CP.idPacote = PA.idPacote 
								where AH.Horário_inicio = Data_inicial and AH.Horário_Fim = Data_final and C.idCliente = Id); 
END %%
DELIMITER ;