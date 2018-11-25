USE Npng;

CREATE INDEX ClientByNIF ON Cliente (Nif)
	USING HASH;
    
CREATE INDEX ClientByNome ON Cliente (Nome);

CREATE INDEX AulaByNome On Aula (Nome);

CREATE INDEX FuncionárioByNome on Funcionário (Nome);

CREATE INDEX PacoteByNome on Pacote (Nome);

CREATE INDEX MáquinaByNome on Máquina (Nome);