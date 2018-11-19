CREATE VIEW `Top5PT` AS
	Select F.Nome , count(0) from Aula as A
		inner join Personal_Trainer as PT
			on PT.idFuncionário = A.idPersonal_Trainer
				inner join Funcionário as F
					on F.idFuncionário = PT.idFuncionário
						group by F.Nome
							order by count(0) desc
								limit 5;
