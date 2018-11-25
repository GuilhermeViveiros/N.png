Use Npng;

DROP TRIGGER IF EXISTS remMáquina;
CREATE TRIGGER remMáquina BEFORE DELETE ON Máquina
	For each row 
		DELETE From Plano_de_Treino_Recomenda_Máquina
			where OLD.idMáquina = idMáquina;


DROP TRIGGER IF EXISTS remPacote;
DELIMITER %%
CREATE TRIGGER remPacote BEFORE DELETE ON Pacote
	For each row
		Begin
			DELETE FROM Pacote_tem_Aula where idPacote = OLD.idPacote;
            DELETE FROM Pacote_tem_Horário_Para_Musculação where idPacote = OLD.idPacote;
            DELETE FROM Cliente_tem_Pacote where idPacote = OLD.idPacote;
		End %%
DELIMITER ;

DROP TRIGGER IF EXISTS remCliente;
DELIMITER %%
CREATE TRIGGER remCliente BEFORE DELETE ON Cliente
	For each row
		Begin
			DELETE FROM Cliente_tem_Pacote where idCliente = OLD.idCliente;
            DELETE FROM Morada where idCliente = OLD.idCliente;
            DELETE FROM Contactos where idCliente = OLD.idCLiente;
            DELETE FROM Cliente_teve_Personal_Trainer where idCliente = OLD.idCliente;
		End %%
DELIMITER ;		

DROP TRIGGER IF EXISTS remAula;
DELIMITER %%
CREATE TRIGGER remAula BEFORE DELETE ON Aula
	For each row
		Begin
			DELETE FROM AulasRecomendadas where idAula = OLD.idAula;
            DELETE FROM Aula_tem_Horário where idAula = OLD.idAula;
            DELETE FROM Pacote_tem_Aula where idAula = OLD.idAula;
		End %%
DELIMITER ;

DROP TRIGGER IF EXISTS remPT;
DELIMITER %%
CREATE TRIGGER remPT BEFORE DELETE ON Personal_Trainer
	For each row
		Begin
			UPDATE Pacote SET id_Personal_Trainer = null
				where id_Personal_Trainer = OLD.idFuncionário;
            DELETE FROM Aula where idPersonal_Trainer = OLD.idFuncionário;
            DELETE FROM Cliente_teve_Personal_Trainer where idPersonal_Trainer = OLD.idFuncionário;
		End %%
DELIMITER ;	

DROP TRIGGER IF EXISTS remFuncionário;
DELIMITER %%
CREATE TRIGGER remFuncionário BEFORE DELETE ON Funcionário 
	For each row 
		Begin
			if OLD.Categoria = "Personal_Trainer" then
				DELETE FROM Personal_Trainer where idFuncionário = OLD.idFuncionário;
			END if;
            if OLD.Categoria = "Nutricionista" then
				UPDATE Pacote SET id_Nutricionista = null
					where id_Nutricionista = OLD.idFuncionário;
            END if;
            
			DELETE FROM Funcionário_tem_Horário where idFuncionário = OLD.idFuncionário;
		End %%
DELIMITER ;	
		
DROP TRIGGER IF EXISTS insertClienteTeveAula;
DELIMITER %%
CREATE TRIGGER insertClienteTeveAula BEFORE INSERT ON Cliente_frequentou_Aula_com_Horário 
	For each row 
		Begin
			DECLARE numAlunos int default 0;
			DECLARE lotacao int default 0;
			SET numAlunos = (SELECT Count(idCliente) FROM Cliente_frequentou_Aula_com_Horário
						where idAula = NEW.idAula and Horário_Inicio = NEW.Horário_Inicio and Horário_Fim = NEW.Horário_Fim);
			SET lotacao = LotaçãoAula(NEW.idAula);
            if numAlunos >= lotacao THEN
				SET NEW.idAula = null;
            END if;
		End %%
DELIMITER ;	