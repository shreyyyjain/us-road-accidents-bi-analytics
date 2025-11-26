-- bigquery_modeling.sql
-- Build staging, dims and fact for US road accidents

-- 1. Staging (example)
CREATE OR REPLACE TABLE `project.dataset.stg_accidents` AS
SELECT
  incident_id,
  event_date,
  CAST(event_date AS DATE) as event_date_only,
  state,
  county,
  latitude,
  longitude,
  vehicles_involved,
  total_injuries,
  total_fatalities,
  weather_condition,
  CASE
    WHEN total_fatalities > 0 THEN 'Fatal'
    WHEN total_injuries > 0 THEN 'Injury'
    ELSE 'Property Damage'
  END AS severity_level,
  -- sample engineered features
  EXTRACT(HOUR FROM TIMESTAMP(event_date)) AS hour_of_day,
  SAFE_CAST(speed_limit AS INT64) AS speed_limit
FROM
  `project.dataset.raw_accidents`;

-- 2. Dimension: dim_time
CREATE OR REPLACE TABLE `project.dataset.dim_time` AS
SELECT DISTINCT
  event_date_only AS date,
  EXTRACT(YEAR FROM event_date_only) AS year,
  EXTRACT(MONTH FROM event_date_only) AS month,
  FORMAT_DATE('%b', event_date_only) AS month_name,
  EXTRACT(DAY FROM event_date_only) AS day,
  EXTRACT(DAYOFWEEK FROM event_date_only) AS weekday
FROM `project.dataset.stg_accidents`;

-- 3. Fact table
CREATE OR REPLACE TABLE `project.dataset.fact_accidents` AS
SELECT
  incident_id,
  event_date_only AS date,
  state,
  county,
  latitude,
  longitude,
  severity_level,
  total_injuries,
  total_fatalities,
  vehicles_involved,
  hour_of_day,
  weather_condition
FROM `project.dataset.stg_accidents`;
 