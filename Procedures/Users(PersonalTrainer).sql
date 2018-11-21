USE Npng;

Drop procedure IF EXISTS `ClassesOfPT`;

-- ver Aulas
DELIMITER %%
CREATE PROCEDURE `ClassesOfPT` (x int)
BEGIN
	SELECT * FROM Aula where idPersonal_Trainer = 1;
END %%
DELIMITER ;


Drop procedure IF EXISTS `OldClientsOfPT`;

-- ver os Clientes que teve
DELIMITER %%
CREATE PROCEDURE `OldClientsOfPT` (x int)
BEGIN
	SELECT C.idCliente , C.Nif  from Cliente_teve_Personal_Trainer  as CTPT
		inner join Cliente as C
			on CTPT.idCliente = C.idCliente
				where CTPT.idPersonal_Trainer = x;
END %%
DELIMITER ;



Drop procedure IF EXISTS `ActualClientsOfPT`;


-- Clientes atuais do Personal Trainer
DELIMITER %%
CREATE PROCEDURE `ActualClientsOfPT` (x int)
BEGIN
	SELECT C.idCliente , C.Nif  from Pacote as P
		inner join Cliente_tem_Pacote as CP
			on P.idPacote = CP.idPacote
				inner join Cliente as C
					on C.idCliente = CP.idCliente
						where P.id_Personal_Trainer = 7;
END %%
DELIMITER ;

