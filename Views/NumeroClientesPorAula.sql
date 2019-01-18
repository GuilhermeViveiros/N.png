USE Npng;

DROP VIEW IF EXISTS `NumeroClientesPorAula`;
CREATE VIEW `NumeroClientesPorAula` AS
	SELECT A.idAula, A.Nome, QuantosCLientesNaAula(A.idAula, Horário_Inicio, Horário_Fim) as NClientes, 
	AH.Horário_Inicio as InicioDaAula FROM Aula as A
		INNER JOIN Aula_tem_Horário as AH ON A.idAula = AH.idAula 
			ORDER BY NClientes Desc;
SELECT * FROM NumeroClientesPorAula;