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
	DECLARE done boolean default False;
    DECLARE err BOOL DEFAULT 0;
	DECLARE id int;
	DECLARE idsClientes CURSOR FOR SELECT idCliente FROM Cliente_tem_Pacote
		where idPacote = idPac;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = True;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
    SELECT @oldPT := id_Personal_Trainer from Pacote where idPacote = idPac;
	OPEN idsClientes;
			
		START TRANSACTION READ WRITE;
			insertLOOP : LOOP
				FETCH idsClientes INTO id;
				if  done then
					leave insertLOOP;
				end if;
				
				if oldPT != null then
					INSERT INTO Cliente_teve_Personal_Trainer (idCliente, idPersonal_Trainer, Reclamação)
						 SELECT * FROM (SELECT id, oldPT, reclamação) AS tmp
							WHERE NOT EXISTS (
								SELECT * FROM Cliente_teve_Personal_Trainer 
									WHERE idCliente = id and idPersonal_Trainer = oldPT
							) LIMIT 1;
				END if;        
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

-- SELECT * FROM Pacote;