-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Lincenciatura em Ciências da Computação
-- Unidade Curricular de Bases de Dados
-- 2017/2018
--
-- Caso de trabalho : Ginásio intitulado No Pain No Gain(N.png)
-- Povoamento parcial da base de dados.

SET SQL_SAFE_UPDATES = 0;

-- Base de dados de trabalho
USE Npng;



-- Povoamento da tabela "Funcionário"
INSERT INTO Funcionário
    (idFuncionário,Categoria,Email,Nome,Número)
    VALUES
		(1,"Nutricionista","alberto@costa.com","Alberto Costa","922790030"),
		(2,"Rececionista","joaquinaF@gmail.com","Joaquina Freida","924546664"),
		(3,"Rececionista","job@hotmail.com","Jesus o Belo","917408289"), 
		(4,"Rececionista","lilisasilva@live.com","Liliana da Silva","925461860"),
		(5,"Limpeza","jandrade@gmail.com","Joana Andrade","914763669"),
		(6,"Limpeza","carlos@gmail.com","Carlos Silva","927783669"),
		(7,"Personal_Trainer","aviveiros2012@gmail.com","Guilherme Guerreiro","924546234"),
		(8,"Personal_Trainer","francisco@cunha.com","Fransisco Cunha","927616601"),
		(9,"Personal Trainer","maria_machado@Machadolda.com","Madalena Machado","911122333"),
		(10,"Personal Trainer","jrsm@macedos.pt","José Macedo","917815023"),
        (11,"Manutenção","faztudo24h@gmail.com","Luís Faztudo","915647999"),
        (12,"Gestor","oliveira@hotmail.com","Bruno Oliveira","927770000");
        


-- Povoamento da tabela "Máquina"
INSERT INTO Máquina 
    (idMáquina, Nome, Descrição)
    VALUES
        (1,"Supino reto","Ajuda a fortalecer o peito"),
        (2,"Supino inclinado","Ajuda a fortalecer o peito"),
        (3,"Leg Press","Ajuda a fortalecer as pernas"),
        (4,"Multi-Task","Ajuda a fortalecer bíceps e tríceps"),
		(5,"Remo","Ajuda a fortalecer a resistência, máquina para aquecimento"),
        (6,"Deep","Ajuda no peito inferior e tríceps"),
        (7,"Passadeira","Ajuda a fortalecer a resistência"),
        (8,"Curls","Ajudam a fortalecer os bíceps"),
		(9,"Bicicleta","Ajuda a fortalecer a resistência");


-- Povoamento da tabela "Personal_Trainer"
INSERT INTO Personal_Trainer
	(idFuncionário, Classificação)
    VALUES
        (7, 5),
        (8, 4),
        (9, 8),
        (10, 7);
        

-- Povoamento da tabela Pacote
INSERT INTO Pacote
    (idPacote,Nome,id_Personal_Trainer,id_Nutricionista, Preço)
    VALUES
        (1,"Full Pack",10,1,20),
        (2,"Medium Pack",8,1,15),
		(3,"Single Pack",NULL,NULL,10);

	
-- Povoamento do Plano_de_Treino
INSERT INTO Plano_de_Treino
	(Idade,Peso,Altura,Metabolismo,Objetivos,idPlano_de_Treino)
    VALUES
		(20,100,198,"Endomorfo","Perda de peso",1),
		(20,70,187,"Ectomorfo","Ganho de massa muscular",2),
		(20,80,178,"Mesomorfo","Perda de massa gorda",3);


-- Povoamento da tabela Plano_de_Treino_Recomenda_Máquina
INSERT INTO Plano_de_Treino_Recomenda_Máquina
	(idPlano_de_Treino,idMáquina,Justificação)
    Values
		(1,5,"Queima gordura e aumenta o cardio"),
		(1,7,"Queima gordura e aumenta o cardio"),
		(1,9,"Queima gordura e aumenta o cardio"),
		(2,1,"Aumento na massa muscular"),
		(2,2,"Aumento na massa muscular"),
		(2,3,"Aumento na massa muscular"),
		(2,4,"Aumento na massa muscular"),
		(2,6,"Aumento na massa muscular"),
		(2,8,"Aumento na massa muscular"),
		(3,1,"Substitui massa gorda por muscular"),
		(3,3,"Substitui massa gorda por muscular"),
		(3,4,"Substitui massa gorda por muscular"),
		(3,6,"Substitui massa gorda por muscular"),
		(3,5,"Queima gordura e aumenta o cardio"),
		(3,7,"Queima gordura e aumenta o cardio");


-- Povoamento da tabela "Cliente"
INSERT INTO Cliente
    (idCliente,Nome,Nif,idPlano_de_Treino)
    VALUES
        (1,"André Guilherme","240123113",1),
        (2,"César Augusto","251218194",1),
        (3,"Discipulo","256466747",1),
        (4,"Angelo Sousa","240512003",1),
        (5,"Fernada Silva","258312652",2),
        (6,"Marco Dantas","251250536",2),
        (7,"Carlos Castro","255752212",2),        
 		(8,"Daniel Apelido","240588318",2),
 		(9,"Julia Freitas","255380817",2),
 		(10,"João Andrade","250406451",2),
 		(11,"Julio Cesar","255383679",3),
 		(12,"Graca Solha","244328031",3),
 		(13,"Mariana Ferreira","258496851",3),
		(14,"Nunu Valente","243214321",3),
		(15,"Sofia Teixeira","257841348",3),
		(16,"Maria Rodrigues","249313497",3);


-- Povoamento da tabela Contactos
INSERT INTO Contactos 
	(idCliente,Telemóvel) 
    VALUES
            (1,926790525),-- "viveiros@gmail.com"),
            (2,926888525),-- "cesarAugusto@gmail.com"),
			(3,966585445),-- "discipulo88@yahoo.com"),
            (4,965143652),-- "angeloSousa@hotmail.com"),
            (5,923395959),-- "fernada@silva.com"),
            (6,922819157),-- "marco@bichao.com"),
            (7,932032329),-- "cpac@castro.com.pt"),
            (8,917161409),-- "daniel@gmail.com"),
            (9,916471122),-- "julia@freitas.com"),
            (10,917329235),-- "joao@andrade.com"),
            (11,921224028),-- "julio@cesar.jc"),
            (12,918923558),-- "graca@solha.br"),
            (13,965969174),-- "mariana@ferreira.es"),
            (14,968427945),-- "nunu@valente.pt"),
            (15,926568225),-- "sofia@teixeira.com"),
            (16,914523051);-- "maria@rodrigues.pt");


-- Povoamento da tabela "Aula"
INSERT INTO Aula
    (idAula, Nome , Descrição , Lotação ,idPersonal_Trainer)
    VALUES
        (1,"Cycling","Aula em bicicleta",10,10),
        (2,"Spinning","Aula de spinning",20,7),
        (3,"Running","Corrida coletiva",15,8),
        (4,"Pilates","Aula de Pilates",4,9),
		(5,"Karaté","Aula para defesa pessoal",20,10),
		(6,"Kick-Box","Aula para defesa pessoal",22,8),
		(7,"Judo","Aula para controlo de mente",14,9); 


-- Povoamento da tabela "Horário"
-- Povoamento da tabela "Funcionário_tem_Horário"
-- Povoamento da tabela "Pacote_Tem_Horário_Para_Musculação"

-- Povoamento da tabela Aula_tem_Horário
-- Povoamento da tabela Cliente_frequentou_Aula_com_Horário
call criarHorarios(DATE_ADD(date(now()), INTERVAL -1 WEEK), DATE_ADD(date(now()), INTERVAL 3 WEEK));
    

-- Povoamento da tabela "AulasRecomendadas"
INSERT INTO AulasRecomendadas
	(idPlano_de_treino , idAula, Justificação)
    VALUES
		(1,1,"Aumento da resistencia"),
        (1,3,"Aumento da resistencia"),
        (2,6,"Aumento da massa muscular"),
        (2,3,"Aumento da resistencia"),
        (3,2,"Aumento da resistencia"),
        (3,3,"Aumento da resistencia");
		
/*
-- Povoamento da tabela Cliente_tem_Pacote
INSERT INTO Cliente_tem_Pacote
	(idCliente,idPacote,Data_inicial,Data_final)
    VALUES
		(1,1,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (2,2,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (3,2,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (4,3,'2018-01-01 10:00:00','2018-01-01 13:00:00'),
        (5,1,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (6,2,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (7,1,'2018-01-01 10:00:00','2018-01-01 13:00:00'),
        (8,3,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (9,2,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (10,1,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (11,3,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (12,3,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (13,1,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (14,3,'2018-01-01 10:00:00','2018-01-01 13:00:00'),
        (15,2,'2018-01-01 10:00:00','2018-01-01 13:00:00'),
        (16,1,'2017-01-01 10:00:00','2018-01-01 10:00:00');*/
            
            
-- Povoamento da tabela Morada
INSERT INTO Morada
        (Rua,Nº_porta,idCliente,Localidade)
       VALUES
            ("Rua das Teixeiras",21,1, "Braga"),
			("Rua dos Compinchas",5,2, "Porto"),
            ("Rua da Maria",32,3, "Lisboa"),
			("Rua Sequeiros",23,4,"Porto"),
			("Praça da liberdade",55,5,"Viana do Castelo"),
			("Reta Traseira",123,6,"Aveiro"),
			("Avenida dos Corvos",22,7,"Leiria"),
			("Rua Pelourinho",58,8,"Termas de Alcafache"),
			("Rua Carne Azeda",117,9,"Aldonça"),
			("Colina de palantino",1,10,"Roma"),
			("Rua afonsina",888,11,"Porto"),
			("Rua Doutor Alfredo Freitas",82,12,"Paços"),
			("Rua Sousa Lopes",30,13,"Lisboa"),
			("Rua Padre António Vieira",3,14,""),
			("Rua Nuno Álvares",19,15,"Gondomar"),
            ("Rua José Rocha",1,16,"Bom Jesus");


-- Povoamento da tabela Cliente_teve_Personal_Trainer		
INSERT INTO Cliente_teve_Personal_Trainer
	(idCliente,idPersonal_Trainer,Justificação)
    VALUES
    (1,8,"Esteve sempre distraído"),
    (1,7,"Não havia motivação suficiente"),
    (1,10,"Simplesmente era feio"),
    (2,8,"Muito distraído");


-- Povoamento da tabela Pacote_tem_Aula
INSERT INTO Pacote_tem_Aula
	(idPacote,idAula)
	VALUES
	(1,1),(1,2),(1,3),(1,4),(1,5),
    (2,1),(2,3),(2,6);

            
	

			
		







