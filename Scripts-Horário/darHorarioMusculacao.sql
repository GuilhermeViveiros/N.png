USE `Npng`;
DROP procedure IF EXISTS `darHorarioMusculacao`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `darHorarioMusculacao`(dia Date)
BEGIN
	if DAYNAME(dia) in ('Sunday', 'Saturday') then
		insert into Horário values
			(CONCAT(dia,' 10:00:00'), CONCAT(dia, ' 13:00:00')),
            (CONCAT(dia,' 10:00:00'), CONCAT(dia, ' 20:00:00'));
		insert into Pacote_tem_Horário_Para_Musculação values
			(2,CONCAT(dia,' 10:00;00'), CONCAT(dia, ' 13:00:00')),
            (1,CONCAT(dia,' 10:00;00'), CONCAT(dia, ' 20:00:00'));
	else 	
		insert into Horário values
			(CONCAT(dia,' 8:00:00'), CONCAT(dia, ' 23:00:00')),
            (CONCAT(dia,' 8:00:00'), CONCAT(dia, ' 11:00:00')),
            (CONCAT(dia,' 19:00:00'), CONCAT(dia, ' 23:00:00')),
            (CONCAT(dia,' 8:00:00'), CONCAT(dia, ' 9:00:00')),
            (CONCAT(dia,' 21:00:00'), CONCAT(dia, ' 23:00:00'));
		insert into Pacote_tem_Horário_Para_Musculação values
			(1,CONCAT(dia,' 8:00;00'), CONCAT(dia, ' 23:00:00')),
            (2,CONCAT(dia,' 8:00;00'), CONCAT(dia, ' 11:00:00')),
            (2,CONCAT(dia,' 19:00;00'), CONCAT(dia, ' 23:00:00')),
            (3,CONCAT(dia,' 8:00;00'), CONCAT(dia, ' 9:00:00')),
            (3,CONCAT(dia,' 21:00;00'), CONCAT(dia, ' 23:00:00'));
	END if;
END%%

DELIMITER ;