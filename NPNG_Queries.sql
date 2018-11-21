Use Npng;

SET SQL_SAFE_UPDATES = 0;

-- SELECT * FROM Cliente;
-- SELECT * FROM Cliente_teve_Personal_Trainer;
-- delete from Cliente where idCliente = 1;

-- SELECT * FROM Aula where idPersonal_Trainer = 8;
-- SELECT * FROM Personal_Trainer where idFuncionário = 8;
-- SELECT * FROM Pacote where id_Personal_Trainer = 8;
-- SELECT * FROM Funcionário where idFuncionário = 8;
-- DELETE FROM Personal_Trainer where idFuncionário = 8;

-- Procedure -> Usar mais para quando remover cliente, também eliminar pacotes and stuff like that
-- View -> Para obtermos resultados sem dar parametros
-- Function -> Retorna valores , basicamente tudo oque quereremos observar para um determinado fator é através de funções
-- Trigger -> Por exemplo , quando insiro Pacotes , o Pacote tem que vir associado com aulas ou não ..etc

-- Uma função apenas devolve STRING <> INTEGER <> REAL <> DECIMAL

-- ---------------------------------------------------------------------------------------Procedures -------------------------------------------------------------------------------------------------------------------------------

-- Quais os clientes que teem aulas num certo horário
call ShowClassesFromClientsWithSchedule(1, '2017-01-01 10:00:00' , '2017-01-06 10:00:00' );


-- Quais as aulas que foram dadas num certo horário? Function
call ClassesWithSchedule('2017-01-01 10:00:00' , '2017-01-06 10:00:00');


-- Quais o clientes que tiveram a aula X  num certo horário Y num certo dia da semana? Function
call ClientsWithClassWithSchedule(1,1,'2017-01-01 10:00:00' , '2017-01-06 10:00:00');
    


-- Quais as aulas disponíveis a um cliente X
call ClassesOfClient(1);
	
    

-- Quais os personal trainer que o cliente X teve
call ClientHadPersonalTrainer(1);


-- Quais os funcionários que deram aulas ao cliente X num intervalo de tempo de Y a Z
call EmployesWithScheduleWithClients(1,'2017-01-01 10:00:00' , '2017-01-01 20:00:00');




-- Qual as top 5 aulas num certo intervalo de tempo
call Top5Classes('2017-01-01 10:00:00', '2017-01-06 10:00:00' );



-- Quais as 5 aulas que foram dadas pelo funcionário com mais classificação de X a Y
-- Versão do sql não suporta este tipo de subquerrys ???
Select * from Aula as A where idPersonal_Trainer in
	(Select F.idFuncionário  from Personal_Trainer as PT  -- estou a chamar o PT com melhor classificação noutra funcção (ver view)
		inner join Funcionário as F 
			on F.idFuncionário = PT.idFuncionário
				order by PT.Classificação desc
					limit 1)
						limit 5;


-- Adicionar um pacote a um cliente x
-- Necessário um id do cliente, id do Pacote , data de inicio e data final Id Int
call AddPackageForClient(x,x,x,x);




-- ---------------------------------------------------------------------------------------Triggers -------------------------------------------------------------------------------------------------------------------------------

-- Sempre que apagamos uma apagmos algo apagar tudo oque tem haver com isso

-- Cliente
-- Aula
-- Pacote
-- Plano de Treino
-- Máquina

-- ---------------------------------------------------------------------------------------Views -------------------------------------------------------------------------------------------------------------------------------
-- Qual os top 5 Personal Trainers que dao mais aulas
select * from Top5PT;

-- Quantos pacotes tem o ginasio disponiveis Function
Select Count(0) From Pacote;

-- Qual o funcionário com a melhor classificação 
Select * From PtWithBetterPoints;
