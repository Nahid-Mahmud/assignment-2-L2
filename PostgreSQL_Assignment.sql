-- Active: 1747545730198@@localhost@5432@ph

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

SELECT count(DISTINCT(species_id)) as "unique_species_count"
    FROM sightings;



