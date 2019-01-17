USE `Npng`;
DROP procedure IF EXISTS `ShowClassesFromClientsWithSchedule`;

DELIMITER %%

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowClassesFromClientsWithSchedule`(Id INT , Data_inicial  DateTime , Data_final DateTime)
BEGIN
	Select A.Nome From Cliente as C
		inner join Cliente_tem_Pacote as CP
			on CP.idCliente = C.idCliente
				inner join Pacote_tem_Aula as PA
					on CP.idPacote = PA.idPacote
						inner join Aula as A
							on PA.idAula = A.idAula
								inner join Aula_tem_Horário as AH
									on A.idAula = AH.idAula
										where AH.Horário_inicio = Data_inicial and AH.Horário_Fim = Data_final and C.idCliente = Id; 
																
END %%
DELIMITER ;