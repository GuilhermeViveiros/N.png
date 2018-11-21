CREATE DEFINER=`root`@`localhost` PROCEDURE `darPTHorarios`(dia Date, nPTs int)
BEGIN
	declare i int;
    declare horaInicial TIME;
    declare horafinal TIME;
    
    set i = 7;
    set horaInicial = '8:00:00';
    set horafinal = '13:00:00';
	turno: loop
		if i<(7+nPTs) then
			if horafinal >= '23:00:00' then
				set horaInicial = '8:00:00';
				set horafinal = '13:00:00';
			end if;
            
			if DAYNAME(dia) in ('Sunday', 'Saturday') then
				insert Into Funcionário_tem_Horário Values
					(i,CONCAT(dia,' ', addtime(horaInicial, '2:00:00')), CONCAT(dia, ' ', addtime(horafinal, '2:00:00')));
				set i = i + 1;
			else 
				insert Into Funcionário_tem_Horário Values
					(i,CONCAT(dia,' ', horaInicial), CONCAT(dia, ' ', horafinal));
                set i = i + 1;
			end if;
            
            set horaInicial = addtime(horaInicial, '5:00:00');
			set horafinal = addtime(horafinal, '5:00:00');
            iterate turno;
		else
			leave turno;
        end if;
	end loop turno;
END