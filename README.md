# Hospital Readmissions Analysis

**Domain:** Healthcare Operations | **Tools:** SQL (MySQL), Power BI, Power Query, Excel

I analysed 48,911 hospital patient encounters to find out which patients are most likely to come back after discharge and why, so the hospital can focus discharge planning and follow-up care where it matters most.

![Dashboard](Hospital%20readmissions-powerbi%20dashboard.png)

---

## Business Problem

Readmissions cost hospitals money and are a key measure of care quality. The hospital wanted to know:

1. What share of patients are readmitted?
2. Which patient groups are most at risk (age, conditions, medication, past visits)?
3. Which departments see the most readmissions?
4. Where should discharge and follow-up teams focus first?

## Headline Results

| Metric | Result |
|---|---|
| Patient encounters analysed | **48,911** |
| Patients readmitted | **22,609** |
| Readmission rate | **46.2%** |
| Highest-risk age group | **70-80**, at 48.2% |
| Patients with 9+ diagnoses | **50.7%** readmitted vs 22.6% with 1 diagnosis |
| On diabetes medication | **47.9%** readmitted vs 40.5% not on it |

## Key Findings

1. **More health conditions means more readmissions.** Readmission climbs steadily with the number of diagnoses, from 22.6% for 1 diagnosis to 50.7% for 9. Average stay length also doubles, from 2.3 to 5.0 days.
2. **Past hospital visits predict future ones.** Patients with no previous inpatient stays are readmitted around 40% of the time. With 5 or more previous stays this rises above 80%. This is the strongest single signal in the dashboard.
3. **Older patients return more often.** Readmission rises with age and peaks at 70-80 (48.2%). The 60-90 range sits at 47-48%, while under-10s are lowest at 19.5%.
4. **Diabetes medication patients are higher risk.** 47.9% readmitted vs 40.5% for patients not on diabetes medication, and they make up 80% of all readmissions.
5. **Nephrology and Emergency/Trauma need attention.** Among departments with real volume, Nephrology (801 patients, 55.9%) and Emergency/Trauma (3,642 patients, 50.4%) have the highest readmission rates. Smaller specialties show 60-100% rates, but on fewer than 50 patients each, so I treated those with caution.
6. **Gender makes little difference.** Male and female rates are within 1-3 points of each other in most groups.

## Recommendations

- **Flag high-risk patients at discharge:** 9+ diagnoses, 3+ previous inpatient stays, aged 60+, or on diabetes medication.
- **Follow-up calls within 7 days** for flagged patients, starting with Nephrology and Emergency/Trauma.
- **Medication review before discharge** for patients whose diabetes medication was changed during their stay.
- **Track monthly:** readmission rate by department, age group and number of diagnoses.

## What I Did

- **Data cleaning (Power Query / Excel):** cleaned and prepared the patient encounter data before loading it into MySQL and Power BI. Note: 17,676 empty rows came through the MySQL import as NULLs, and I kept them out of all readmission rates.
- **SQL (MySQL):** 5 analysis queries using CASE and GROUP BY to calculate readmission rates by age, specialty, number of diagnoses, diabetes medication, and race and gender.
- **Power BI dashboard:** KPI cards, readmission by age and gender, specialty, diagnoses, emergency, inpatient and outpatient visits, and medication changes, with slicers for age, gender, inpatient visits and diabetes medication.

## Files

| File | What it is |
|---|---|
| `hospital_analysis_queries-TUSHAR JAIN.sql` | SQL queries |
| `QUERY-1.png` to `QUERY-5.png` | Query result screenshots |
| `Hospital Administration Analysis-TUSHAR JAIN.1.pbix` | Power BI dashboard |
| `Hospital_Readmissions_Project_Overview.docx` | Project overview |

## Dataset

Hospital patient encounter data with age, gender, race, medical specialty, number of diagnoses, time in hospital, previous inpatient, outpatient and emergency visits, medication changes, diabetes medication and readmission flag.
