-- air_quality.presentation.air_quality_data source

CREATE OR REPLACE VIEW presentation.air_quality_data AS WITH ranked_data AS (
SELECT
    *,
    row_number() OVER (PARTITION BY location_id,
    sensors_id,
    datetime,
    parameter
ORDER BY
    ingestion_datetime DESC) AS rn
FROM
    raw.air_quality_data
WHERE
    ((parameter IN ('pm10', 'pm25', 'so2'))
        AND ("value" >= 0))
)SELECT
    location_id,
    sensors_id,
    "location",
    datetime,
    lat,
    lon,
    parameter,
    units,
    "value",
    "month",
    "year",
    ingestion_datetime
FROM
    ranked_data
WHERE
    (rn = 1);