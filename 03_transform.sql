-- DRIVERS
INSERT INTO drivers (driver_id, name, nationality)
SELECT
  driver_id::INT,
  forename || ' ' || surname,
  nationality
FROM drivers_stage;

-- CONSTRUCTORS
INSERT INTO constructors (team_id, name)
SELECT
  constructorId::INT,
  name
FROM constructors_stage;

-- RACES
INSERT INTO races (race_id, season, round, circuit, date)
SELECT
  raceId::INT,
  year::INT,
  round::INT,
  circuitId,
  date::DATE
FROM races_stage;

-- RESULTS
INSERT INTO results (
  race_id,
  driver_id,
  team_id,
  position,
  points
)
SELECT
  race_id::INT,
  driver_id::INT,
  constructor_id::INT,

  NULLIF(position, '\N')::INT,
  NULLIF(points, '\N')::DOUBLE PRECISION

FROM results_stage
ON CONFLICT (race_id, driver_id) DO NOTHING;