CREATE DEFINER=`root`@`localhost` PROCEDURE `darHorarios`(dia DATE)
BEGIN
	if DAYNAME(dia) in ('Sunday', 'Saturday') then
		insert into Funcionário_tem_Horário values
		(1, CONCAT ( dia, ' 10:00:00'), CONCAT ( dia, ' 15:00:00')),
        (11, CONCAT ( dia, ' 10:00:00'), CONCAT ( dia, ' 15:00:00')),
        (12, CONCAT ( dia, ' 10:00:00'), CONCAT ( dia, ' 15:00:00'));
	else
		insert into Funcionário_tem_Horário values
		(1, CONCAT ( dia, ' 8:00:00'), CONCAT ( dia, ' 13:00:00')),
        (11, CONCAT ( dia, ' 8:00:00'), CONCAT ( dia, ' 13:00:00')),
        (12, CONCAT ( dia, ' 13:00:00'), CONCAT ( dia, ' 18:00:00'));
	end if;

	call darFuncHorarios(dia, 5);
    call darPTHorarios(dia, 4);
END