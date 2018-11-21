CREATE INDEX ClientByNIF ON Cliente (Nif)
	USING HASH;

-- SELECT * FROM Cliente where Nif = "251218194"