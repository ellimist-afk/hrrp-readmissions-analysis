-- Export the state summary view and a hospital-level cleaned dataset
-- as CSVs for ingestion into Tableau Public (which can't connect to Postgres directly).

\copy (SELECT * FROM hrrp_state_summary) TO '/tmp/hrrp_state_summary.csv' WITH (FORMAT csv, HEADER true);

\copy (
    SELECT facility_id, facility_name, state, measure_name,
           CASE WHEN excess_readmission_ratio ~ '^[0-9]+(\.[0-9]+)?$'
                THEN excess_readmission_ratio::numeric ELSE NULL END AS err
    FROM hrrp_raw
    WHERE excess_readmission_ratio ~ '^[0-9]+(\.[0-9]+)?$'
) TO '/tmp/hrrp_hospitals.csv' WITH (FORMAT csv, HEADER true);
