USE Npng;

DROP VIEW IF EXISTS `DadosDePlanosDeTreinoDeClientes`;
CREATE VIEW `DadosDePlanosDeTreinoDeClientes` as
	SELECT C.idCliente, C.Nome, PDT.Idade, PDT.Peso, PDT.Altura, PDT.Metabolismo from Cliente as C 
		INNER JOIN Plano_de_Treino as PDT on C.idPlano_de_Treino = PDT.idPlano_de_Treino;
			
	
SELECT * FROM DadosDePlanosDeTreinoDeClientes;