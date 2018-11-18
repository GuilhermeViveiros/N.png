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
			(1,"Personal_Trainer","aviveiros2012@gmail.com","Guilherme o Guerreiro","924546234"),
			(2,"Nutricionista","aviveiros2011@gmail.com","Alberto Costa","923246234"),
			(3,"Limpeza","a@gmail.com","Joaquina Freida","924546664"),
			(4,"Limpeza","madeira12@gmail.com","Jesus o Belo","924545534"), 
			(5,"Limpeza","avi2012@gmail.com","Mateus Ferreira da Silva","911546234"),
			(6,"Limpeza","avi@gmail.com","Guilherme Andrade","923456234"),       
            (7,"Personal_Trainer","vieiros@gmail.com","Fransisco João da Cunha","912345234"),
			(8,"Personal Trainer","songoku@gmail.com","Goku","911122333"),
			(9,"Personal Trainer","vegeta@gmail.com","Vegeta","9212312312"),
			(10,"Limpeza","maria@gmail.com","Dona Maria","921212121");


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
		(1, 5),
        (7, 3),
        (8, 7),
        (9, 8);
        
        
-- Povoamento da tabela Pacote
INSERT INTO Pacote
    (idPacote,Nome,id_Personal_Trainer,id_Nutricionista)
    VALUES
        (1,"Full Pack",1,6),
        (2,"Medium Pack",8,6),
		(3,"Single Pack",NULL,NULL);

	
-- Povoamento do Plano_de_Treino
INSERT INTO Plano_de_Treino
	(Idade,Peso,Altura,Metabolismo,Objetivos,idPlano_de_Treino)
    VALUES
		(20,100,198,"Endomorfo","Perda de peso",1),
		(20,70,187,"Ectomorfo","Ganho de massa muscular",2),
		(20,50,180,"Mesomorfo","Perda de massa gorda",3);
        
-- Povoamento da tabela "Cliente"
INSERT INTO Cliente
    (idCliente,Nome,Nif,idPlano_de_Treino)
    VALUES
        (1,"André Guilherme","123123123",1),
        (2,"César Augusto","111222333",1),
        (3,"Discipulo","333222111",1),
        (4,"Angelo André Castro Sousa","101202303",1),
        (5,"Mini j","123456789",2),
        (6,"Marco Dantas","123123789",2),
        (7,"Carlos Alonso","433214321",2),        
 		(8,"Daniel GangaMen","111212124",2),
 		(9,"Gandalf","999999999",2),
 		(10,"Frodo Baggins","111111111",2),
 		(11,"Julio Cesar","987654321",3),
 		(12,"Graca Solha","398745613",3),
 		(13,"Nuno Valente","200123123",3),
		(14,"Aragorn","243214321",3),
		(15,"Smeagol","123123666",3),
		(16,"Gollum","666666666",3);



-- Povoamento da tabela "Aula"
INSERT INTO Aula
    (idAula, Nome , Descrição , Lotação ,idPersonal_Trainer)
    VALUES
        (1,"Cycling","Aula em bicicleta",10,1),
        (2,"Spinning","Aula de spinning",20,7),
        (3,"Running","Corrida coletiva",15,8),
        (4,"Pilates","Aula de Pilates",4,9),
		(5,"Karaté","Aula para defesa pessoal",20,1),
		(6,"Kick-Box","Aula para defesa pessoal",22,8),
		(7,"Judo","Aula para controlo de mente",14,9); 

INSERT INTO Aula_tem_Horário
	(idAula,Horário_Inicio,Horário_Fim)
    VALUES
		(1,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
		(1,'2017-01-01 10:00:00','2017-01-06 10:00:00'),
		(2,'2018-01-01 10:00:00','2018-01-01 13:00:00'),
		(3,'2017-01-01 10:00:00','2017-01-01 20:00:00'),
		(4,'2017-01-01 12:10:00','2017-01-01 17:30:00');
    

INSERT INTO AulasRecomendadas
	(idPlano_de_treino , idAula, Justificação)
    VALUES
		(1,1,"Resistencia"),
        (1,2,"Resistencia");
		
	
-- Povoamento da tabela "Horário"
INSERT INTO Horário
        (Inicio,Fim)
       VALUES
			('2017-01-01 10:00:00','2018-01-01 10:00:00'),
            ('2017-01-01 10:00:00','2017-01-06 10:00:00'),
            ('2018-01-01 10:00:00','2018-01-01 13:00:00'),
            ('2017-01-01 10:00:00','2017-01-01 20:00:00'),
            ('2017-01-01 12:10:00','2017-01-01 17:30:00'),
            ('2017-01-01 08:00:00','2017-01-01 10:00:00'),
            ('2017-01-02 10:00:00','2017-01-02 14:00:00'),
            ('2017-01-02 10:00:00','2017-01-02 15:00:00'),
            ('2017-01-02 15:00:00','2017-01-02 22:00:00'),
            ('2017-01-02 16:00:00','2017-01-02 20:00:00'),
            ('2017-01-02 19:00:00','2017-01-02 22:00:00'),
            ('2017-01-02 20:00:00','2017-01-02 22:00:00');


-- Povoamento da tabela Cliente_tem_Pacote
INSERT INTO Cliente_tem_Pacote
	(idCliente,idPacote,Data_inicial,Data_final)
    VALUES
		(1,1,'2017-01-01 10:00:00','2018-01-01 10:00:00'),
        (2,2,'2017-01-01 10:00:00','2017-01-06 10:00:00'),
        (3,3,'2018-01-01 10:00:00','2018-01-01 13:00:00');
        

-- Povoamento da tabela Contactos
INSERT INTO Contactos
        (Telemóvel,idCliente,Email)
       VALUES
            (926790525,1,"aviveiros2012@gmail.com"),
            (926888525,2,"cesarAugusto@gmail.com"),
			(965143652,4,"angeloSousa@hotmail.com"),
            (966585445,3,"discupulo88@yahoo.com");
            
-- Povoamento da tabela Morada
INSERT INTO Morada
        (Rua,Nº_porta,idCliente,Localidade)
       VALUES
            ("Rua das Teixeiras",21,1, "Braga"),
			("Rua dos Compinchas",5,2, "Porto"),
            ("Rua da Maria",32,3, "Lisboa"),
            ("Terra Nostra",4,4, "Alen"),
			("Rua Sequeiros",23,4,"Porto"),
			("Praça da liberdade",55,5,"Viana do Castelo"),
			("Reta Traseira",123,6,"Aveiro"),
			("Avenida dos Corvos",22,7,"Leiria"),
			("Isengard",1,8,"Terra Media"),
			("Shire",78,9,"Terra Media"),
			("colina de palantino",1,10,"Roma"),
			("rua afonsina",888,11,"Porto"),
			("rua afonsina",888,12,"Porto"),
			("Minas Tirith",1,13,"Terra Media"),
			("Shire",13,14,"Terra Media"),
			("Mordor",1,14,"Terra Media");


-- Povoamento da tabela Pacote_Tem_Horário_Para_Musculação
INSERT INTO Pacote_Tem_Horário_Para_Musculação
    (idPacote,Horário_Inicio,Horário_Fim)
    VALUES
        (1,'2017-01-01 10:00:00','2018-01-01 10:00:00');


INSERT INTO Pacote_tem_Aula
	(idPacote,idAula)
	VALUES
	(1,1),(1,2),(1,3),(1,4),(1,5),
    (2,1),(2,3),(2,6);
            
            
INSERT INTO Cliente_teve_Personal_Trainer
	(idCliente,idPersonal_Trainer,reclamação)
    VALUES
    (1,7,"Esteve sempre distraído"),
    (1,8,"Não havia motivação sufeciente"),
    (1,9,"Simplesmente era feio"),
    (2,7,"Está sempre distraído");
            
	
call criarHorarios('2018-01-01',date(now()));

drop procedure criarHorarios;


delete from Horário where 0 = 0;
SELECT * FROM Horário;
			
		







