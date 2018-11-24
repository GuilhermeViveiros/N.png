USE `Npng`;
DROP function IF EXISTS `QuantosClientesComPacoteAtual`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` FUNCTION `QuantosClientesComPacoteAtual`(id int) RETURNS int(11)
    READS SQL DATA
BEGIN
RETURN (select count(*) from Cliente_tem_Pacote
			where IdPacote = id and Data_inicial <= nw() and Data_final >= now());
END%%

DELIMITER ;

