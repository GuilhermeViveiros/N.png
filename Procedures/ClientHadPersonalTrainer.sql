USE `Npng`;
DROP procedure IF EXISTS `ClientHadPersonalTrainer`;

DELIMITER %%
CREATE PROCEDURE `ClientHadPersonalTrainer` (Id Int)
BEGIN
	Select C.Nome , C.Nif , F.Nome,  C_teve_PT.Reclamação from Cliente as C 
	inner join Cliente_teve_Personal_Trainer as C_teve_PT 
		on C_teve_PT.idCliente = C.idCliente
			inner join Personal_Trainer as PT 
				on PT.idFuncionário = C_teve_PT.idPersonal_Trainer
					inner join Funcionário as F 
						on F.idFuncionário = PT.idFuncionário
							where C.idCliente = Id;
END %%
DELIMITER ;