CREATE TYPE "prep_type" AS ENUM (
  'wet',
  'dry'
);

CREATE TYPE "prep_wet" AS ENUM (
  'formol',
  'alcool'
);

CREATE TYPE "prep_dry" AS ENUM (
  'montado'
);

CREATE TYPE "land_use_class" AS ENUM (
  'Old_growth_forest',
  'Logged_forest',
  'Secondary_forest'
);

CREATE TYPE "events" AS ENUM (
  'Fire Ocorrency',
  'Plantation',
  'Exposed Soil',
  '...'
);

CREATE TYPE "soil_suborder" AS ENUM (
  'Plitossolo',
  'Latossolo',
  'Tabuleiro',
  '...'
);

CREATE TYPE "soil_order" AS ENUM (
  'Pétrico',
  'Oxisol',
  'Amarelo',
  '...'
);

CREATE TYPE "relief" AS ENUM (
  'A',
  'B',
  '...'
);

CREATE TYPE "topography" AS ENUM (
  'topo convexo',
  'topo tabular',
  '...'
);

CREATE TYPE "depth_class" AS ENUM (
  'L: Litter',
  '0-10',
  '10-20'
);

CREATE TYPE "conservation_unit_class" AS ENUM (
  'IUCN'
);

CREATE TYPE "biome" AS ENUM (
  'colocar classes aqui'
);

CREATE TYPE "vegetation_physignomia" AS ENUM (
  'colocar classes aqui'
);

CREATE TYPE "sexo" AS ENUM (
  'macho',
  'femea',
  'hermaphodite'
);

CREATE TYPE "caste" AS ENUM (
  'rainha',
  'operaria'
);

CREATE TYPE "development_stage" AS ENUM (
  'ovo',
  'larva',
  'pupa',
  'juvenil'
);

CREATE TABLE "animal_sample" (
  "id" SERIAL PRIMARY KEY,
  "fk_animal" integer,
  "sampling_data" varchar,
  "preparation_environment" prep_type,
  "preparation_type" varchar,
  "soil_moisture" varchar,
  "bulk_density" varchar,
  "monolith_identification" integer
);

CREATE TABLE "catalog" (
  "tombo" varchar PRIMARY KEY,
  "fk_animal_sample" integer,
  "fk_collector" integer,
  "fk_catalogger" integer,
  "fk_determiner" integer,
  "fk_species_author" integer,
  "fk_subspecies_author" integer,
  "catalog_number" integer,
  "catalog_type" varchar
);

CREATE TABLE "collector" (
  "id" int PRIMARY KEY,
  "first_name" varchar(15),
  "last_name" varchar(15)
);

CREATE TABLE "determiner" (
  "id" integer PRIMARY KEY,
  "first_name" varchar(15),
  "middle_name_initials" varchar(15),
  "last_name" varchar(15),
  "determination_date" date
);

CREATE TABLE "species_author" (
  "id" integer PRIMARY KEY,
  "last_name" varchar(15),
  "class_year" year
);

CREATE TABLE "subspecies_author" (
  "id" integer PRIMARY KEY,
  "last_name" varchar(15),
  "class_year" year
);

CREATE TABLE "catalogger" (
  "id" integer PRIMARY KEY,
  "first_name" varchar,
  "middle_name_initials" varchar,
  "last_name" varchar,
  "cataloged_date" date
);

CREATE TABLE "plot_chem_comp_history" (
  "id" SERIAL PRIMARY KEY,
  "sand_thick" numeric,
  "sand_fine" numeric,
  "silt" numeric,
  "clay" numeric,
  "texture" varchar,
  "ph" numeric,
  "acidity" numeric,
  "hal" numeric,
  "k" numeric,
  "ca" numeric,
  "mg" numeric,
  "p" numeric,
  "mo" numeric,
  "c" numeric,
  "na" numeric,
  "al" numeric,
  "h" numeric,
  "bases_sum" numeric,
  "ctc" numeric,
  "v" numeric,
  "n" numeric,
  "cn" numeric
);

CREATE TABLE "chem_comp" (
  "id" SERIAL PRIMARY KEY,
  "sand_thick" numeric,
  "sand_fine" numeric,
  "silt" numeric,
  "clay" numeric,
  "texture" varchar,
  "ph" numeric,
  "acidity" numeric,
  "hal" numeric,
  "k" numeric,
  "ca" numeric,
  "mg" numeric,
  "p" numeric,
  "mo" numeric,
  "c" numeric,
  "na" numeric,
  "al" numeric,
  "h" numeric,
  "bases_sum" numeric,
  "ctc" numeric,
  "v" numeric,
  "n" numeric,
  "cn" numeric
);

CREATE TABLE "carbon_history" (
  "id" integer,
  "PalmC" decimal,
  "PalmD" decimal,
  "Babassu" decimal,
  "Tucum" decimal,
  "TreeC" decimal,
  "TreeD" decimal,
  "Height" decimal,
  "VC_Height" decimal,
  "DBH" decimal,
  "VC_DBH" decimal,
  "BA" decimal,
  "ShrubC" decimal,
  "ShrubD" decimal,
  "ShrubDBH" decimal,
  "VC_ShrubDBH" decimal,
  "VC_TSDBH" decimal,
  "TSC" decimal,
  "TotalD" decimal,
  "NecroC" decimal,
  "LitterC" decimal,
  "FineNC" decimal,
  "HerbC" decimal,
  "AGC" decimal
);

CREATE TABLE "climate_history" (
  "id" SERIAL PRIMARY KEY,
  "clima_koppen" varchar,
  "precipitation_month_mean_WC" numeric,
  "precipitation_anual_mean_WC" numeric,
  "temperature_month_mean_WC" numeric,
  "temperature_annual_mean_WC" numeric
);

CREATE TABLE "plot" (
  "station_field_number" SERIAL PRIMARY KEY,
  "fk_climates" integer,
  "fk_chem_phys" integer,
  "fk_sampling_history" integer,
  "fk_land_user_history" integer,
  "fk_carbon" integer,
  "land_ower" varchar,
  "name" varchar,
  "municipality" varchar,
  "state" varchar,
  "country" varchar,
  "continent" varchar,
  "conservation_unit_class" conservation_unit_class,
  "conservation_unit_name" varchar,
  "previous_land_use" land_use_class,
  "lat" numeric,
  "log" numeric,
  "landform" relief,
  "topography" topography,
  "soil_order" soil_order,
  "soil_suborder" soil_suborder,
  "biome" biome,
  "vegetation_physignomy" vegetation_physignomia,
  "vegetation_age" integer,
  "land_use" land_use_class,
  "dem" decimal,
  "hand" decimal
);

CREATE TABLE "land_use_history" (
  "id" SERIAL PRIMARY KEY,
  "vegetation_age" numeric,
  "previous_land_use" varchar,
  "sucession_age" numeric,
  "first_cut_age" numeric,
  "slash_burn_frequency" float8,
  "events" events,
  "date" datetime,
  "observations" text
);

CREATE TABLE "sampling_history" (
  "id" SERIAL PRIMARY KEY,
  "fk_monolith" integer,
  "fk_trap" integer,
  "method" varchar,
  "sampling_date" varchar,
  "season" varchar,
  "observations" text
);

CREATE TABLE "monolith" (
  "id" SERIAL PRIMARY KEY,
  "fk_catalog" integer,
  "fk_monolith_chem" integer,
  "monolith_code" varchar,
  "monolith_number_count" integer,
  "area" decimal,
  "soil_depth" decimal,
  "soil_layer" depth_class
);

CREATE TABLE "trap" (
  "id" SERIAL PRIMARY KEY,
  "fk_catalog" integer,
  "fk_monolith_chem" integer,
  "trap_number" integer,
  "count" integer,
  "type" varchar(255)
);

CREATE TABLE "animals" (
  "id" SERIAL PRIMARY KEY,
  "kingdom" varchar(255),
  "phylum" varchar(255),
  "class" varchar(255),
  "subclass" varchar(255),
  "order" varchar(255),
  "family" varchar(255),
  "subfamily" varchar(255),
  "genus" varchar(255),
  "subgenus" varchar(255),
  "epiteto" varchar(255),
  "species" varchar(255),
  "subspecies" varchar(255),
  "functional_group" varchar(255),
  "abundance" integer,
  "sexo" sexo,
  "caste" caste,
  "development_stage" development_stage,
  "determination_start" date,
  "determination_end" date,
  "biomass" decimal
);

COMMENT ON COLUMN "animal_sample"."preparation_type" IS 'prep_wet ou prep_dry';

COMMENT ON COLUMN "plot"."station_field_number" IS 'Station field number, inteiro';

COMMENT ON COLUMN "monolith"."monolith_number_count" IS 'contador';

ALTER TABLE "animal_sample" ADD FOREIGN KEY ("fk_animal") REFERENCES "animals" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("fk_animal_sample") REFERENCES "animal_sample" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("fk_collector") REFERENCES "collector" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("fk_catalogger") REFERENCES "catalogger" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("fk_determiner") REFERENCES "determiner" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("fk_species_author") REFERENCES "species_author" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("fk_subspecies_author") REFERENCES "subspecies_author" ("id");

ALTER TABLE "climate_history" ADD FOREIGN KEY ("id") REFERENCES "plot" ("fk_climates");

ALTER TABLE "plot" ADD FOREIGN KEY ("fk_chem_phys") REFERENCES "plot_chem_comp_history" ("id");

ALTER TABLE "sampling_history" ADD FOREIGN KEY ("id") REFERENCES "plot" ("fk_sampling_history");

ALTER TABLE "land_use_history" ADD FOREIGN KEY ("id") REFERENCES "plot" ("fk_land_user_history");

ALTER TABLE "plot" ADD FOREIGN KEY ("fk_carbon") REFERENCES "carbon_history" ("id");

ALTER TABLE "sampling_history" ADD FOREIGN KEY ("fk_monolith") REFERENCES "monolith" ("id");

ALTER TABLE "sampling_history" ADD FOREIGN KEY ("fk_trap") REFERENCES "trap" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("tombo") REFERENCES "monolith" ("fk_catalog");

ALTER TABLE "monolith" ADD FOREIGN KEY ("fk_monolith_chem") REFERENCES "chem_comp" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("tombo") REFERENCES "trap" ("fk_catalog");

ALTER TABLE "trap" ADD FOREIGN KEY ("fk_monolith_chem") REFERENCES "chem_comp" ("id");
