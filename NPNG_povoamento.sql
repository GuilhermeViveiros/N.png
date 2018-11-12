-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Lincenciatura em Ciências da Computação
-- Unidade Curricular de Bases de Dados
-- 2017/2018
--
-- Caso de trabalho : Ginásio intitulado No Pain No Gain(N.png)
-- Povoamento parcial da base de dados.

-- Base de dados de trabalho
USE NPNG;


        
-- Povoamento da tabela "Cliente"
INSERT INTO Cliente
    (idCliente,Nome,Nif)
    VALUES
        ("André Guilherme","123123123"),
        ("César Augusto","111222333"),
        ("Discipulo","333222111"),
        ("Angelo André Castro Sousa","101202303"),
        ("Mini j","123456789"),
        ("Marco Dantas","123123789"),
        ("Carlos Alonso","433214321"),        
 		("Daniel GangaMen","111212124"),
 		("Gandalf","999999999"),
 		("Frodo Baggins","111111111"),
 		("Julio Cesar","987654321"),
 		("Graca Solha","398745613"),
 		("Nuno Valente","200123123"),
		("Aragorn","243214321"),
		("Smeagol","123123666"),
		("Gollum","666666666");



-- Povoamento da tabela "Funcionário"

INSERT INTO Funcionário
    (Categoria,Email,Nome,Número)
    VALUES
			("Personal_Trainer","aviveiros2012@gmail.com","Guilherme o Guerreiro","924546234"),
			("Nutricionista","aviveiros2011@gmail.com","Alberto Costa","923246234"),
			("Limpeza","a@gmail.com","Joaquina Freida","924546664"),
			("Limpeza","madeira12@gmail.com","Jesus o Belo","924545534"), 
			("Limpeza","avi2012@gmail.com","Mateus Ferreira da Silva","911546234"),
			("Limpeza","avi@gmail.com","Guilherme Andrade","923456234"),       
            ("Personal_Trainer","vieiros@gmail.com","Fransisco João da Cunha","912345234"),
			("Personal Trainer","songoku@gmail.com","Goku","911122333"),
			("Personal Trainer","vegeta@gmail.com","Vegeta","9212312312"),
			("Limpeza","maria@gmail.com","Dona Maria","921212121");

-- Povoamento da tabela "Aula"
INSERT INTO Aula
    (Nome, Descrição , Lotação ,idPersonal_Trainer)
    VALUES
        ("Cycling","Aula em bicicleta",10,5),
        ("Spinning","Aula de spinning",20,9),
        ("Running","Corrida coletiva",15,5),
        ("Pilates","Aula de Pilates",4,9),
		("Karaté","Aula para defesa pessoal",20,5),
		("Kick-Box","Aula para defesa pessoal",22,5),
		("Judo","Aula para controlo de mente",14,5); 

-- Povoamento da tabela "Máquina"

INSERT INTO Máquina 
    (Nome,Descrição)
    VALUES
        ("Supino reto","Ajuda a fortalecer o peito"),
        ("Supino inclinado","Ajuda a fortalecer o peito"),
        ("Leg Press","Ajuda a fortalecer as pernas"),
        ("Multi-Task","Ajuda a fortalecer bíceps e tríceps"),
		("Remo","Ajuda a fortalecer a resistência, máquina para aquecimento"),
        ("Deep","Ajuda no peito inferior e tríceps"),
        ("Passadeira","Ajuda a fortalecer a resistência"),
        ("Curls","Ajudam a fortalecer os bíceps"),
		("Bicicleta","Ajuda a fortalecer a resistência");



INSERT INTO Pacote
    (Nome,id_Personal_Trainer,id_Nutricionista,idCliente,Horário_Inicio,Horário_Fim)
    VALUES
        ("Full Pack",5,6,1,'2017-01-01 10:00:00','2018-01-01 10:00:00');
        
        ("Medium Pack",5,6,2,'2017-01-01 10:00:00','2017-01-06 10:00:00'),
		("Single Pack",NULL,NULL,3,'2018-01-01 10:00:00','2018-01-01 13:00:00');
        

-- YYYY-MM-DD HH:MM:SS
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


INSERT INTO Contactos
        (Telemóvel,idCliente,Email,Skype)
       VALUES
            (926790525,1,"aviveiros2012@gmail.com","Guilherme...Madeira"),
            (926888525,2,"cesarAugusto@gmail.com","Césarlb"),
			(965143652,4,"angeloSousa@hotmail.com","AngSousa"),
            (966585445,3,"discupulo88@yahoo.com", "Discipulo");

select *from cliente;

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

-- Povoamento da tabela "Personal_Trainer"
INSERT INTO Personal_Trainer
        (idFuncionário,Classificação)
       VALUES
           (5,5),
           (9,3);


INSERT INTO Pacote_Tem_Horário_Para_Musculação
    (idPacote,idCliente,Horário_Inicio,Horário_Fim,Horário_Dia)
    VALUES
        (6,5,'10:00:00','20:00:00',"Segunda");



-- INSERT INTO

-- INSERT INTO

-- INSERT INTO

-- INSERT INTO








