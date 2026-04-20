-- Podium rate per driver
SELECT
  d.name,
  COUNT(*) AS races,
  SUM(CASE WHEN r.position BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS podiums,
  ROUND(
    SUM(CASE WHEN r.position BETWEEN 1 AND 3 THEN 1 ELSE 0 END)::NUMERIC
    / COUNT(*),
    4
  ) AS podium_rate
FROM results r
JOIN drivers d ON r.driver_id = d.driver_id
GROUP BY d.name
ORDER BY podium_rate DESC
LIMIT 50;

-- Points per race efficiency
SELECT
  d.name,
  COUNT(*) AS races,
  SUM(r.points) AS total_points,
  ROUND(
    (SUM(r.points) / COUNT(*))::NUMERIC,
    4
  ) AS points_per_race
FROM results r
JOIN drivers d ON r.driver_id = d.driver_id
GROUP BY d.name
ORDER BY points_per_race DESC
LIMIT 50;

-- Average Finishing Position
SELECT
  r.season,
  d.name,
  COUNT(*) AS races,
  ROUND(AVG(res.position)::NUMERIC, 3) AS avg_finish_position
FROM results res
JOIN drivers d ON res.driver_id = d.driver_id
JOIN races r ON res.race_id = r.race_id
WHERE res.position IS NOT NULL
GROUP BY r.season, d.name
ORDER BY r.season DESC, avg_finish_position ASC;
