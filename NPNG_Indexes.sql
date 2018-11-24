CREATE INDEX ClientByNIF ON Cliente (Nif)
	USING HASH;

CREATE INDEX ClientFoiAula ON Cliente_frequentou_Aula_com_Horário (idCliente);

CREATE INDEX HorarioDasAulas ON Aula_tem_Horário (idAula);
