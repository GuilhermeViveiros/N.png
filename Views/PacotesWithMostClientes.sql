Use Npng;
-- César

DROP VIEW IF EXISTS `PacotesWithMostClientes`;
CREATE VIEW `PacotesWithMostClientes` AS
	SELECT P.Nome, sum(NClientes) FROM Pacote as P 
		INNER JOIN (SELECT idPacote, count(idCliente) as NClientes FROM Cliente_tem_Pacote
			Group By idPacote) as PC on P.idPacote = PC.idPacote
		Group by P.Nome
        ORDER BY sum(NClientes) DESC;
        
-- insert into  Pacote VALUES (4,"Full Pack",10,1,20);
-- INSERT INTO Cliente_tem_Pacote
	-- (idCliente,idPacote,Data_inicial,Data_final)
    -- VALUES
		-- (1,4,'2018-01-01 10:00:00','2018-03-01 10:00:00');
-- SELECT * FROM PacotesWithMostClientes;