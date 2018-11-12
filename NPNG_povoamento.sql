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

SELECT Cliente.Nome , Pacote.Nome , P.Horário_Dia FROM Cliente join Pacote
		On Cliente.idCliente = Pacote.idCliente
		join Pacote_Tem_Horário_Para_Musculação as P
        where P.Horário_Dia = "Segunda";
        
SELECT *FROM Cliente;
SELECT *FROM Funcionário;
SELECT *FROM Aula;
SELECT *FROM Máquina;
SELECT *FROM Pacote;



-- Povoamento da tabela "Cliente"
INSERT INTO Cliente
	(Nome)
	VALUES 
		("André Guilherme"),
		("César Augusto"),
		("Discipulo"),
		("Angelo André Castro Sousa"),
		("Mini j"),
		("Marco Dantas"),
		("Carlos Alonso"),
		("Daniel GangaMen");

-- Povoamento da tabela "Funcionário"
INSERT INTO Funcionário
	(Horário_Inicio , Horário_Fim , Horário_Dia,Categoria,Email,Nome,Número)
	VALUES 
		('8:00:00','10:00:00',"Segunda","Personal_Trainer","aviveiros2012@gmail.com","Guilherme o Guerreiro","924546234"),
		('10:00:00','14:00:00',"Terça","Nutricionista","aviveiros2011@gmail.com","Alberto Costa","923246234"),
		('10:00:00','15:00:00',"Quarta","Limpeza","a@gmail.com","Joaquina Freida","924546664"),
		('15:00:00','22:00:00',"Quinta","Limpeza","madeira12@gmail.com","Jesus o Belo","924545534"),
		('16:00:00','20:00:00',"Sexta","Limpeza","avi2012@gmail.com","Mateus Ferreira da Silva","911546234"),
		('19:00:00','22:00:00',"Terça","Limpeza","avi@gmail.com","Guilherme Andrade","923456234"),
		('20:00:00','22:00:00',"Segunda","Personal_Trainer","vieiros@gmail.com","Fransisco João da Cunha","912345234");


-- Povoamento da tabela "Aula"
INSERT INTO Aula
	(Nome, Descrição , Lotação ,idFuncionário)
	VALUES 
		("Cycling","Aula em bicicleta",10,5),
		("Spinning","Aula de spinning",20,6),
		("Running","Corrida coletiva",15,7),
		("Pilates","Aula de Pilates",4,8);

INSERT INTO Máquina
	(Nome,Descrição,Lotação)
	VALUES
		("Supino reto","Ajuda a fortalecer o peito",1),
		("Supino inclinado","Ajuda a fortalecer o peito",1),
		("Leg Press","Ajuda a fortalecer as pernas",1),
		("Multi-Task","Ajuda a fortelecer biceps e triceps",4);

INSERT INTO Pacote
	(Nome,idCliente,Personal_Trainer,Nutricionista)
	VALUES 
		("Full Pack",5,9,6),
		("Medium Pack",6,9,6);

INSERT INTO Horário
		(Inicio,Fim,Dia)
        VALUES
			('10:00:00','20:00:00',"Segunda"),
            ('12:10:00','17:30:00',"Quarta"),
			('8:00:00','10:00:00',"Segunda"),
			('10:00:00','14:00:00',"Terça"),
			('10:00:00','15:00:00',"Quarta"),
			('15:00:00','22:00:00',"Quinta"),
			('16:00:00','20:00:00',"Sexta"),
			('19:00:00','22:00:00',"Terça"),
			('20:00:00','22:00:00',"Segunda");
            

INSERT INTO Contactos
		(Telemóvel,idCliente,Email,Skype)
        VALUES
			(926790525,6,"aviveiros2012@gmail.com","Guilherme...Madeira"),
            (926888525,7,"cesarAugusto@gmail.com","Césarlb");


INSERT INTO Morada
		(Rua,Nº_porta,idCliente)
        VALUES
			("Rua das Teixeiras",4,6);

INSERT INTO Personal_Trainer
		(idFuncionário,Classificação)
        VALUES 
			(5,5), 
            (9,3);


SELECT *FROM Pacote;
SELECT *FROM Horário;
SELECT *FROM Pacote_Tem_Horário_Para_Musculação;
SELECT *FROM Funcionário;

INSERT INTO Pacote_Tem_Horário_Para_Musculação
	(idPacote,idCliente,Horário_Inicio,Horário_Fim,Horário_Dia)
	VALUES
		(6,5,'10:00:00','20:00:00',"Segunda");


-- INSERT INTO

-- INSERT INTO

-- INSERT INTO

-- INSERT INTO
