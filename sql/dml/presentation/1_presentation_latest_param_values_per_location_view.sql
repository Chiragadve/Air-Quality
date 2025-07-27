-- air_quality.presentation.latest_param_values_per_location source

CREATE OR REPLACE VIEW presentation.latest_param_values_per_location AS WITH ranked_data AS (
SELECT
    location_id,
    "location",
    lat,
    lon,
    parameter,
    "value",
    datetime,
    row_number() OVER (PARTITION BY location_id,
    parameter
ORDER BY
    datetime DESC) AS rn
FROM
    presentation.air_quality_data
ORDER BY
    rn ASC
)SELECT
    *
FROM
    (
    SELECT
        location_id,
        "location",
        lat,
        lon,
        parameter,
        "value",
        datetime
    FROM
        ranked_data
    WHERE
        (rn = 1)) PIVOT ("first"("value") FOR (parameter) IN ('pm10', 'pm25', 'so2'));