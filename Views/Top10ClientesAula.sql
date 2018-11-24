USE Npng;
DROP VIEW IF EXISTS `Top10ClientesAula`;
CREATE VIEW `Top10ClientesAula` AS
	SELECT CAH.idCliente, C.Nome as NomeDeCliente, Count(A.Nome) as QuantasVezesFoi
		FROM Cliente_frequentou_Aula_com_Horário as CAH
			INNER JOIN Aula as A on CAH.idAula = A.idAula
				INNER JOIN Cliente as C on CAH.idCliente = C.idCliente
					GROUP BY  CAH.IdCLiente
						ORDER BY Count(A.Nome) DESC
							LIMIT 10;
                    
-- SELECT * FROM Top10ClientesAula;