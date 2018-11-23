USE `Npng`;
DROP procedure IF EXISTS `darFuncHorarios`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `darFuncHorarios`(dia Date, nFuncs INT)
BEGIN
	declare horaInicial TIME;
    declare i INT;
	if DAYNAME(dia) in ('Sunday', 'Saturday') then
			set horaInicial = '10:00:00';
            set i = 3;
	else 	
			set horaInicial = '8:00:00';
            set i = 2;
	END if;
    
	horarios: LOOP
		if i<(2+nFuncs) then
			insert into Funcionário_tem_Horário values
				(i, CONCAT ( dia, ' ', horaInicial), CONCAT (dia, ' ', ADDTIME(horaInicial, '05:00:00')));
			set horaInicial = ADDTIME(horaInicial, '05:00:00');
            set i = i+1;
            
            if horaInicial = '20:00:00' then
				set horaInicial = '10:00:00';
			end if;
            
            if horaInicial = '23:00:00' then
				set horaInicial = '8:00:00';
			end if;
            
            iterate horarios;
		else
			leave horarios;
		end if;
    END LOOP;
END%%

DELIMITER ;