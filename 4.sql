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


