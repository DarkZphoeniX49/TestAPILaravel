CREATE TRIGGER checkIDtwitter BEFORE INSERT ON clients  
BEGIN
	FOR EACH ROW 
		IF(SELECT new.id_twitter FROM clients WHERE id_twitter NOT LIKE “@%”)
		THEN
			SIGNAL SQL_STATE “16640” SET MESSAGE_TEXT(“erreur pas de @ présent) ;
		END IF ;
	END ;
