# US Road Accidents Data Analytics (Power BI + BigQuery)

A cloud-integrated BI project analyzing multi-year US road accident data to identify severity, spatial hotspots, and environment-related risk patterns. Built using BigQuery for modeling and Power BI for interactive dashboards.

## Tech stack
- Google BigQuery (data warehouse, transformations)
- Power BI (Power Query, DAX, visualizations)
- SQL for ETL & dimensional modeling
- Optional: Python notebooks for EDA

## What this repo contains
- `sql/` : BigQuery modeling scripts (CTEs, views, dimension tables)
- `powerbi/` : Power BI file (`.pbix`) if shareable
- `powerquery/` : Power Query M steps and notes
- `dax/` : Key DAX measures used in dashboards
- `data/` : small sample dataset for local exploration
- `screenshots/` : dashboard screenshots showing key pages
- `docs/` : data model diagram and architecture notes

## Pipeline summary
1. Raw datasets ingested to BigQuery (partitioned by date)
2. ETL transforms and cleansing using BigQuery SQL, materialized views
3. Dimensional model created with fact_accidents and dimensions (location, weather, vehicle, time)
4. Power BI connects to BigQuery, applies additional Power Query transforms, calculates DAX measures, and exposes interactive visualizations

## Key measures and insights
- Severity index (weighted by injuries/fatalities)
- Incidents per 100k population
- Time-of-day and weather-conditioned risk trends
- Spatial hotspot maps with drillthrough

## How to reproduce locally (sample)
1. Open `data/sample_accidents.csv` in Power BI Desktop
2. Apply the Power Query steps from `powerquery/etl_steps_m.txt`
3. Add the DAX measures from `dax/measures.txt`
4. Use screenshots for visual guidance in `screenshots/`

## Notes on sharing
Full raw datasets and the original `.pbix` may contain sensitive or licensed data and may not be shareable. This repo contains sample data and exported scripts to show design and technical skills.

