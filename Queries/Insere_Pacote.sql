CREATE DEFINER=`root`@`localhost` PROCEDURE `Insere_Pacote`(Nome VARCHAR(45), Personal_Trainer INT , Nutricionista INT)
BEGIN
	Declare numero_pacotes int(11);
    Declare current_data datetime;
    
    Set numeros_pacotes = 4 -- (select Max(Pacote.idPacote) from Pacote);
    GETDATE() datetime do dia atual
    -- DATEADD(type, value, date)
    -- Set current_data = GETDATE();
    
-- If  Nome = "FullPack" then 
-- Insert Into Pacotes
   --     (idPacote,Nome,id_Personal_Trainer,id_Nutricionista,Horário_Inicio,Horário_Fim)
	-- VALUES
     --   (numero_pacotes+1,Personal_Trainer, Nutricionista , current_data , DATEADD(y, 1, current_data));
		
        -- pode frequentar todas as aulas
        -- pode frequentar musculação a qualquer hora
        
-- 	ElseIf Nome = "MediumPack" then
-- Insert Into Pacotes
  --      (idPacote,Nome,id_Personal_Trainer,id_Nutricionista,Horário_Inicio,Horário_Fim)
-- VALUES
     --   (numero_pacotes+1,Personal_Trainer, Nutricionista , current_data , DATEADD(y, 1, current_data));
        
        -- pode frequentar todas as aulas
        -- pode frequentar o gym só na parte da tarde (respetivamente a partir das 2)
        
    -- ElseIf Nome = "LightClass" then
		
        -- permite o cliente de escolher as aulas que quer frequentar 
        -- permite aceder à sala de musculação a qualquer hora,
        
   -- ElseIf Nome = "LightMuscle"
    
		-- permite o cliente frequentar qualquer aula 
        -- permite escolher um horário para musculação 
    
    -- ElseIf Nome = "SinglePack"
		
        -- O cliente apenas pode estar no ginásio durante 3 horas com direito de frequentar qualquer aula e aceder à sala de musculação quando quiser.
    

    
  --  End If;
	
    
    
END