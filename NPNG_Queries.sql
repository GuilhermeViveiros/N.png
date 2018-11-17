Use Npng;

-- Procedure -> Usar mais para quando remover cliente, também eliminar pacotes and stuff like that
-- View -> Para obtermos resultados sem dar parametros
-- Function -> Retorna valores , basicamente tudo oque quereremos observar para um determinado fator é através de funções
-- Trigger -> Por exemplo , quando insiro Pacotes , o Pacote tem que vir associado com aulas ou não ..etc


-- Quais os clientes que frequentaram aulas num certo horário? Function
Select C.idCliente, C.Nome  from Aula as A
	inner join (select * from Aula_tem_Horário where Horário_inicio = '2017-01-01 10:00:00' and Horário_Fim = '2017-01-01 20:00:00') as AH
		on A.idAula = AH.idAula
			inner join Aula_tem_Cliente as AC
				on AC.idAula = AH.idAula
					inner join Cliente as C
						on C.idCliente = AC.idCliente;


-- Quais as aulas que foram dadas num certo horário? Function
Select A.Nome From Aula as A 
	inner join (select idAula From Aula_tem_Horário where Horário_Inicio = '2017-01-01 10:00:00' and Horário_Fim = '2017-01-01 20:00:00') as H on A.idAula = H.idAula;


-- Quais o clientes que tiveram a aula X  num certo horário E num certo dia da semana? Function
Select A.Nome From Aula as A 
	inner join (select idAula From Aula_tem_Horário where Horário_Inicio = '2017-01-01 10:00:00' and Horário_Fim = '2017-01-01 20:00:00') as H on A.idAula = H.idAula
		inner join Aula_tem_Cliente as AC
			on AC.idAula = A.idAula
				inner join (select idCliente From Cliente where idCliente = 1) as C 
					on C.idCliente = AC.idCliente


-- Quais as aulas disponíveis a um cliente X? Function
Select A.Nome from Cliente as C 
	inner join Pacote as P
		on P.idPacote = C.idPacote
			inner join Pacote_tem_Aula as Pa
				on Pa.idPacote = P.idPacote
					inner join Aula as A 
						on A.idAula = Pa.idAula
							where C.idCliente = 1
								order by A.Nome;

-- Quais os personal trainer que o cliente X teve? Function
Select C.Nome , C.Nif , F.Nome,  C_teve_PT.Reclamação from Cliente as C 
	inner join Cliente_teve_Personal_Trainer as C_teve_PT 
		on C_teve_PT.idCliente = C.idCliente
			inner join Personal_Trainer as PT 
				on PT.idFuncionário = C_teve_PT.idPersonal_Trainer
					inner join Funcionário as F 
						on F.idFuncionário = PT.idFuncionário
							where C.idCliente = 1;



-- Quais as aulas recomendadas do cliente X ordenadas por nome ?
Select C.Nome , A.Nome , Ar.Justificação from Cliente as C
	inner join AulasRecomendadas as Ar 
		on Ar.idCliente = C.idCliente 
			inner join Aula as A 
				on A.idAula = Ar.idAula
					where C.nome = "César Augusto"
						order by A.Nome;

-- Quais os funcionários que trabalharam quando o clinte X esteve no ginásio no dia Y?

 -- 

-- Quais os funcionários que deram aulas ao cliente X num intervalo de tempo de Y a Z? 
Select  F.Nome , F.Categoria , F.Email From Aula as A 
	inner join (select * From Aula_tem_Horário where Horário_Inicio <= '2017-01-01 10:0:00' and Horário_Fim >=  '2017-01-01 10:00:00') as AH
		on A.idAula = AH.idAula -- vejo quais as aulas que foram dadas naquele tempo
			inner join ( select * From Aula_tem_Cliente where idCliente = 1) as AC 
				on AC.idAula = A.idAula -- aulas em que o cliente frequentou
					inner join Personal_Trainer as PT 
						on PT.idFuncionário = A.idPersonal_Trainer -- quando tem o nosso PT
							inner join Funcionário as F on F.idFuncionário = PT.idFuncionário; -- Funcionário
	

-- Quais as aulas que foram dadas pelo funcionário com mais classificação de X a Y? -- Procedure ALMOST

-- Quantos pacotes tem o ginasio disponiveis? Function DONE

-- Adicionar um pacote a um cliente X -- Procedure