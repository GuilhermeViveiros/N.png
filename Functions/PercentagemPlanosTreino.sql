CREATE DEFINER=`root`@`localhost` FUNCTION `PercentagemPlanosTreino`(id int) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
	declare result float;
	set @clientes = (select count(*) from Cliente);
	set @plano = (select count(*) from Cliente where idPlano_de_Treino = id);
    set result = (@plano/@clientes);
RETURN result;
END