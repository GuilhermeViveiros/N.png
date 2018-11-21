USE `Npng`;
DROP function IF EXISTS `PtWithMoreClaims`;


DELIMITER $$
USE `Npng`$$
CREATE FUNCTION `PtWithMoreClaims` ()
RETURNS VARCHAR(45)
READS SQL DATA
DETERMINISTIC
BEGIN


Return (select  F.Nome , count(0) from Cliente_teve_Personal_Trainer as CTPT 
	inner join Personal_trainer as PT 
		on PT.idFuncionário = CTPT.idPersonal_Trainer
			inner join Funcionário as F
				on F.idFuncionário = PT.idFuncionário
					group by F.Nome
						limit 1
            );

END$$

DELIMITER ;