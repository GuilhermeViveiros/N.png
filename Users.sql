Use NPNG;

-- Users , Funcionário , Gestor
-- Admin é o própio root

-- ALL PRIVILEGES – grants all privileges to the MySQL user
-- CREATE – allows the user to create databases and tables
-- DROP - allows the user to drop databases and tables
-- DELETE - allows the user to delete rows from specific MySQL table
-- INSERT - allows the user to insert rows into specific MySQL table
-- SELECT – allows the user to read the database
-- UPDATE - allows the user to update table rows



select host, user from mysql.user; -- ver os host

-- ------------------------------------------------------------------------------Cliente------------------------------------------------------------------------------------------------------

-- Plano de Treino  , AulasRecomendadas , Aulasquefrequentou , Pacote_tem_Horario_Para_Musculação 
create user 'User'@'localhost' identified by 'user'; -- User user
-- Pode ver os Pacotes 
GRANT SELECT ON NPNG.Pacote  TO 'User';
-- Pode ver as Aulas
GRANT SELECT ON NPNG.Aula  TO 'User';
-- Pode ver os horários das Aulas
GRANT SELECT ON NPNG.Aula_tem_Horário  TO 'User';
-- Pode ver as máquinas
GRANT SELECT ON NPNG.Máquina  TO 'User';

-- -> Pode ver qualquer um destes métodos através do seu ID

-- Pode ver o seu Pacote
GRANT EXECUTE ON PROCEDURE Package  TO 'User';
-- Pode ver seu Plano de Treino
GRANT EXECUTE ON PROCEDURE TrainningPlan  TO 'User';
-- Pode ver suas AulasRecomendadas
GRANT EXECUTE ON PROCEDURE RecommendedClasses  TO 'User';
-- Pode ver as Aulas que frequentou
GRANT EXECUTE ON PROCEDURE ClassesAttended  TO 'User';
-- Pode ver o horário do seu pacote
GRANT EXECUTE ON PROCEDURE PackageSchedule  TO 'User';
-- Pode ver o horário para fazer musculação incluido no pacote
GRANT EXECUTE ON PROCEDURE MuscleSchedule  TO 'User';
-- Pode ver todas as VIEWS
GRANT SELECT ON Views.* TO 'User';

-- ------------------------------------------------------------------------------Funcionário---------------------------------------------------------------------------------------------------


create user 'Funcionario' identified by 'funcionario';

-- Revoke DELETE ON NPNG.*  FROM 'Funcionario';

-- Funcionário pode inserir qualquer informação na base de dados
GRANT INSERT ON NPNG.* To 'Funcionario';
-- Funcionário pode ver os views
GRANT SELECT ON Views.* TO 'Funcionario';
-- Funcionário pode ver qualquer tabela
GRANT SELECT ON NPNG.* To 'Funcionario';





-- ------------------------------------------------------------------------------Gestor------------------------------------------------------------------------------------------------------------
create user 'Gestor' identified by 'gestor';
GRANT SELECT , INSERT  ON NPNG.Máquina To 'Gestor';



-- ------------------------------------------------------------------------------Personal_Trainer---------------------------------------------------------------------------------------------------
create user 'Personal_Trainer' identified by 'Personal_Trainer';

-- Pode mexer no Plano de Treino / Plano de treino recomenda máquina/ Aulas Recomendadas
GRANT SELECT,INSERT,UPDATE ON NPNG.Plano_de_Treino TO 'Personal_Trainer';
GRANT SELECT,INSERT,UPDATE ON NPNG.AulasRecomendadas TO 'Personal_Trainer';
GRANT SELECT,INSERT,UPDATE ON NPNG.Plano_de_Treino_Recomenda_Máquina TO 'Personal_Trainer';

-- Para estes métodos só precisamos fornecer o id do Personal Trainer

-- Pode ver as suas Aulas
GRANT EXECUTE ON PROCEDURE ClassesOfPT TO 'Personal_Trainer';
-- Pode ver os cliente que teve
GRANT EXECUTE ON PROCEDURE OldClientsOfPT TO 'Personal_Trainer';
-- Pode ver os clientes que tem
GRANT EXECUTE ON PROCEDURE ActualClientsOfPT TO 'Personal_Trainer';



-- ------------------------------------------------------------------------------Programador---------------------------------------------------------------------------------------------------------
create user 'Programador' identified by 'programador';


GRANT CREATE,DELETE,INSERT,SELECT ON NPNG.* TO 'Programador';
GRANT EXECUTE, UPDATE ON VIEW TO 'Programador';


