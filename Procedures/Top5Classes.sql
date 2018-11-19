CREATE DEFINER=`root`@`localhost` PROCEDURE `Top5Classes`(X DateTime , Y DateTime)
BEGIN
	Select A.Nome , count(0) from Aula as A
	inner join (select * from Aula_tem_Horário  where Horário_inicio = '2017-01-01 10:00:00' and Horário_Fim = '2017-01-06 10:00:00'   ) as AH
		on AH.idAula = A.idAula
			inner join Pacote_tem_Aula as Pa
				on A.idAula = Pa.idAula
					inner join Cliente_tem_Pacote as CP
						on CP.idPacote = Pa.idPacote
							inner join Cliente as C
								on C.idCliente = CP.idCliente
									group by A.idAulA
										order by count(0) desc
											limit 5;
END