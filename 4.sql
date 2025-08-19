---------------------------------
---q31.show all the days of the month (1-31) and how many admission_dates occured on that day.
--sort by the day with most admissions to least admissions
 SELECT DAY(admission_date) AS day_number 
 COUNT(*) AS  number_of_admissions
 FROM admissions 
 GROUP BY day_number
 ORDER BY number_of_admissions DESC
----q32 show all the columns for patients id 542 most recent admission date
SELECT *
FROM admissions
WHERE patient_id=542
GROUP BY patient_id
HAVING admission_date=MAX(admission_date)
-----q33 show patient id,attending doctr id,and diagnosis for admissions that match one of
--the two criteria:
---1.patient_id is an odd number and attending_doctor id is either 1,5,or 19
---2 attending doctor id contains a 2 the length of patient id is 3charcters
SELECT patient_id,attending_doctor_id,diagnosis
FROM admissions
WHERE 
(patient_id%2!=0 AND attending_doctor_id IN(1,5,19)
OR
attending_doctor_id LIKE '%2%'
  AND LEN(patient_id)=3)
---q 34 show first_name,last_name,and the total number of admissions attended for each doctor
--every admission has been attented by a doctor
SELECT first_name,last_name,COUNT(*) AS admission_total
FROM admissions 
FROM doctors d
ON d.doctors_id=a.attending_doctor_id
GROUP BY admission.attending_doctor_id
-----q 35 for each doctor ,display their id,full name, and the first and last admission day they
--attended
SELECT doctor_id
CONCAT(first_name,' ',last_name) AS full_name
FROM doctors d
JOIN admission ON admissions.attending_doctor_id=d.doctors_id
GROUP BY admission.attending_doctors_id
-------q 36 display the total amount of patients for each province order by descending
SELECT province_name,
COUNT(*) AS patient_count 
FROM province_names pr
JOIN patients ON patients.province_id=pr.province_id
GROUP BY pr.province_id
ORDER BY patient_count DESC
-----q37 for every admission,display the patient's full name,their admission diagnosis,and
---their doctor's full name who diagnosed their problem 
SELECT CONCAT(first_name,' ',last_name) AS patient_name,diagnosis,
CONCAT(doctors.first_name,' ',doctors.last_name) AS doctor_name
FROM admission a 
    JOIN patients  ON a.patient_id=patients.patient_id
    JOIN doctors   ON a.attending_dcotor_id=doctors.doctor_id
----q 38 display the first name,last name and number of duplicate patients based on their first 
--name and last name 
SELECT first_name,last_name,COUNT(*) AS num_of_duplicates
FROM patients 
GROUP BY first_name,last_name
HAVING num_of_duplicates >1
-----------q 39 display patient's full name,height in the units feets rounded in 1decimal
---,weight on the unit pounds rounded to 0 decimals,birth_date,gender not abbreviated
----convert cm to feet by dividing by 30.48 and kg to pounds by 2.205
SELECT CONCAT(first_name,'',last_name),ROUND(height/30.48,1) AS height_feet,
ROUND(weight*2.205,0) AS weight_Pounds,birth_date,
CASE
    WHEN gender='M' THEN 'Male'
    ELSE 'Female'
    END AS gender_type
FROM patients
----40 Show patient_id,first_name,last_name from patients whose does no have any records in the
--admission table.(Their patient_id does not exist in any admissions)
SELECT patient_id,first_name,last_name
FROM patients
WHERE 
patient_id
NOT IN
(SELECT admission.patient_id FROM admissions)

























