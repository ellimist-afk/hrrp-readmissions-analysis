# CMS Hospital Readmissions Analysis

End-to-end analytics pipeline analyzing the CMS Hospital Readmissions Reduction Program (HRRP) public dataset. Raw hospital-level data is loaded into PostgreSQL, cleaned and aggregated via SQL views, and surfaced through an interactive Tableau dashboard.

## Live Dashboard

https://public.tableau.com/app/profile/alan.liu5274/viz/Hospital_Readmissions_Dashboard_17780738716580/Dashboard1

The dashboard pairs a state-level choropleth of average Excess Readmission Ratio (ERR) with a condition-level breakdown across the six HRRP measures: AMI, heart failure, pneumonia, COPD, CABG, and hip/knee replacement. Clicking any state filters the condition view to that state.

## Architecture

CMS HRRP CSV → PostgreSQL (`hrrp_raw` table) → SQL view (`hrrp_state_summary`) → CSV export → Tableau Public dashboard

## Files

- `schema.sql` — table definition for raw HRRP data
- `views.sql` — cleaning and aggregation view (CTEs, window function, regex casting)
- `exports.sql` — CSV export commands for Tableau Public ingestion

## Running

1. Download the FY 2026 HRRP CSV from https://data.cms.gov/provider-data/dataset/9n3s-kdb3
2. Run `schema.sql` to create the table
3. Load the CSV with `\copy hrrp_raw FROM 'FY_2026_Hospital_Readmissions_Reduction_Program_Hospital.csv' WITH (FORMAT csv, HEADER true);`
4. Run `views.sql` to create the cleaning/aggregation view
5. Run `exports.sql` to produce the Tableau-ready CSV files

## About the Data

HRRP is a Medicare value-based program (established by the Affordable Care Act, effective 2012) that reduces payments to hospitals with excess 30-day readmissions. Penalty is capped at 3% of Medicare base operating payments. ERR is the ratio of predicted to expected readmissions; ERR > 1.0 indicates a hospital readmits more than expected for its case mix.
