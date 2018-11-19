Use Npng;

-- Procedure -> Usar mais para quando remover cliente, também eliminar pacotes and stuff like that
-- View -> Para obtermos resultados sem dar parametros
-- Function -> Retorna valores , basicamente tudo oque quereremos observar para um determinado fator é através de funções
-- Trigger -> Por exemplo , quando insiro Pacotes , o Pacote tem que vir associado com aulas ou não ..etc

-- Uma função apenas devolve STRING <> INTEGER <> REAL <> DECIMAL


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


-- Quais os funcionários que trabalharam quando o clinte X esteve no ginásio no dia Y


-- Quais os funcionários que deram aulas ao cliente X num intervalo de tempo de Y a Z
call EmployesWithScheduleWithClients(1,'2017-01-01 10:00:00' , '2017-01-01 20:00:00');


-- Qual as top 5 aulas com alunos inscritos num ccerto intervalo de tempo

-- Qual os Personal Trainer que dao mais aulas?

-- Quais as aulas que foram dadas pelo funcionário com mais classificação de X a Y? -- Procedure ALMOST

-- Quantos pacotes tem o ginasio disponiveis? Function DONE

-- Adicionar um pacote a um cliente X -- Procedure