CREATE TABLE "bron" (
  "seria_numer" varchar PRIMARY KEY,
  "id_typ_sprzetu" integer,
  "data_aktualizacji" timestamp DEFAULT NOW()
);

CREATE TABLE "typ_sprzetu" (
  "id_typ_sprzetu" SERIAL PRIMARY KEY,
  "rodzaj" varchar,
  "nazwa" varchar,
  "kaliber" varchar
);

CREATE TABLE "oo_1" (
  "id_oo_1" SERIAL PRIMARY KEY,
  "jednostka_broni" varchar,
  "data_wykonania" date,
  "data_waznosci" date,
  "data_aktualizacji" timestamp DEFAULT NOW()
);

CREATE TABLE "oo_2" (
  "id_oo_2" SERIAL PRIMARY KEY,
  "jednostka_broni" varchar,
  "data_wykonania" date,
  "data_waznosci" date,
  "data_aktualizacji" timestamp DEFAULT NOW()
);

ALTER TABLE "bron" ADD FOREIGN KEY ("id_typ_sprzetu") REFERENCES "typ_sprzetu" ("id_typ_sprzetu");

ALTER TABLE "oo_1" ADD FOREIGN KEY ("jednostka_broni") REFERENCES "bron" ("seria_numer");

ALTER TABLE "oo_2" ADD FOREIGN KEY ("jednostka_broni") REFERENCES "bron" ("seria_numer");
