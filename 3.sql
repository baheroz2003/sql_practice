-- 1.patients:
-- patient_id int
-- first_name text
-- last_name text
-- gender char
-- birth_date  date
-- city text 
-- province_id char 
-- allergies text 
-- height int 
-- weight int 
-- 2.province_names char(2)
-- province_id     text
--3.admissions
--patien_id
--admission_date
--discharge_date
--diagnosis
--attending_doctor_id
---ques 21:show the total amount of male patients and the total number of female patients in
--the patients table
---display the two result in the same row
SELECT
SELECT COUNT(*) AS male_patients
FROM patients
WHERE gender='M'
SELECT COUNT(*) AS female_patients 
FROM patients
WHERE gender='F'
--method 2
SELECT SUM(Gender='M') AS male_count,
SUM(Gender='F') AS female_count
FROM patients
---ques 22:Show first and last name,allergies from patients which have allergies to either
--pencilin or morphine.Show results ordered ascending by allergies then by first_name then by
---last_name
SELECT first_name,last_name,allergies 
FROM patients 
WHERE allergies='Pencilin' OR allergies='Morphine'
ORDER BY allergies,first_name,last_name
----ques 23 show patients_id,diagnosis from admissions.Find patients admitted multiple times
---for the same diagnosis
SELECT patient_id,diagnosis
FROM admissions
GROUP BY patient_id,diagnosis
HAVING COUNT(*) >1

















