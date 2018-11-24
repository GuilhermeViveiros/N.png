USE `Npng`;
DROP VIEW IF EXISTS `ClientesSemPacoteAtual`;

CREATE VIEW `ClientesSemPacoteAtual` AS
	select C.idCliente, C.Nome FROM Cliente as C 
    INNER JOIN (
		select idCliente from Cliente where idCliente not in (
			SELECT idCliente from Cliente_tem_Pacote
				where Data_inicial <= now() and Data_final >= now())) as C2
					On C.idCliente = C2.idCliente;