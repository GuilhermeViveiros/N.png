CREATE DEFINER=`root`@`localhost` PROCEDURE `criarHorarioDia`(dia date)
BEGIN
	declare horaInicial TIME;
    declare horafinal TIME;
    declare horaAux TIME;
    
	if DAYNAME(dia) in ('Sunday', 'Saturday') then
			SET horaInicial = '10:00:00';
            SET horaAux = '12:00:00';
            SET horaFinal = '20:00:00';
	else 	
			SET horaInicial = '8:00:00';
			SET horaAux = '10:00:00';
            SET horaFinal = '22:00:00';
	END if;
    
	horarios: LOOP
		insert into Horário values
				(CONCAT ( dia, ' ', horaInicial), CONCAT (dia, ' ', horaAux));
		SET horaInicial = ADDTIME(horaInicial, '02:00:00');
        SET horaAux = ADDTIME(horaInicial, '02:00:00');
        if(horaInicial < horaFinal) THEN
			iterate horarios;
		END if;
        if(horaFinal = '22:00:00') THEN
			insert into Horário values
				(CONCAT ( dia, ' ', horaInicial), CONCAT (dia, ' ', '23:00:00'));
		END if;
		leave horarios;
    END LOOP;
END