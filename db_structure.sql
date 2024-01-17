CREATE DATABASE depot
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  CONNECTION LIMIT = -1
  IS_TEMPLATE = False;

CREATE TABLE public.equipment (
  equipment_id VARCHAR(32) NOT NULL,
  equipment_type_id INT NOT NULL,
  last_updated TIMESTAMP DEFAULT NOW(),
  CONSTRAINT equipment_pk PRIMARY KEY (equipment_id)
);

CREATE TABLE public.equipment_type (
  equipment_type_id SERIAL NOT NULL,
  equipment_type VARCHAR(64) NOT NULL,
  name VARCHAR(64) NOT NULL,
  CONSTRAINT equipment_type_pk PRIMARY KEY (equipment_type_id)
);

CREATE TABLE public.inspection_lvl_1 (
  inspection_lvl_1_id SERIAL NOT NULL,
  equipment_id VARCHAR(32) NOT NULL,
  inspection_date DATE NOT NULL,
  expiry_date DATE NOT NULL,
  last_updated TIMESTAMP DEFAULT NOW(),
  CONSTRAINT inspection_lvl_1_pk PRIMARY KEY (inspection_lvl_1_id)
);

CREATE TABLE public.inspection_lvl_2 (
  inspection_lvl_2_id SERIAL NOT NULL,
  equipment_id VARCHAR(32) NOT NULL,
  inspection_date DATE NOT NULL,
  expiry_date DATE NOT NULL,
  last_updated TIMESTAMP DEFAULT NOW(),
  CONSTRAINT inspection_lvl_2_pk PRIMARY KEY (inspection_lvl_2_id)
);

ALTER TABLE public.equipment
ADD FOREIGN KEY (equipment_type_id) REFERENCES equipment_type,
ADD UNIQUE (equipment_id);

ALTER TABLE public.inspection_lvl_1
ADD FOREIGN KEY (equipment_id) REFERENCES equipment,
ADD CONSTRAINT inspection_lvl_1_unique UNIQUE (equipment_id, inspection_date, expiry_date);

ALTER TABLE public.inspection_lvl_2
ADD FOREIGN KEY (equipment_id) REFERENCES equipment (equipment_id),
ADD CONSTRAINT inspection_lvl_2_unique UNIQUE (equipment_id, inspection_date, expiry_date);
