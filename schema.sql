/* Database schema to keep the structure of entire database. */
drop TABLE if exists animals;
CREATE TABLE animals(
	id SERIAL PRIMARY KEY NOT NULL,
    species_id INT,
    owners_id INT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts NUMERIC NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    FOREIGN KEY (species_id)
      REFERENCES species (id),
    FOREIGN KEY (owners_id)
      REFERENCES owners (id)
	)

drop TABLE if exists owners CASCADE;
create table owners (
  id bigserial,
  full_name varchar(100) not null,
  age integer,
  primary key (id)
)

drop TABLE if exists species CASCADE;
create table species (
    id bigserial,
	name varchar(100) not null,
	primary key (id)
)

CREATE TABLE IF NOT EXISTS vets(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  age NUMERIC NOT NULL,
  date_of_graduation date NOT NULL
);

CREATE TABLE IF NOT EXISTS specializations(
  vet_id INT,
  species_id INT,
  FOREIGN KEY (species_id)
      REFERENCES species (id),
  FOREIGN KEY (vet_id)
      REFERENCES vets (id)
);

CREATE TABLE IF NOT EXISTS visits(
  animal_id INT,
  vet_id INT,
  visit_date date,
  FOREIGN KEY (animal_id)
      REFERENCES animals (id),
  FOREIGN KEY (vet_id)
      REFERENCES vets (id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX ON visits(animal_id);
CREATE INDEX ON visits(vet_id);
CREATE INDEX ON owners(email);