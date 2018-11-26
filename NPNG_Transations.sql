use Npng;

SELECT * FROM Cliente_teve_Personal_Trainer;
SELECT * FROM Pacote;
SELECT * FROM Cliente_tem_Pacote;
SELECT * FROM Personal_Trainer;

SELECT id_Personal_Trainer from Pacote where idPacote = 1;

call addPT_To_Pacote(1, 1, "testing");

Drop procedure IF EXISTS `addPT_To_Pacote`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPT_To_Pacote`(in idPT int, in idPac int, in justif VARCHAR(200))
BEGIN
	DECLARE done BOOL default 0;
    DECLARE err BOOL DEFAULT 0;
	DECLARE id int;
	DECLARE idsClientes CURSOR FOR SELECT idCliente FROM Cliente_tem_Pacote
		where idPacote = idPac;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
    SELECT @oldPT := id_Personal_Trainer from Pacote where idPacote = idPac;
			
		START TRANSACTION;
			SET FOREIGN_KEY_CHECKS=0;
			UPDATE Pacote SET id_Personal_trainer = idPT
							where idPacote = idPac;
			
			
            OPEN idsClientes;
			insertLOOP : LOOP
				FETCH idsClientes INTO id;
				if  done then
					leave insertLOOP;
				end if;
				
				if @oldPT is not null then
					INSERT INTO Cliente_teve_Personal_Trainer (idCliente, idPersonal_Trainer, Justificação)
						VALUE(id, @oldPt, justif);
				END if;        
				ITERATE insertLOOP;
			END LOOP;
			Close idsClientes;
			SET FOREIGN_KEY_CHECKS=1;
		if err then rollback;
		else commit;
		END IF;
END %%
DELIMITER ;


SELECT * FROM AulasRecomendadas;
SELECT * FROM Aula;
call addAulas_To_PlanoDeTreino(1, "5,2", "fitness");

DROP PROCEDURE IF EXISTS `addAulas_To_PlanoDeTreino`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `addAulas_To_PlanoDeTreino`(in planoTreino int, in idAulas VARCHAR(200), in just VARCHAR(200) )
BEGIN
	DECLARE err BOOL DEFAULT 0;
    DECLARE aula VARCHAR(200);
	DECLARE i int default 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
	if LENGTH(idAulas) < 200 then
		START Transaction;
        
		insertAulas: LOOP
            SET aula = substring_index(idAulas, "," , -i);
            SET aula = substring_index(aula, "," , 1);
			
            INSERT INTO AulasRecomendadas (idPlano_de_Treino, idAula, Justificação) VALUES
				(planoTreino, aula, just);
            
			if(aula = substring_index(idAulas, "," , 1)) then
				leave insertAulas;
			END if;
			SET i = i + 1;
			iterate insertAulas;
		END LOOP;
        
		if err then rollback;
			else commit;
		END IF;
        
    END if;
END %%;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SwapScheduleFromWorkers`;
-- Troca os horário de dois funcionários, caso sejam PTs estes trocam as aulas que dão para serem compatíveis com os novos horários 
DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `SwapScheduleFromWorkers`(in w1 int, in w2 int, inicio Date)
	BEGIN
		
		DECLARE err BOOL DEFAULT 0;
		DECLARE CategoriaW1 Varchar(45);
        DECLARE CategoriaW2 Varchar(45);
		DECLARE aulaToSwap int;
		DECLARE aulasW1 CURSOR FOR SELECT idAula from Aula
				where idPersonal_Trainer = w1;
        DECLARE aulasW2 CURSOR FOR SELECT idAula from Aula
				where idPersonal_Trainer = w2;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;

        SELECT @CategoriaW1 := Categoria FROM Funcionário Where idFuncionário = w1;
        SELECT @CategoriaW2 := Categoria FROM Funcionário Where idFuncionário = w2;
        
        START Transaction;
			if @CategoriaW1 = @CategoriaW2 THEN
				if @CategoriaW1 = 'Personal_Trainer' THEN
					OPEN aulasW1;
                    OPEN aulasW2;
					BEGIN
						DECLARE done BOOL default FALSE;
						DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =TRUE;
						trocarAulasW1: LOOP
							Fetch aulasW1 INTO aulaToSwap;
							if  done  then
								leave trocarAulasW1;
							end if;
							UPDATE Aula SET idPersonal_Trainer = w2 where idAula = aulaToSwap;
							ITERATE trocarAulasW1;
						END LOOP;
					END;
                    CLOSE aulasW1;
                    
					BEGIN
						DECLARE done BOOL default FALSE;
						DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =TRUE;
						trocarAulasW2: LOOP
							Fetch aulasW2 INTO aulaToSwap;
							if  done  then
								leave trocarAulasW2;
							end if;
							UPDATE Aula SET idPersonal_Trainer = w1 where idAula = aulaToSwap;
							ITERATE trocarAulasW2;
						END LOOP;
					END;
                    CLOSE aulasW2;
				END if;
                
				UPDATE Funcionário_tem_Horário SET 
					idFuncionário = if (idFuncionário = w1, w2, w1)
					where idFuncionário in (w1, w2) and inicio <= Date(Horário_Inicio);
		
            END if;
        if err then rollback;
			else commit;
		END IF;        
    END %%
DELIMITER ;