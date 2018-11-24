-- César
USE `Npng`;
DROP function IF EXISTS `QuantosClientesNaAula`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` FUNCTION `QuantosClientesNaAula`(id int, inicio DateTime, fim DateTime) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
RETURN (select count(*) from Cliente_frequentou_Aula_com_Horário 
			where idAula=id and Horário_Inicio=inicio and Horário_Fim=fim);
END%%

DELIMITER ;