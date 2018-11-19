Drop procedure IF EXISTS `criarHorarios`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `criarHorarios`(dataInicio Date, dataFinal Date)
BEGIN
	if dataInicio < dataFinal THEN
		datas: LOOP
				call criarHorarioDia(dataInicio);
                call criarTurnoDia(dataInicio);
				SET dataInicio = ADDDATE(dataInicio, 1);
				if dataInicio < dataFinal THEN
					iterate datas;
				END if;
				Leave datas;
		END LOOP datas;
	END if;
END %%
DELIMITER ;