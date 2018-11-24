DROP VIEW IF EXISTS  `AulasNaProximaSemana`;
CREATE VIEW `AulasNaProximaSemana` AS
	SELECT A.Nome, AH.Horário_Inicio, AH.Horário_Fim FROM Aula as A
		INNER JOIN Aula_tem_Horário as AH on A.idAula = AH.idAula
			where DATE(now()) <= DATE(AH.Horário_Inicio) and
				  ADDDATE(DATE(now()), INTERVAL 7 DAY) >= DATE(AH.Horário_Inicio)
					ORDER BY AH.Horário_Inicio;
						
-- SELECT * FROM `AulasNaProximaSemana`;