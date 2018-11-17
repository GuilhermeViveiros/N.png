CREATE DEFINER=`root`@`localhost` PROCEDURE `criarHorarios`(dataInicio Date, dataFinal Date)
BEGIN
	if dataInicio < dataFinal THEN
		datas: LOOP
				if DAYNAME(dataInicio) in ('Sunday', 'Saturday') then 
					insert into Horário values
						(CONCAT (dataInicio, ' 08:00:00'), CONCAT (dataInicio, ' 10:00:00'));
				else
					insert into Horário values
						(CONCAT (dataInicio, ' 10:00:00'), CONCAT (dataInicio, ' 12:00:00'));
				END if;
				SET dataInicio = ADDDATE(dataInicio, 1);
				if dataInicio < dataFinal THEN
					iterate datas;
				END if;
				Leave datas;
		END LOOP datas;
	END if;
END