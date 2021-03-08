create OR REPLACE VIEW CATS AS
    SELECT P.*, C.lifeCount 
	FROM Pet AS P 
		JOIN Cat AS C ON P.id = C.id;

	
	
CREATE OR REPLACE VIEW DOGS AS
    SELECT P.*, D.BarkPitch
	FROM Pet AS P 
		JOIN Dog AS D ON P.id = D.id;


CREATE OR REPLACE VIEW PETS AS
    SELECT P.*, D.BarkPitch, C.lifeCount
	FROM Pet AS P 
		left JOIN Dog AS D ON P.id = D.id left JOIN Cat AS C ON P.id = C.id;
		
	
	

	

CREATE OR REPLACE FUNCTION Changed()
RETURNS TRIGGER AS $$
DECLARE
-- local variables
begin
	

create OR REPLACE VIEW CATS AS
    SELECT P.*, C.lifeCount 
	FROM Pet AS P 
		JOIN Cat AS C ON P.id = C.id;

CREATE OR REPLACE VIEW DOGS AS
    SELECT P.*, D.BarkPitch
	FROM Pet AS P 
		JOIN Dog AS D ON P.id = D.id;
	
CREATE OR REPLACE VIEW PETS AS
    SELECT P.*, D.BarkPitch, C.lifeCount
	FROM Pet AS P 
		left JOIN Dog AS D ON P.id = D.id left JOIN Cat AS C ON P.id = C.id;
		
	

	return new;
END;
$$ LANGUAGE plpgsql;

/* use cat_died when triggered */

CREATE TRIGGER Cat_trigger
after update or delete or insert 
ON Cat
FOR EACH ROW 
EXECUTE PROCEDURE Changed();

CREATE TRIGGER Dog_trigger
after update or delete or insert 
ON Dog
FOR EACH ROW 
EXECUTE PROCEDURE Changed();

CREATE TRIGGER Pet_trigger
after update or delete or insert 
ON Pet
FOR EACH ROW 
EXECUTE PROCEDURE Changed();


update Cat set lifecount = (lifecount-1) where Cat.id = 1;
update Dog set barkpitch = 'H3' where Dog.id = 2;




