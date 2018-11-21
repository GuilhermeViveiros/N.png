Drop procedure IF EXISTS `ClassesWithSchedule`;

DELIMITER %%
CREATE PROCEDURE `ClassesWithSchedule` (X DateTime , Y DateTime)
BEGIN
	Select A.Nome From Aula as A 
		inner join (select idAula From Aula_tem_Horário where Horário_Inicio =  X and Horário_Fim = Y) as H on A.idAula = H.idAula;
END %%
DELIMITER ;