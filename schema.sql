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