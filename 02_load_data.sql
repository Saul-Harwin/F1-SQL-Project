-- STAGING LOADS
-- Loads the data into the staging table ready to be cleaned.
\copy drivers_stage FROM './data/Drivers.csv' CSV HEADER NULL '\N' ENCODING 'UTF-8';

\copy constructors_stage FROM './data/Constructor.csv' CSV HEADER NULL '\N' ENCODING 'UTF-8';

\copy races_stage FROM './data/Races.csv' CSV HEADER NULL '\N' ENCODING 'UTF-8';

\copy results_stage FROM './data/Results.csv' CSV HEADER NULL '\N' ENCODING 'UTF-8';
