-- 01--How many patients does each hospital department handle,
-- and which departments have the highest patient volume?
-- SELECT "Department",
--  count(*) as total_patient
--  from healthcare_data
--  GROUP by "Department"
--  ORDER by total_patient desc;

--02-- Which disease categories contribute the largest share of the hospital's patient workload?
-- select "Disease_Category",
-- 	count(*) as total_patient
-- from healthcare_data
-- GROUP by "Disease_Category"
-- order by total_patient desc;

--03-- Which departments have the longest average patient
-- length of stay, and where could operational efficiency be improved?
-- select "Department",
-- round(avg("Length_of_Stay"),2) as avg_stay
-- from healthcare_data
-- GROUP by "Department";

-- Treatment Cost Analysis
-- 01--Which departments, disease categories, and treatment types
-- account for the highest treatment costs?
-- select "Department",
-- "Disease_Category",
-- concat(round(sum("Treatment_Cost_USD")/1000000,2),'M') as Total_cost
-- from healthcare_data
-- GROUP by "Department","Disease_Category"
-- order by Total_cost desc;

-- Readmission Analysis
-- Which disease categories and patient age groups have the highest
-- 30-day readmission rates?
-- SELECT
--     "Disease_Category",
--     CASE
--         WHEN "Age" < 30 THEN 'Under 30'
--         WHEN "Age" BETWEEN 30 AND 44 THEN '30-44'
--         WHEN "Age" BETWEEN 45 AND 59 THEN '45-59'
--         WHEN "Age" BETWEEN 60 AND 74 THEN '60-74'
--         ELSE '75+'
--     END AS age_group,

--     COUNT(*) AS total_patients,

--     COUNT(*) FILTER (
--         WHERE "Readmission_Flag" = 1
--           AND "Readmission_Days" BETWEEN 0 AND 30
--     ) AS readmitted_within_30_days,

--     ROUND(
--         100.0 * COUNT(*) FILTER (
--             WHERE "Readmission_Flag" = 1
--               AND "Readmission_Days" BETWEEN 0 AND 30
--         ) / NULLIF(COUNT(*), 0),
--         2
--     ) AS readmission_rate_pct

-- FROM healthcare_data

-- GROUP BY
--     "Disease_Category",
--     age_group

-- ORDER BY readmission_rate_pct DESC;

