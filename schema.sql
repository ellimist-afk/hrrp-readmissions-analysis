-- Raw HRRP table mirroring CMS public dataset structure.
-- All columns text on purpose — defers casting to the cleaning view
-- so the load is forgiving of CMS placeholder values like "Not Available" or "N/A".

CREATE TABLE hrrp_raw (
    facility_name text,
    facility_id text,
    state text,
    measure_name text,
    number_of_discharges text,
    footnote text,
    excess_readmission_ratio text,
    predicted_readmission_rate text,
    expected_readmission_rate text,
    number_of_readmissions text,
    start_date text,
    end_date text
);

-- Load with: \copy hrrp_raw FROM 'FY_2026_Hospital_Readmissions_Reduction_Program_Hospital.csv' WITH (FORMAT csv, HEADER true);
