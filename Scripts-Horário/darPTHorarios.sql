CREATE DEFINER=`root`@`localhost` PROCEDURE `darPTHorarios`(dia Date, nPTs int)
BEGIN
	declare i int;
    declare horaInicial TIME;
    declare horaFinal TIME;
    
    set i = 7;
    
    if DAYNAME(dia) in ('Sunday', 'Saturday') then
		set horaInicial = '10:00:00';
		set horaFinal = '15:00:00';
	else
		set horaInicial = '8:00:00';
		set horaFinal = '13:00:00';
    end if;
    
	turno: loop
		if i<(7+nPTs) then
			insert Into Funcionário_tem_Horário Values
				(i,CONCAT(dia,' ',horaInicial), CONCAT(dia, ' ',horaFinal));
            set i = i + 1;
            set horaInicial = addtime(horaInicial, '5:00:00');
			set horaFinal = addtime(horaFinal, '5:00:00');
            
            if horaInicial = '23:00:00' then
				set horaInicial = '8:00:00';
				set horaFinal = '13:00:00';
			end if;
            
            if horaInicial = '20:00:00' then
				set horaInicial = '10:00:00';
				set horaFinal = '15:00:00';
			end if;
            
            iterate turno;
		else
			leave turno;
        end if;
	end loop turno;
END