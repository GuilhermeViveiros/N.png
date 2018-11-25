USE `Npng`;
DROP procedure IF EXISTS `Insere_Pacote`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insere_Pacote`(Nome VARCHAR(45), PT INT , NT INT, )
BEGIN
	
    
    INSERT INTO Pacote
    (idPacote,Nome,id_Personal_Trainer,id_Nutricionista,Preço)
    VALUES
    ( (select count(0) from Pacotes), Nome,PT,NT,preco);
    
    
    
END %%
DELIMITER ;