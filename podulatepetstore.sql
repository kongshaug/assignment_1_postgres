

delete from dog;
delete from cat;
delete from petcaretaker;
delete from Pet;
delete from Vet;
delete from Caretaker;
delete from City;



insert into city (zipCode, cityName) values (4000, 'roskilde'); 
insert into city (zipCode, cityName) values (2920, 'charlottenlund');
insert into city (zipCode, cityName) values (2700, 'Brønshøj');
insert into city (zipCode, cityName) values (2000, 'Frederiksberg');


insert into caretaker (name, phone, street, zipCode) values ('Bodil', 10101010, 'æblehaven 42', 4000);
insert into caretaker (name, phone, street, zipCode) values ('Carsten', 02020202, 'hofvej 27', 2920);
insert into caretaker (name, phone, street, zipCode) values ('Kim', 3333333, 'hovedvej 32', 2700);
insert into caretaker (name, phone, street, zipCode) values ('Lars', 95959595, 'hulegade 2', 2000);
insert into caretaker (name, phone, street, zipCode) values ('Mætte', 37373737, 'mile 32', 2700);
insert into caretaker (name, phone, street, zipCode) values ('lone', 22222222, 'havegade 121', 4000);
insert into caretaker (name, phone, street, zipCode) values ('yvonne', 95495444, 'Julegade 112', 2920);
insert into caretaker (name, phone, street, zipCode) values ('mads', 02020802, 'møllersvej 87', 4000);
insert into caretaker (name, phone, street, zipCode) values ('holger', 32432432, 'tornegade 2', 4000);
insert into caretaker (name, phone, street, zipCode) values ('julie', 93893853, 'tormsvej 27', 2700);


CREATE OR REPLACE procedure NEW_VET (vetName varchar(50), vetPhone int, vetStreet varchar(50), vetZipCode int, vetCvr int)	
as $$
declare 
	caretakerId int;
begin 
	insert into caretaker (name, phone, street, zipCode) values (vetName, vetPhone, vetStreet, vetZipCode) returning id into caretakerId;
	insert into vet (id, cvr) values (caretakerId, vetCvr);
	end 
$$ language plpgsql;

call NEW_VET('vilads', 98989898, 'husomvej 32', 2920, 28838328 );
call NEW_VET('uno', 76554333, 'gadegade 93', 2000, 85848394);


insert into Pet (name, age, VetId) values ('snebold', 3,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('fluf', 1,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('malthe', 2,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('kurt', 3,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('buffy', 4,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('mugge', 6,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('dido', 7,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('Else Pelse', 3,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('Felix', 3,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('Filivovkost', 3,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('bobby', 3,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('foxxi', 1,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('bumbum', 2,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('glog', 3,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('snaky', 4,(select id from caretaker where name = 'uno'));
insert into Pet (name, age, VetId) values ('nuggi', 6,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('bimmer', 7,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('else yvonne', 2,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('bella', 65,(select id from caretaker where name = 'vilads'));
insert into Pet (name, age, VetId) values ('asta', 32,(select id from caretaker where name = 'vilads'));


insert into Dog (id, BarkPitch) values ((select id from pet where name = 'fluf'), 'A3');
insert into Dog (id, BarkPitch) values ((select id from pet where name = 'bobby'), 'C1');
insert into Dog (id, BarkPitch) values ((select id from pet where name = 'bumbum'), 'B2');
insert into Dog (id, BarkPitch) values ((select id from pet where name = 'foxxi'), 'A2');
insert into Dog (id, BarkPitch) values ((select id from pet where name = 'bella'), 'C1');

insert into Cat (id, lifeCount) values ((select id from pet where name = 'snebold'), 5);
insert into Cat (id) values ((select id from pet where name = 'asta'));
insert into Cat (id, lifeCount) values ((select id from pet where name = 'buffy'), 4);
insert into Cat (id, lifeCount) values ((select id from pet where name = 'Filivovkost'), 7);
insert into Cat (id, lifeCount) values ((select id from pet where name = 'Felix'), 3);


CREATE OR REPLACE procedure NEW_PETCARETAKER (caretakerName varchar(50), petName varchar(50))	
as $$
declare 

begin 
	insert into PetCaretaker (CaretakerId, PetId) values ((select id from caretaker where name = caretakerName), (select id from pet where name = petName)) ;
end 
$$ language plpgsql;

call NEW_PETCARETAKER('Carsten','Else Pelse');
call NEW_PETCARETAKER('Kim','kurt');
call NEW_PETCARETAKER('Lars','dido');
call NEW_PETCARETAKER('Mætte','snebold');
call NEW_PETCARETAKER('lone','malthe');
call NEW_PETCARETAKER('yvonne','mugge');
call NEW_PETCARETAKER('mads','buffy');
call NEW_PETCARETAKER('holger','Felix');
call NEW_PETCARETAKER('julie','Filivovkost');
call NEW_PETCARETAKER('Carsten','bimmer');
call NEW_PETCARETAKER('Kim','bella');
call NEW_PETCARETAKER('Lars','bella');
call NEW_PETCARETAKER('Mætte','malthe');
call NEW_PETCARETAKER('lone','buffy');
call NEW_PETCARETAKER('Carsten','bumbum');
call NEW_PETCARETAKER('Kim','glog');
call NEW_PETCARETAKER('Lars','snaky');
call NEW_PETCARETAKER('Mætte','nuggi');
call NEW_PETCARETAKER('lone','bimmer');
call NEW_PETCARETAKER('Mætte','bobby');
call NEW_PETCARETAKER('lone','foxxi');

