use Npng;



SELECT * FROM Cliente_teve_Personal_Trainer;
SELECT * FROM Pacote;
SELECT * FROM Cliente_tem_Pacote;

call addPT_To_Pacote(1, 1, "testing");
DELETE FROM Cliente_teve_Personal_Trainer;
Drop procedure IF EXISTS `addPT_To_Pacote`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPT_To_Pacote`(in idPT int, in idPac int, in reclamação VARCHAR(200))
BEGIN
	DECLARE oldPT int default null;
	DECLARE done BOOL default 0;
    DECLARE err BOOL DEFAULT 0;
	DECLARE id int;
	DECLARE idsClientes CURSOR FOR SELECT idCliente FROM Cliente_tem_Pacote
		where idPacote = idPac;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
    SELECT @oldPT := id_Personal_Trainer from Pacote where idPacote = idPac;
	OPEN idsClientes;
			
		START TRANSACTION READ WRITE;
			insertLOOP : LOOP
				FETCH idsClientes INTO id;
				if  done then
					leave insertLOOP;
				end if;
				
				-- if oldPT is not null then
                SELECT "I am here";
					INSERT INTO Cliente_teve_Personal_Trainer (idCliente, idPersonal_Trainer, Reclamação)
						 SELECT * FROM (SELECT id, oldPT, reclamação) AS tmp
							WHERE NOT EXISTS (
								SELECT * FROM Cliente_teve_Personal_Trainer 
									WHERE idCliente = id and idPersonal_Trainer = oldPT
							) LIMIT 1;
				-- END if;        
				ITERATE insertLOOP;
			END LOOP;
			Close idsClientes;
			
			UPDATE Pacote SET id_Personal_trainer = idPT
				where idPacote = idPac;
		
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

DROP PROCEDURE IF EXISTS `SwapScheduleFromWorkersBetween`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `SwapScheduleFromWorkersBetween`(in w1 int, in w2 int, in dataInicial Date, in dataFinal Date)
	BEGIN
		DECLARE err BOOL DEFAULT 0;
		DECLARE done BOOL default 0;
		DECLARE CategoriaW1 Varchar(45);
        DECLARE CategoriaW2 Varchar(45);
		DECLARE aula int;
        DECLARE aulasW1 CURSOR FOR SELECT idAulas from Aula as A
			INNER JOIN Aula_tem_Horário AS AtH ON A.idAula = AtH.idAula
				where A.idPersonal_Trainer = w1 and Date(Horário_Inicio) >= dataInicial and Date(Horário_Fim) <= dataFinal;
        DECLARE aulasW2 CURSOR FOR SELECT idAulas from Aula as A
			INNER JOIN Aula_tem_Horário AS AtH ON A.idAula = AtH.idAula
				where A.idPersonal_Trainer = w2 and Date(Horário_Inicio) >= dataInicial and Date(Horário_Fim) <= dataFinal;DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

        SELECT @CategoriaW1 := Categoria FROM Funcionário Where idFuncionário = w1;
        SELECT @CategoriaW2 := Categoria FROM Funcionário Where idFuncionário = w2;
        
        START Transaction;
			if CategoriaW1 = CategoriaW2 THEN
				if CategoriaW1 = "Personal_Trainer" THEN
					OPEN aulasW1;
					trocarAulasW1: LOOP
						Fetch aulasW1 INTO aula;
                        if  done then
							leave trocarAulasW1;
						end if;
						UPDATE Aula SET idPersonal_Trainer = w2 where idAula = aulaW1;
						ITERATE trocarAulasW1;
                    END LOOP;
                    CLOSE aulasW1;
                    SET done = 0;
                    
                    OPEN aulasW1;
					trocarAulasW2: LOOP
						Fetch aulasW2 INTO aula;
                        if  done then
							leave trocarAulasW2;
						end if;
						UPDATE Aula SET idPersonal_Trainer = w1 where idAula = aulaW2;
						ITERATE trocarAulasW2;
                    END LOOP;
                    CLOSE aulasW1;
				END if;
                
			END if;
			
        if err then rollback;
			else commit;
		END IF;
        
    END %%
DELIMITER ;