CREATE PROCEDURE `criarTurnoDia` (In dia Date)
BEGIN
	if DAYNAME(dia) in ('Sunday', 'Saturday') then
		insert Into Horários Values
			(CONCAT(dia,' ', '10:00:00'), CONCAT(dia, ' ', '15:00:00')),
            (CONCAT(dia,' ', '15:00:00'), CONCAT(dia, ' ', '20:00:00'));
	else 
		insert Into Horários Values
			(CONCAT(dia,' ', '08:00:00'), CONCAT(dia, ' ', '13:00:00')),
            (CONCAT(dia,' ', '13:00:00'), CONCAT(dia, ' ', '18:00:00')),
            (CONCAT(dia,' ', '18:00:00'), CONCAT(dia, ' ', '23:00:00'));
	END if;
END