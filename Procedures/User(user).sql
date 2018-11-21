USE Npng;

Drop procedure IF EXISTS `Package`;

-- ver Pacote
DELIMITER %%
CREATE PROCEDURE `Package` (x int)
BEGIN
	SELECT * FROM Pacote where idPacote = x;
END %%
DELIMITER ;

Drop procedure IF EXISTS  `TrainningPlan`;
-- Ver plano de treino
DELIMITER %%
CREATE PROCEDURE `TrainningPlan` (x int)
BEGIN
	SELECT PT.Idade ,PT.Peso, PT.Altura, PT.Metabolismo , PT.Objetivos, PT.idPlano_de_Treino FROM Plano_de_Treino  as PT
		inner join Cliente as C
			on C.idPlano_de_treino = PT.idPlano_de_Treino
				where C.idCliente = x;
END %%
DELIMITER ;

-- Ver aulas Recomendadas
Drop procedure IF EXISTS  `RecommendedClasses`;
-- Ver plano de treino
DELIMITER %%
CREATE PROCEDURE `RecommendedClasses` (x int)
BEGIN
	SELECT AR.idPlano_de_Treino , AR.Justificação From Cliente as C 
		inner join Plano_de_Treino as PT
			on PT.idPlano_de_Treino = C.idPlano_de_Treino
				inner join AulasRecomendadas as AR
					on AR.idPlano_de_Treino = PT.idPlano_de_Treino
						where C.idCliente = x;
END %%
DELIMITER ;

Drop procedure IF EXISTS  `ClassesAttended`;
-- Ver aulas que frequentou
DELIMITER %%
CREATE PROCEDURE `ClassesAttended` (x int)
BEGIN
	Select * From Cliente_frequentou_Aula_com_Horário where idCliente = x;
    
END %%
DELIMITER ;


Drop procedure IF EXISTS  `PackageSchedule`;
-- Ver horario do seu pacote
DELIMITER %%
CREATE PROCEDURE `PackageSchedule` (x int)
BEGIN
	Select * From Cliente_tem_Pacote where idCliente = x;
    
END %%
DELIMITER ;


Drop procedure IF EXISTS  `MuscleSchedule`;
-- Ver horario para musculaçao
DELIMITER %%
CREATE PROCEDURE `MuscleSchedule` (x int)
BEGIN
	Select PTHM.Horário_Inicio , PTHM.Horário_Fim From Cliente_tem_Pacote as CP
		inner join Pacote_tem_Horário_Para_Musculação as PTHM 
			on PTHM.idPacote = CP.idPacote
				where CP.idCliente = x;
    
END %%
DELIMITER ;
