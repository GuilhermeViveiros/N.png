CREATE VIEW `PtWithBetterPoints` AS
	Select  F.idFuncionário  from Personal_Trainer as PT 
		inner join Funcionário as F 
			on F.idFuncionário = PT.idFuncionário
				order by PT.Classificação desc
					limit 1;