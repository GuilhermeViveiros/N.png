USE `Npng`;
DROP procedure IF EXISTS `darHorarioAula`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `darHorarioAula`(dia Date)
BEGIN
	declare idA int;
    declare horaInicial TIME;
    declare horaFinal TIME;
    set idA = 1;
    
    if DAYNAME(dia) in ('Sunday', 'Saturday') then
		set horaInicial = '10:00:00';
		set horaFinal = '12:00:00';
	else
		set horaInicial = '8:00:00';
		set horaFinal = '10:00:00';
    end if;
    
    horario: loop
		if idA<8 then
			INSERT INTO Aula_tem_Horário
			(idAula,Horário_Inicio,Horário_Fim)
			VALUES
				(idA, CONCAT(dia,' ', horaInicial), CONCAT(dia, ' ', horafinal));
			set idA = idA + 1;
			set horaInicial = addtime(horaInicial,'2:00:00');
			set horaFinal = addtime(horaFinal,'2:00:00');
			if horaFinal = '22:00:00' then
				leave horario;
			end if;
		else
			leave horario;
        end if;
        iterate horario;
    end loop horario;
    
END%%

DELIMITER ;