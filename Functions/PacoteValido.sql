CREATE DEFINER=`root`@`localhost` FUNCTION `PacoteValido`(idC int) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	set @validade = (select Data_final from Cliente_tem_Pacote where idCliente=idC);
    if @validade>now() then
		return 1;
	else
		return 0;
	end if;
END