USE `Npng`;
DROP procedure IF EXISTS `EmployesWithScheduleWithClients`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmployesWithScheduleWithClients`(Id Int , X DateTime , Y DateTime)
BEGIN
	Select  F.Nome , F.Categoria , F.Email From Aula as A 
	inner join (select * From Aula_tem_Horário where Horário_Inicio >= X and Horário_Fim <=  Y) as AH
		on A.idAula = AH.idAula -- vejo quais as aulas que foram dadas naquele tempo
			inner join Personal_Trainer as PT 
				on PT.idFuncionário = A.idPersonal_Trainer
					inner join Funcionário as F
						on F.idFuncionário = PT.idFuncionário
							inner join Pacote_tem_Aula as PA 
								on PA.idAula = A.idAula
									inner join Cliente_tem_Pacote as CP
										on CP.idPacote = PA.idPacote
											inner join Cliente as C
												on C.idCliente = CP.idCliente
													where C.idCliente = Id; 
END %%
DELIMITER ;