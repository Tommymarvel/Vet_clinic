/*Queries that provide answers to the questions from all projects.*/

SELECT name from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE EXTRACT(year from date_of_birth) BETWEEN 2016 AND 2019;
SELECT name from animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3; 

begin;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
rollback;
select * from animals;

begin
update animals set species = 'digimon' where name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
commit
select * from animals

begin
delete from animals
rollback
select * from animals

begin
delete from animals where date_of_birth > '2022-1-1'
savepoint check1
select * from animals
update animals set weight_kg = weight_kg * -1
select * from animals
rollback to check1
select * from animals
update animals set weight_kg = weight_kg * -1 where weight_kg < 0 ;
select * from animals
commit
select * from animals

SELECT count(*) FROM animals;

select * from animals;

SELECT count(*) FROM animals WHERE escape_attempts = 0;

select * from animals;

SELECT avg(weight_kg) FROM animals;

select * from animals;

SELECT max(escape_attempts),neutered FROM animals WHERE neutered = true OR neutered = false GROUP BY neutered ORDER BY max(escape_attempts) DESC;

select * from animals;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

select * from animals;

SELECT species, cast(avg(escape_attempts) AS DECIMAL(5,1)) FROM animals
   GROUP BY species
   WHERE  date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31';

select * from animals;

SELECT 
an.name AS animal_name,
ow.full_name AS owner_name 
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id 
WHERE ow.full_name = 'Melody Pond';

SELECT 
an.name AS animal_name, 
sp.name AS species 
FROM animals an 
INNER JOIN species sp
ON sp.id = an.species_id
WHERE sp.name = 'Pokemon';

SELECT
ow.full_name as owner_name,
an.name as animal_name
FROM owners ow
LEFT JOIN animals an
ON ow.id = an.owners_id

SELECT 
sp.name AS species_name,
COUNT(an.name) AS animal_count
FROM animals an 
INNER JOIN species sp
ON sp.id = an.species_id
GROUP BY sp.name;

SELECT 
ow.full_name as owner_name,
sp.name as species_name,
an.name as animal_name
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id
INNER JOIN species sp
ON sp.id = an.owners_id
WHERE ow.full_name = 'Jennifer Orwell';

SELECT 
ow.full_name as owner_name,
an.name as animal_name,
an.escape_attempts as check_attempts
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id
WHERE an.escape_attempts = 0 
AND ow.full_name = 'Dean Winchester';

SELECT 
COUNT(an.name) AS animal_count,
ow.full_name AS owner_name 
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id 
GROUP BY ow.full_name 
ORDER BY MAX(an.name) DESC;