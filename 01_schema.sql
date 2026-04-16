-- =========================
-- CLEAN REBUILD
-- =========================
DROP TABLE IF EXISTS results CASCADE;
DROP TABLE IF EXISTS drivers CASCADE;
DROP TABLE IF EXISTS races CASCADE;
DROP TABLE IF EXISTS constructors CASCADE;

DROP TABLE IF EXISTS results_stage CASCADE;
DROP TABLE IF EXISTS drivers_stage CASCADE;
DROP TABLE IF EXISTS races_stage CASCADE;
DROP TABLE IF EXISTS constructors_stage CASCADE;

-- =========================
-- STAGING TABLES (RAW INGESTION)
-- =========================

CREATE TABLE drivers_stage (
  driver_id TEXT,
  driver_ref TEXT,
  number TEXT,
  code TEXT,
  forename TEXT,
  surname TEXT,
  dob TEXT,
  nationality TEXT,
  url TEXT
);

CREATE TABLE constructors_stage (
  constructorId TEXT,
  constructorRef TEXT,
  name TEXT,
  nationality TEXT,
  url TEXT
);

CREATE TABLE races_stage (
  raceId TEXT,
  year TEXT,
  round TEXT,
  circuitId TEXT,
  name TEXT,
  date TEXT,
  time TEXT,
  url TEXT,
  fp1_date TEXT,
  fp1_time TEXT,
  fp2_date TEXT,
  fp2_time TEXT,
  fp3_date TEXT,
  fp3_time TEXT,
  quali_date TEXT,
  quali_time TEXT,
  sprint_date TEXT,
  sprint_time TEXT
);

CREATE TABLE results_stage (
  result_id TEXT,
  race_id TEXT,
  driver_id TEXT,
  constructor_id TEXT,
  number TEXT,
  grid TEXT,
  position TEXT,
  position_text TEXT,
  position_order TEXT,
  points TEXT,
  laps TEXT,
  time TEXT,
  milliseconds TEXT,
  fastest_lap TEXT,
  rank TEXT,
  fastest_lap_time TEXT,
  fastest_lap_speed TEXT,
  status_id TEXT
);

-- =========================
-- CLEAN RELATIONAL TABLES
-- =========================

CREATE TABLE drivers (
  driver_id INT PRIMARY KEY,
  name TEXT,
  nationality TEXT
);

CREATE TABLE constructors (
  team_id INT PRIMARY KEY,
  name TEXT
);

CREATE TABLE races (
  race_id INT PRIMARY KEY,
  season INT,
  round INT,
  circuit TEXT,
  date DATE
);

CREATE TABLE results (
  race_id INT NOT NULL,
  driver_id INT NOT NULL,
  team_id INT,
  position INT,
  points DOUBLE PRECISION,

  PRIMARY KEY (race_id, driver_id),

  FOREIGN KEY (race_id) REFERENCES races(race_id),
  FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
  FOREIGN KEY (team_id) REFERENCES constructors(team_id)
);