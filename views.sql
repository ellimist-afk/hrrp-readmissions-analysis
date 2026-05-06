-- State-level summary view powering the Tableau choropleth.
-- Demonstrates: regex-based defensive casting, CTE composition,
-- conditional aggregation, and a window function for peer ranking.

CREATE OR REPLACE VIEW hrrp_state_summary AS
WITH cleaned AS (
    SELECT state, measure_name,
           CASE WHEN excess_readmission_ratio ~ '^[0-9]+(\.[0-9]+)?$'
                THEN excess_readmission_ratio::numeric
                ELSE NULL END AS err
    FROM hrrp_raw
),
state_avg AS (
    SELECT state, measure_name,
           AVG(err) AS avg_err,
           COUNT(*) FILTER (WHERE err IS NOT NULL) AS hospital_count
    FROM cleaned
    GROUP BY state, measure_name
)
SELECT state, measure_name, avg_err, hospital_count,
       RANK() OVER (PARTITION BY measure_name ORDER BY avg_err DESC) AS rank_within_measure
FROM state_avg
WHERE avg_err IS NOT NULL;
