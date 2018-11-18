Use Npng;

-- Procedure -> Usar mais para quando remover cliente, também eliminar pacotes and stuff like that
-- View -> Para obtermos resultados sem dar parametros
-- Function -> Retorna valores , basicamente tudo oque quereremos observar para um determinado fator é através de funções
-- Trigger -> Por exemplo , quando insiro Pacotes , o Pacote tem que vir associado com aulas ou não ..etc


-- Quais os clientes que frequentaram aulas num certo horário? Function Done
Select C.Nome From Cliente as C where idCliente in 
     ( select  CP.idCliente from Aula_tem_Horário as AH  
		inner join Aula as A 
			on A.idAula = AH.idAula
				inner join Pacote_tem_Aula as PA
					on A.idAula = PA.idAula
						inner join Cliente_tem_Pacote as CP
							on CP.idPacote = PA.idPacote 
								where AH.Horário_inicio = '2017-01-01 10:00:00' and AH.Horário_Fim = '2017-01-06 10:00:00' ); 


-- Quais as aulas que foram dadas num certo horário? Function
Select A.Nome From Aula as A 
	inner join (select idAula From Aula_tem_Horário where Horário_Inicio = '2017-01-01 10:00:00' and Horário_Fim = '2017-01-01 20:00:00') as H on A.idAula = H.idAula;


-- Quais o clientes que tiveram a aula X  num certo horário E num certo dia da semana? Function
Select * From Cliente as C where idCliente in
	(select idCliente from Cliente_tem_Pacote where idPacote in
		(select CP.idPacote from Aula_tem_Horário as AH 
			inner join Pacote_tem_Aula as PA on AH.idAula = PA.idAula
				inner join Cliente_tem_Pacote as CP on CP.idPacote = PA.idPacote
					where  AH.Horário_Inicio = '2017-01-01 10:00:00' and AH.Horário_Fim = '2017-01-01 20:00:00'));
    


-- Quais as aulas disponíveis a um cliente X? Function
Select A.Nome , A.Descrição from Aula as A where idAula in 
	( select PA.idAula from Pacote_tem_Aula as PA where idPacote in
		(select CP.idPacote from Cliente_tem_Pacote as CP where CP.idCliente = 1));
	
    

-- Quais os personal trainer que o cliente X teve? Function
Select C.Nome , C.Nif , F.Nome,  C_teve_PT.Reclamação from Cliente as C 
	inner join Cliente_teve_Personal_Trainer as C_teve_PT 
		on C_teve_PT.idCliente = C.idCliente
			inner join Personal_Trainer as PT 
				on PT.idFuncionário = C_teve_PT.idPersonal_Trainer
					inner join Funcionário as F 
						on F.idFuncionário = PT.idFuncionário
							where C.idCliente = 1;




Select C.Nome , A.Nome , Ar.Justificação from Cliente as C 
	inner join Plano_de_Treino as PT 
		on PT.idPlano_de_Treino = C.idPlano_de_Treino
			inner join AulasRecomendadas as AR 
				on AR.idPlano_de_Treino = PT.idPlano_de_Treino
					inner join Aula as A
						on A.idAula = AR.idAula
							where C.Nome = "André Guilherme";

-- Quais os funcionários que trabalharam quando o clinte X esteve no ginásio no dia Y?

 -- 

-- Quais os funcionários que deram aulas ao cliente X num intervalo de tempo de Y a Z? 
Select  F.Nome , F.Categoria , F.Email From Aula as A 
	inner join (select * From Aula_tem_Horário where Horário_Inicio <= '2017-01-01 10:0:00' and Horário_Fim >=  '2017-01-01 10:00:00') as AH
		on A.idAula = AH.idAula -- vejo quais as aulas que foram dadas naquele tempo
			inner join Personal_Trainer as PT 
				on PT.idFuncionário = A.idPersonal_Trainer
					inner join Funcionário as F
						on F.idFuncionário = PT.idFuncionário
							inner join Pacote_tem_Aula as PA 
								on PA.idAula = A.idAula
									inner join Cliente_tem_Pacote as CP
										on CP.idPacote = PA.idPacote
											inner join Cliente as C
												on C.idCliente = CP.idCliente
													where C.Nome = "André Guilherme"; 

-- Quais as aulas que foram dadas pelo funcionário com mais classificação de X a Y? -- Procedure ALMOST

-- Quantos pacotes tem o ginasio disponiveis? Function DONE

-- Adicionar um pacote a um cliente X -- Procedure