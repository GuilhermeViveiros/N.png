DROP VIEW IF EXISTS `Top10ClientesFromEachAula`;
CREATE VIEW `Top10ClientesFromEachAula` AS
	SELECT A.Nome as Aula, CAH.idCliente, C.Nome as NomeDeCliente, Count(CAH.idCliente) as QuantasVezesFoi
		FROM Cliente_frequentou_Aula_com_Horário as CAH
		INNER JOIN (SELECT A.idAula , A.Nome, CFAH.idCliente ,count(CFAH.idCliente) FROM Aula as A
			INNER JOIN Cliente_frequentou_Aula_com_Horário as CFAH on A.idAula = CFAH.idAula
				GROUP BY A.idAula;
				
        -- INNER JOIN Aula as A on CAH.idAula = A.idAula
			-- INNER JOIN Cliente as C on CAH.idCliente = C.idCliente
				-- GROUP BY  A.Nome, CAH.idCliente
					-- ORDER BY A.Nome DESC;
                    
SELECT * FROM Top10ClientesFromEachAula;