DROP TABLE IF EXISTS zipCodes cascade;
DROP TABLE IF EXISTS People cascade;
DROP TABLE IF EXISTS Staff cascade;
DROP TABLE IF EXISTS specialtyCodes cascade;
DROP TABLE IF EXISTS Trainers cascade;
DROP TABLE IF EXISTS officeStaff cascade;
DROP TABLE IF EXISTS Owners cascade;
DROP TABLE IF EXISTS Rooms cascade;
DROP TABLE IF EXISTS Stays cascade;
DROP TABLE IF EXISTS Breeds cascade;
DROP TABLE IF EXISTS Toys cascade;
DROP TABLE IF EXISTS dogPersonality cascade;
DROP TABLE IF EXISTS Dogs cascade;
DROP TABLE IF EXISTS dogType cascade;
DROP TABLE IF EXISTS Bookings cascade;

-- ZipCodes --
CREATE TABLE ZipCodes (
	zipCode		int NOT NULL,
	city		text NOT NULL,
	state		text NOT NULL,
   primary key (zipCode)
);

INSERT INTO zipCodes( zipCode, city, state)
	VALUES	
    	(18064, 'Nazareth', 'Pennsylvania'),
		(12106, 'Kinderhook', 'New York'),
		(16450, 'Meriden', 'Connecticut'),
		(19992, 'Danbury', 'Connecticut'),
		(33004, 'Hollywood', 'California'),
		(28754, 'Marion', 'North Carolina'),
		(11735, 'Farmingdale', 'New York'),
		(11572, 'Oceanside', 'New York'),
		(48185, 'Westland', 'Michigan'),
		(64151, 'Kansas City', 'Missouri'),
		(24073, 'Christiansburg', 'Virginia'),
		(60062, 'Northbrook', 'Illinois'),
		(48174, 'Romulus', 'Michigan');	

-- People --
CREATE TABLE People (
	personID		char(3) NOT NULL,	
	firstName		text NOT NULL,
	lastName		text NOT NULL,
	address			text NOT NULL,	
	zipCode			int NOT NULL references ZipCodes(zipCode),
	phoneNumber		text NOT NULL,	
	email			text,
   primary key (personID)
);

INSERT INTO People( personID, firstName, lastName, address, zipCode, phoneNumber, email )
	VALUES	
		('p01', 'Jonny', 'Noxon', '109 Oxford Street', 18064, '748-384-2838', 'jonny.noxon13@aol.com'),
		('p02', 'Ted', 'Tuttle', '456 North Lane', 12106, '929-495-2038', 'teddytut@yahoo.com'),
		('p03', 'Kimberly', 'Preece', '65 West Oak Street', 16450, '473-327-4532', 'ilovedogs@dog.net'),
		('p04', 'Faity', 'Kearns', '3 Devonshire Drive', 19992, '939-214-5832', 'faityk1994@gmail.com'),
		('p05', 'Jennifer', 'Aniston', '444 Hollywood Boulevard', 33004, '438-294-3820', 'rachelgreen@hotmail.com'),
		('p06', 'Frederick', 'Slayton', '9007 Sunbeam Court', 28754, '192-438-2340', 'freddieslay@gmail.com'),
		('p07', 'Anne', 'Matheus', '325 Boston Street', 11735, '214-542-5784', 'cococorzine@yahoo.com'),
		('p08', 'Deb', 'Rothwell', '8203 Foster Street', 28754, '789-243-6453', 'debroth@snet.net'),
		('p09', 'Gaston', 'Jones', '390 Pulaski Avenue', 11572, '523-643-6859', 'gjones@yahoo.com'),
		('p10', 'Dylan', 'Quincy', '46 Rockville Avenue', 48185, '890-557-4308', 'dqblizzard@yahoo.com'),
		('p11', 'Lacy', 'Goodson', '7741 Jennings Road', 64151, '432-524-8941', ''),
		('p12', 'Neil', 'Patrick Harris', '163 Gartner Drive', 24073, '903-312-5429', 'barneystinson@himym.com'),
		('p13', 'Shelly', 'Marger', '249 Acacia Circle', '60062', '329-325-8904', 'shellymargs@aol.com'),
		('p14', 'Taylor', 'Murray', '4320 Annadale Road', 11572, '573-984-2149', 'tmurray@gmail.com'),
		('p15', 'Rick', 'Sanchez', '577 Logan Street', 48174, '471-987-0426', 'rickysanchez@gmail.com');

-- Staff –
CREATE TABLE Staff (
	staffID			char(3) NOT NULL references People(personID),
	dateJoined		date NOT NULL,
	dateLeft		date,
   primary key (staffID)
);

INSERT INTO Staff (staffID, dateJoined, dateLeft)
	VALUES	
		('p04', '2017-01-24', null),
		('p06', '2017-01-13', null),
		('p09', '2017-01-26', null),
		('p10', '2017-02-01', null),
		('p11', '2017-01-13', null),
		('p13', '2017-01-13', null),
		('p14', '2017-01-20', null);

-- Specialty Codes –
CREATE TABLE specialtyCodes (
	specialtyCode		char(3) NOT NULL,
	codeDescription		text NOT NULL,
   primary key (specialtyCode)
);

INSERT INTO specialtyCodes (specialtyCode, codeDescription)
	VALUES	
		('s01', 'obedience'),
		('s02', 'small dogs'),
		('s03', 'big dogs'),
		('s04', 'dog tricks');

-- Trainers --
CREATE TABLE Trainers (
	trainerID			char(3) NOT NULL references People(personID),
	specialtyCode		char(3) NOT NULL references SpecialtyCodes(specialtyCode),
   primary key (trainerID)
);

INSERT INTO Trainers(trainerID, specialtyCode)
	VALUES	
		('p06', 's04'),
		('p09', 's01'),
		('p10', 's02'),
		('p13', 's01'),
		('p14', 's03');

-- Office Staff –
CREATE TABLE OfficeStaff (
	officeID		char(3) NOT NULL references People(personID),
	phoneExt		int,
   primary key (officeID)
);

INSERT INTO officeStaff(officeID, phoneExt)
	VALUES	
		('p04', 1313),
		('p11', 8374);

-- Owners --
CREATE TABLE Owners (
	ownerID			char(3) NOT NULL references People(personID),
   primary key(ownerID)
);

INSERT INTO Owners(ownerID)
	VALUES	
		('p01'),
		('p02'),
		('p03'),
		('p05'),
        ('p06'),
		('p07'),
		('p08'),
        ('p11'),
		('p12'),
        ('p14'),
		('p15');

-- Rooms --
CREATE TABLE Rooms (
	roomID				char(3) NOT NULL,
	roomCapacity		int NOT NULL,
   primary key (roomID)
);

INSERT INTO Rooms(roomID, roomCapacity)
	VALUES	
		('r01', 2),
		('r02', 1),
		('r03', 2),
		('r04', 1),
		('r05', 1),
		('r06', 1),
		('r07', 2),
		('r08', 4),
		('r09', 2),
		('r10', 2);

-- Stays -- 
CREATE TABLE Stays (
	stayID			char(3) NOT NULL,
	roomID			char(3) NOT NULL references Rooms(roomID),
	startDate		date NOT NULL,
	endDate			date NOT NULL CHECK (endDate > startDate),
	lengthOfStay	int NOT NULL,
   primary key (stayID)
);

INSERT INTO Stays(stayID, roomID, startDate, endDate, lengthOfStay)
	VALUES	
		('s01', 'r08', '2017-01-20', '2017-01-28', '8'),
		('s02', 'r01', '2017-01-21', '2017-01-27', '6'),
		('s03', 'r06', '2017-01-22', '2017-02-05', '14'),
		('s04', 'r02', '2017-01-23', '2017-02-01', '9'),
		('s05', 'r03', '2017-01-24', '2017-01-29', '5'),
		('s06', 'r07', '2017-01-25', '2017-02-09', '15'),
		('s07', 'r09', '2017-01-26', '2017-02-06', '11'),
		('s08', 'r05', '2017-01-27', '2017-02-01', '5'),
		('s09', 'r10', '2017-01-28', '2017-02-02', '5'),
		('s10', 'r04', '2017-01-29', '2017-02-03', '5'),
		('s11', 'r02', '2017-02-02', '2017-02-10', '8'),
		('s12', 'r05', '2017-02-02', '2017-02-07', '5');

-- Breeds --
CREATE TABLE Breeds (
	breedID			char(3) NOT NULL,
	breedName		text NOT NULL,
   primary key (breedID)
);

INSERT INTO Breeds (breedID, breedName)
	VALUES	
		('b01', 'Bernese Mountain Dog'),
		('b02', 'Bulldog'),
		('b03', 'German Shepherd'),
		('b04', 'Labrador Retriever'),
		('b05', 'Yorkshire Terrier'),
		('b06',	'Schnauzer'),
		('b07', 'Poodle'),
		('b08', 'Jack Russell'),
		('b09', 'Chihuahua'),
		('b10', 'Springer Spaniel'),
		('b11', 'Great Dane'),
		('b12', 'Newfoundland'),
		('b13', 'Dachshund'),
		('b14', 'St. Bernard'),
		('b15', 'Basset Hound');

-- Toys --
CREATE TABLE Toys (
	toyID			char(3) NOT NULL,
	description		text NOT NULL,
	priceUSD		decimal,
   primary key (toyID)
);

INSERT INTO Toys(toyID, description, priceUSD)
	VALUES	
		('t01', 'stick', '00.00'),
		('t02', 'stuffed fox butt', '10.00'),
		('t03', 'giraffe', '05.00'),
		('t04', 'rope', '09.00'),
		('t05', 'bone', '04.50'),
		('t06', 'squeaky taco', '14.00'),
		('t07', 'sushi', '15.00'),
		('t08', 'tennis ball', '04.99'),
		('t09', 'peanut butter kong', '10.99'),
		('t10', 'stuffed starbucks cup', '22.50');
        
-- Dog Personality --
CREATE TABLE dogPersonality(
	dpID			char(4),
	description		text,
   primary key (dpID)
);

INSERT INTO dogPersonality(dpID, description)
	VALUES	
		('dp01', 'cuddly'),
		('dp02', 'disobedient'),
		('dp03', 'jumpy'),
		('dp04', 'playful'),
		('dp05', 'loner'),
		('dp06', 'feisty');

-- Dogs --
CREATE TABLE Dogs(
	dogID			char(3) NOT NULL,
	name		    text,
	gender			text CHECK (gender = 'M' OR gender = 'F'),
	dogAgeYrs		int,
	ownerID			char(3) NOT NULL references Owners(ownerID),
	dpID			char(4) NOT NULL references dogPersonality(dpID),
	trainerID		char(3) NOT NULL references Trainers(trainerID),
	toyID			char(3) NOT NULL references Toys(toyID),
   primary key (dogID)
);

INSERT INTO Dogs(dogID, name, gender, dogAgeYrs, ownerID, dpID, trainerID, toyID)
	VALUES	
		('d01', 'Murphy', 'M', '3', 'p03', 'dp04', 'p09', 't07'),
		('d02', 'Tequila', 'M', '7', 'p01', 'dp01', 'p06', 't02'),
		('d03', 'Diesel', 'M', '4', 'p02', 'dp02', 'p13', 't01'),
		('d04', 'Alan', 'M', '3', 'p07', 'dp03', 'p06', 't09'),
		('d05', 'Princess', 'F', '8', 'p08', 'dp06', 'p10', 't10'), 
		('d06', 'Bonnie', 'F', '3', 'p15', 'dp05', 'p06', 't04'), 
		('d07', 'April', 'F', '6', 'p05', 'dp03', 'p09', 't10'), 
		('d08', 'Moose', 'M', '10', 'p12', 'dp02', 'p09', 't03'),
		('d09', 'Missy', 'F', '6', 'p12', 'dp03', 'p13', 't08'), 
		('d10', 'Bentley', 'M', '8', 'p06', 'dp03', 'p14', 't04'),
		('d11', 'Godiva', 'F', '7', 'p11', 'dp02', 'p13', 't05'), 
		('d12', 'Wrinkles', 'M', '4', 'p03', 'dp01', 'p06', 't10'), 
		('d13', 'Kooza', 'M', '6', 'p08', 'dp05', 'p14', 't02'),
		('d14', 'Wallace', 'M', '5', 'p14', 'dp02', 'p09', 't07'), 
		('d15', 'Reginald', 'M', '3', 'p08', 'dp06', 'p14', 't10'),  
		('d16', 'Libby', 'F', '8', 'p08', 'dp01', 'p06', 't06'), 
		('d17', 'Taquito', 'M', '4', 'p01', 'dp04', 'p10', 't03'), 
		('d18', 'Chip', 'M', '16', 'p07', 'dp06', 'p10', 't06');

-- DogType --
CREATE TABLE dogType (
	dogID			char(3) NOT NULL references Dogs(dogID),
	breedID			char(3) NOT NULL references Breeds(breedID),
	pctBreed		decimal,
   primary key (dogID, breedID)
);

INSERT INTO dogType (dogID, breedID, pctBreed)
	VALUES	
		('d01', 'b01', '1.0'),
		('d02', 'b08', '.50'),
		('d02', 'b10', '.50'),
		('d03', 'b04', '1.0'),
		('d04', 'b06', '.30'),
		('d04', 'b07', '.70'),
		('d05', 'b05', '1.0'),
		('d06', 'b14', '1.0'),
		('d07', 'b12', '.50'),
		('d07', 'b01', '.50'),
		('d08', 'b12', '.20'),
		('d08', 'b11', '.30'),
		('d08', 'b01', '.50'),
		('d09', 'b13', '.52'),
		('d09', 'b08', '.48'),
		('d10', 'b11', '1.0'),
		('d11', 'b04', '.50'),
		('d11', 'b03', '.50'),
		('d12', 'b02', '1.0'),
		('d13', 'b07', '.75'),
		('d13', 'b12', '.25'),
		('d14', 'b10', '.60'),
		('d14', 'b15', '.40'),
		('d15', 'b07', '1.0'),
		('d16', 'b06', '.50'),
		('d16', 'b08', '.50'),
		('d17', 'b09', '1.0'),
		('d18', 'b13', '1.0');

-- Bookings --
CREATE TABLE Bookings (
	dogID			char(3) NOT NULL references Dogs(dogID),
	stayID			char(3) NOT NULL references Stays(stayID),
   primary key (dogID, stayID)
);

INSERT INTO Bookings (dogID, stayID)
	VALUES	
		('d05', 's01'),
		('d13', 's01'),
		('d15', 's01'),
		('d16', 's01'),
		('d08', 's02'),
		('d09', 's02'),
		('d03', 's03'),
		('d10', 's04'),
		('d02', 's05'),
		('d17', 's05'),
		('d04', 's07'),
		('d18', 's07'),
		('d14', 's08'),
		('d01', 's09'),
		('d12', 's09'),
		('d06', 's10'),
		('d07', 's11'),
		('d11', 's12');
		
-- Views --
CREATE VIEW Trainer_Roster AS
	SELECT d.dogid, d.name, dp.description
	FROM trainers t  INNER JOIN people p ON t.trainerID = p.personID
    				 INNER JOIN dogs d ON t.trainerID = d.trainerID
                     INNER JOIN dogpersonality dp ON dp.dpid = d.dpid
    WHERE d.trainerID = 'p13'
	ORDER BY d.dogID ASC;
	
	
CREATE VIEW Owner_Information AS
	SELECT p.firstname, p.lastname, p.phonenumber, p.address, z.city, z.state, z.zipcode, d.name AS dogname
	FROM dogs d INNER JOIN owners o ON d.ownerid = o.ownerid
				INNER JOIN people p ON o.ownerID = p.personid
				INNER JOIN zipcodes z ON p.zipcode = z.zipcode
	WHERE d.dogid = 'd04';
	
CREATE VIEW Rooms_Occupied AS
SELECT d.name, r.roomID
	FROM bookings b INNER JOIN stays s ON b.stayid = s.stayid	
					INNER JOIN rooms r ON s.roomID = r.roomID
					INNER JOIN dogs d ON b.dogID = d.dogID
	WHERE s.startDate <= '2017-02-02' AND s.endDate >= '2017-02-07';

--Reports --
SELECT d.name, b.breedname
FROM dogtype dt INNER JOIN dogs d on dt.dogID = d.dogID
				INNER JOIN breeds b on dt.breedID = b.breedID
WHERE dt.pctBreed = '1.0';

SELECT b.breedName as BreedName, t.priceUSD as ToyPrice
FROM dogType dt INNER JOIN Dogs d ON dt.dogID = d.dogID
				INNER JOIN toys t ON t.toyID = d.toyID
				INNER JOIN breeds b ON dt.breedID = b.breedID
WHERE t.priceUSD > 10.00
GROUP BY b.breedName, t.priceUSD
ORDER BY t.priceUSD desc;

SELECT p.firstName, p.lastName
FROM people p LEFT JOIN owners o ON p.personID = o.ownerID
WHERE ownerID IS NULL
ORDER BY personID ASC;

SELECT o.ownerID, AVG(dogAgeYrs)
FROM dogs d INNER JOIN owners o ON d.ownerID = o.OwnerID
	       INNER JOIN people p ON o.ownerID = p.personID
GROUP BY o.ownerID
ORDER BY o.ownerID ASC;

--Stored Procedure--
CREATE OR REPLACE FUNCTION Siblings(ownerID char(3)) 
RETURNS TABLE (OwnerName text, DogName Text) AS
	$$
	BEGIN
	RETURN QUERY SELECT d.name as DogName, p.firstName as OwnerName
				 FROM dogs d INNER JOIN owners o on d.ownerID = o.ownerID
							 INNER JOIN people p on p.personID = o.ownerID
				WHERE o.ownerID is NOT NULL
                ORDER BY p.firstName;
	END;
	$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION DogName()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.name = 'Allen' THEN
		RAISE EXCEPTION 'Dog name cannot be ridiculously spelled version of Alan';
	END IF;
	
	RETURN NEW;	
	
END;
$$ LANGUAGE plpgsql;

-- Trigger--
CREATE TRIGGER DogName
BEFORE INSERT OR UPDATE ON Dogs
FOR EACH ROW
EXECUTE PROCEDURE DogName();

--Security--
CREATE ROLE OfficeStaff;
GRANT INSERT, UPDATE, DELETE, SELECT ON Dogs, People, Stays, Bookings
TO OfficeStaff;

CREATE ROLE dogTrainer;
GRANT SELECT, UPDATE ON Dogs, Trainer_Roster
TO dogTrainer;

CREATE ROLE Admin;
GRANT ALL ON ALL TABLES
IN SCHEMA PUBLIC
To Admin;







		