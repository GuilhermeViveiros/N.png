CREATE TRIGGER remMáquina AFTER DELETE ON Máquina
	For each row 
		DELETE From Plano_de_Treino_Recomenda_Máquina
			where OLD.idMáquina = idMáquina;
            
-- SELECT * FROM Máquina;
-- SELECT * FROM Plano_de_Treino_Recomenda_Máquina;