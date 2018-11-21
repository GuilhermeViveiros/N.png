USE `Npng`;
DROP function IF EXISTS `PackageNumbers`;


DELIMITER $$
USE `Npng`$$
CREATE FUNCTION `PackageNumbers` ()
RETURNS INTEGER
READS SQL DATA
DETERMINISTIC
BEGIN


RETURN (select Count(0) from Pacote as P);
END$$

DELIMITER ;