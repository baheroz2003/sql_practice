--Q41.display a single row with max_visit,min_visit average visits  where the maximum,minimum
--and average number of admissions per day is calculated.Average is rounded to 2decimal places
SELECT 
  MAX(no_admissions) AS max_visits,
  MIN(no_admissions) AS min_visits,
  ROUND(AVG(no_admissions) AS average_visits
FROM
(SELECT admission_date,COUNT(*) AS no_admissions
FROM admissions
GROUP BY admission_date)
---Q42 show all of the patients grouped into weight groups 
---show the total amount of patients in each weight group
--order the list by the weight group descending 
SELECT 
     COUNT(*) AS patients_in_group,
     FLOOR(weight/10) *10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC
----q43 Show patient_id,weight,height,isObeses from the patients table 
-- obese if weight/h*h >=30 then w in kg h in m
--but in ques weight in kg and height is in cm
  SELECT patient_id,weight,height,
          (CASE
              WHEN weight/POWER((height/100),2)>=30
                    THEN 1
                  ELSE 0
              END) AS isObese
  FROM patients
  ---q44 show patient_id,first_name,last_name, and attending doctors's speciality 
  --show only the patients who has a diagnosis as 'Epilepsy and the doctor's first name is
  --'lisa'
  --check patients,admissions, and dcotors tables for required information
  SELECT p.patient_id AS patient_id,
  p.first_name AS patient_first_name,p.last_name AS patient_last_name,
  d.specialty AS attending_doctor_speciality
  FROM patients p
  JOIN admission a ON p.patient_id=a.patient_id
  JOIN doctors d ON d.doctor_id=a.attending_doctor_id
WHERE a.diagnosis='Epilepsy' AND 
d.first_name='Lisa'
  
  
  

  
