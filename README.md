# Hospital-Readmissions-Analysis
An interactive SQL and Power BI project analyzing hospital patient encounter data to uncover the key drivers behind 30-day readmissions, and translate those patterns into practical recommendations for hospital administration.

# Business Problem

Hospital readmissions are costly, both financially and in terms of patient outcomes, and are widely used as an indicator of care quality. This project takes on the role of a data analyst supporting a hospital administration team trying to understand which patients are most likely to be readmitted and why, with the goal of informing better discharge planning, medication management, and follow-up care.

# Data Overview

The dataset covers patient-level hospital encounters, including demographics (age, race, gender), clinical details (diagnoses, length of stay, lab procedures), medication records across 23 tracked drug categories, prior healthcare utilization (emergency, outpatient, and inpatient visit history), and readmission status. Records with missing core identifiers were excluded prior to analysis to ensure result accuracy.

# Methodology

Data was loaded into MySQL, where it was cleaned and queried using aggregate SQL to surface readmission patterns across age, specialty, comorbidity, and medication categories. Power BI was then used to build a two-page interactive dashboard layering demographic, clinical, medication, and utilization views, with cross-filtering slicers so patterns can be explored dynamically rather than read as static charts.

# Key Insights

Age is a strong risk factor. Readmission rate climbs steadily from the youngest patients up to a clear peak in the 70 to 80 age range, before tapering slightly among the oldest patients, pointing to middle-aged and elderly patients as the priority group for intervention.

Comorbidity is the single strongest driver identified. Patients with more diagnoses recorded during their stay show both longer hospital stays and markedly higher readmission rates than patients with fewer diagnoses, a consistent pattern across the entire dataset.

Medication changes signal risk, not resolution. Patients whose diabetic medication was changed during their stay were readmitted at a higher rate than those with no change, suggesting medication adjustment often reflects a harder-to-manage case rather than an effective fix on its own.

Prior inpatient history is highly predictive. Readmission rate rises sharply as prior inpatient visit count increases, making visit history one of the clearest early-warning signals available in the data.

Medication prescribing is concentrated in a few drugs. Across all 23 tracked medication fields, dosage changes are heavily concentrated in a small handful of medications, with one drug accounting for the large majority of all recorded changes, confirmed through a dedicated SQL ranking query.

Length of stay varies widely by specialty. Some specialties average under two days per stay while others average close to ten, a gap with direct implications for staffing and resource planning.

Weaker signals. Lab procedure count and prior outpatient visits alone show only weak correlation with readmission, and treatment intensity (lab procedures, medications prescribed) shows minimal variation by gender.

# Recommendations

Based on these findings, hospital administration could prioritize enhanced discharge planning and follow-up scheduling for patients with high diagnosis counts, since comorbidity was the strongest single predictor of both longer stays and readmission. Diabetic patients experiencing a medication change during their stay would benefit from a structured post-discharge check-in, given their elevated readmission risk. Patients with a history of frequent prior inpatient visits should be flagged for proactive case management, as this group shows the sharpest readmission risk escalation in the data. Finally, reviewing prescribing consistency around the small number of medications responsible for most dosage changes could help standardize care and reduce unnecessary treatment volatility.

# SQL Structure

Schema and table creation script building the core patient encounter table
Batch insert script loading the full cleaned dataset
Core analytical queries covering readmission rate by age group, by medical specialty, by comorbidity score, by diabetes medication status, and by race and gender
Medication change frequency ranking query comparing all 23 medication indicator fields to identify the most frequently adjusted medications
Repository Structure

1. sql/ — table creation script and all analytical queries used to generate the findings above

2. powerbi/ — Power BI dashboard file containing the full two-page interactive report

3. data/ — data dictionary describing all fields in the dataset

4. screenshots/ — dashboard page screenshots and SQL query result screenshots

# Dashboard and Query Structure

SQL handles the correlation-style and ranking queries, such as medication change frequency and comorbidity aggregates, while Power BI handles the interactive, filterable visual exploration across demographics, clinical drivers, medication patterns, and utilization. The two are complementary, SQL for precise aggregate answers, Power BI for exploring patterns visually.

Page 1, Demographics Overview and Clinical Drivers, contains KPI summary cards for total patient count and overall readmission rate, alongside readmission rate breakdowns by age, race and gender, and medical specialty, plus comorbidity trend analysis and diabetes medication status, with slicers for age, gender, and diabetes medication status.

Page 2, Medication Patterns and Utilization, visualizes dosage change patterns for key medications and readmission rate trends across prior emergency, outpatient, and inpatient visit history, with slicers for medication change status, diabetes medication status, and number of prior inpatient visits.

<img width="511" height="288" alt="Screenshot 2026-08-17 161143" src="https://github.com/user-attachments/assets/5958ed3f-fba2-406c-9dea-c317f7cb5268" />

<img width="507" height="285" alt="Screenshot 2026-08-17 161150" src="https://github.com/user-attachments/assets/697904dd-ef39-4c3e-9700-54af9dca0866" />

