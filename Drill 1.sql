/*DRILL 1 */

SELECT * FROM tbl_habitat;

/*DRILL 2 */

SELECT species_name FROM tbl_species WHERE species_order = 3;

/*DRILL 3 */

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

/*DRILL 4 */

SELECT species_name FROM tbl_species WHERE species_nutrition >2201 AND species_nutrition < 2207;

/*DRILL 5 INCOMPLETE */
SELECT species_name AS 'Species Name',  nutrition_type AS 'Nutrition Type'
FROM tbl_species, tbl_nutrition WHERE tbl_species.species_nutrition = tbl_nutrition.nutrition_id;
/* OR */
SELECT species_name AS 'Species Name',  nutrition_type AS 'Nutrition Type'
FROM tbl_species
INNER JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;

/*DRILL 6 */

SELECT specialist_fname,specialist_lname,specialist_contact
FROM tbl_specialist
INNER JOIN tbl_care ON tbl_care.care_specialist=tbl_specialist.specialist_id
INNER JOIN tbl_species ON tbl_species.species_care= tbl_care.care_id
WHERE species_name='penguin';

/*DRILL 7 */

CREATE TABLE identifier (
	identifier_id INT NOT NULL IDENTITY (1,1),
	identifier_name VARCHAR(50) NOT NULL,
	identifier_phoneNumber varchar(50) PRIMARY KEY NOT NULL
	
);

CREATE TABLE preference(
	preference_accountNumber INT NOT NULL IDENTITY(1000,1),
	preference_username varchar(50) NOT NULL,
	preference_phoneNumber varchar(50) NOT NULL
		FOREIGN KEY (preference_phoneNumber) REFERENCES identifier(identifier_phoneNumber) 
);
	
INSERT INTO identifier
(identifier_name,identifier_phoneNumber)
VALUES
('Nathan','400-7776');


INSERT INTO preference
(preference_username,preference_phoneNumber)
VALUES
('N8thegr8m8','400-7776');

SELECT * FROM preference,identifier;
