Use Npng;
DROP function IF EXISTS `LotaçãoAula`;

DELIMITER %%
CREATE DEFINER=`root`@`localhost` FUNCTION `LotaçãoAula`(id int) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
RETURN (select Lotação from Aula
			where idAula=id);
END%%
DELIMITER ;