DROP VIEW IF EXISTS `Top5Clientes`;
CREATE VIEW `Top5Clientes` AS
	SELECT C.idCLiente, C.Nome, Sum(P.Preço) FROM Cliente as C
		INNER JOIN Cliente_tem_Pacote AS CT on C.idCliente = CT.idCliente
			INNER JOIN Pacote as P on CT.idPacote = P.idPacote
				GROUP BY C.idCliente
					ORDER BY Sum(P.Preço) Desc
						LIMIT 5;
                    
-- SELECT * FROM Top5Clientes;