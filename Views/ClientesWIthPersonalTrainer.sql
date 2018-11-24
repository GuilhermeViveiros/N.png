-- César

USE Npng;

DROP PROCEDURE IF EXISTS `ClientesWithPersonalTrainer`;
CREATE VIEW `ClientesWithPersonalTrainer` as
	SELECT * FROM Cliente as C
		INNER JOIN Cliente_tem_Pacote as CP on C.idCliente = CP.idCliente
			INNER JOIN Pacote as P on CP.idPacote = P.idPacote
				INNER JOIN Personal_Trainer as PT on P.id_Personal_Trainer = PT.idFuncionário;