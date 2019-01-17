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

-- Quais as aulas que um cliente tem num certo horário
call ShowClassesFromClientsWithSchedule(1, '2018-11-08 10:00:00' , '2018-11-08 12:00:00' );


-- Quais as aulas que foram dadas num certo horário? Function
call ClassesWithSchedule('2017-01-01 10:00:00' , '2017-01-06 10:00:00');


-- Quais o clientes que tiveram a aula X  num certo horário Y 
call ClientsWithClassWithSchedule(2,'2018-11-08 10:00:00' , '2018-11-08 12:00:00');


-- Quais as aulas disponíveis a um cliente X
call ClassesOfClient(1);
	
    

-- Quais os personal trainer que o cliente X teve
call ClientHadPersonalTrainer(1);


-- Quais os funcionários que deram aulas ao cliente X num intervalo de tempo de Y a Z
call EmployesWithScheduleWithClients(1,'2017-01-01 10:00:00' , '2017-01-01 20:00:00');




-- Qual as top 5 aulas num certo intervalo de tempo
call Top5Classes('2017-01-01 10:00:00', '2017-01-06 10:00:00' );



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

-- Quais as aulas que haverá num intervalo de 7 dias
SELECT * FROM AulasNaProximaSemana;

-- Quais os clientes que não possuem pacotes válidados atualemte
SELECT * FROM ClientesSemPacoteAtual;

-- Mostra todos os clientes que têm PTs atualmente
SELECT * FROM ClientesWithPersonalTrainer;

-- Mostra todos os dados de planos de Treino de todos os clientes
SELECT * FROM DadosDePlanosDeTreinoDeClientes;

-- Mostra os pacotes que têm mais clientes por ordem decrescente de numero
SELECT * FROM PacotesWithMostClientes;

-- Mostra os top5 clientes que mais gastaram no ginásio
SELECT * FROM Top5Clientes;

-- Mostra o top10 de clientes que mais foram às aulas
select * FROM Top10ClientesAula;

-- Mostra o numero de clientes que foram a todas as aulas, !!!!!!!!!! por em procedure
SELECT * FROM NumeroClientesPorAula
