CREATE DEFINER=`root`@`localhost` FUNCTION `PodeIrAula`(idC int, idA int, inicio DateTime, fim DateTime) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	declare result int;
    set @pacote = (select idPacote from Cliente_tem_Pacote where idCliente=idC);
	set @lotacao = (select Lotação from Aula where idAula=idA);
    set @clienteAula = (select QuantosClientesNaAula(idA, inicio, fim));
    set @validade = (select PacoteValido(idC));
    
    if @validade=0 then
		return 0;
	end if;
    
    if @lotacao<=@clienteAula then
		return 0;
	end if;
    
    if @pacote=1 and (idA in (1,2,3,4,5,6)) then
		set result = 1;
	end if;
    
    if @pacote=2 and (idA in (1,3,6)) then
		set result = 1;
	end if;
	
    if @pacote=3 then
		set result = 0;
	end if;
    
RETURN result;
END