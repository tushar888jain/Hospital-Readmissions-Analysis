USE hospital;

-- QUERY 1: Readmission rate by age group
SELECT age,
       COUNT(*) AS total_patients,
       SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) AS readmitted_count,
       ROUND(SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_pct
FROM hospital_data
GROUP BY age
ORDER BY age;


-- QUERY 2: Readmission rate by medical specialty
SELECT Medical_specialty,
       COUNT(*) AS total_patients,
       SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) AS readmitted_count,
       ROUND(SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_pct
FROM hospital_data
GROUP BY Medical_specialty
ORDER BY readmission_rate_pct DESC;


-- QUERY 3: Average time in hospital and readmission rate by number of diagnoses (comorbidity score)
SELECT number_diagnoses,
       COUNT(*) AS total_patients,
       ROUND(AVG(time_in_hospital), 2) AS avg_time_in_hospital,
       ROUND(SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_pct
FROM hospital_data
GROUP BY number_diagnoses
ORDER BY number_diagnoses;


-- QUERY 4: Readmission rate for diabetic vs non-diabetic medication patients
SELECT diabetesMed,
       COUNT(*) AS total_patients,
       SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) AS readmitted_count,
       ROUND(SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_pct
FROM hospital_data
GROUP BY diabetesMed;


-- QUERY 5: Readmission rate by race and gender
SELECT Race, gender,
       COUNT(*) AS total_patients,
       SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) AS readmitted_count,
       ROUND(SUM(CASE WHEN readmitted = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate_pct
FROM hospital_data
GROUP BY Race, gender
ORDER BY Race, gender;

