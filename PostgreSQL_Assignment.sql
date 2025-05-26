-- Active: 1747545730198@@localhost@5432@conservation_db

CREATE DATABASE conservation_db;

-- clear   all previous data
-- DROP TABLE IF EXISTS sightings CASCADE;
-- DROP TABLE IF EXISTS species CASCADE;
-- DROP TABLE IF EXISTS rangers CASCADE;


-- CREATE DATABASE conservation_db;

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region TEXT NOT NULL
);


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT   -- Endangered  || Vulnerable
);



CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL REFERENCES rangers(ranger_id),
    species_id INT NOT NULL REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);


-- Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers (name, region) VALUES
('Derek Fox','Coastal Plains');




-- Count unique species ever sighted.

SELECT COUNT(DISTINCT(species_id)) as "unique_species_count"
    FROM sightings;


-- Find all sightings where the location includes "Pass".

SELECT * 
    FROM sightings
    WHERE location ILIKE '%Pass%';


-- List each ranger's name and their total number of sightings.
SELECT name, COUNT(sighting_id) as total_sightings
FROM rangers
JOIN sightings USING(ranger_id)
GROUP BY name;


--  List species that have never been sighted.

SELECT common_name 
    FROM species   
    WHERE species_id NOT IN (
        SELECT DISTINCT species_id FROM sightings
        )
;

-- Show the most recent 2 sightings.

SELECT common_name,sighting_time,name  FROM sightings
JOIN rangers USING(ranger_id)
JOIN species USING(species_id)
ORDER BY sighting_time DESC
LIMIT 2
;


