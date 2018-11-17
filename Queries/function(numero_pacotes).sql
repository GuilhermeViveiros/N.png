CREATE DEFINER=`root`@`localhost` FUNCTION `numero_Pacotes`() RETURNS int(11)
BEGIN

RETURN (select Max(P.idPacote) from Pacote as P) ;
END