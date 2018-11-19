CREATE TRIGGER remMáquina AFTER DELETE ON Máquina
	For each row 
		DELETE From Plano_de_Treino_Recomenda_Máquina
			where OLD.idMáquina = idMáquina;
            
-- SELECT * FROM Máquina;
-- SELECT * FROM Plano_de_Treino_Recomenda_Máquina;´


CREATE TRIGGER remPlano_de_Treino AFTER DELTETE ON Plano_de_Treino
	For each row
		Delete From Cliente
			where OLD.idPlano_de_Treino = idPlano_de_Treino
	For each row
		Delete From AulasRecomendadas
			where OLD.idPlano_de_Treino = idPlano_de_Treino
	For each row
		DELETE From Plano_de_Treino_Recomenda_Máquina
			where OLD.idPlano_de_Treino = Plano_de_Treino;

