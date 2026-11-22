USE valentina_assig_mod3;
-- ==================================================================================================================
-- QUERY 1:aggregate query using GROUP BY and an appropriate filter such as HAVING
-- ==================================================================================================================

SELECT
    c.clinician_ID,
    c.clinician_name,
    COUNT(a.appointment_ID) AS total_appointments
FROM Clinician c
INNER JOIN Appointment a
    ON c.clinician_ID = a.clinician_ID
GROUP BY
    c.clinician_ID,
    c.clinician_name
HAVING COUNT(a.appointment_ID) > 1;

-- ==================================================================================================================
-- QUERY 2: INNER JOIN
-- ==================================================================================================================

use valentina_assig_mod3;
SELECT
    p.patient_ID,
    p.patient_name,
    a.appointment_date,
    a.appointment_time,
    c.clinician_name,
    cl.clinic_name
FROM Patient p
INNER JOIN Appointment a
    ON p.patient_ID = a.patient_ID
INNER JOIN Clinician c
    ON a.clinician_ID = c.clinician_ID
INNER JOIN Clinic cl
    ON a.clinic_ID = cl.clinic_ID
ORDER BY a.appointment_date;

-- ==================================================================================================================
-- QUERY 3: LEFT JOIN
-- ==================================================================================================================
-- Question: Which appointments do not have a prescription?

use valentina_assig_mod3;
SELECT
    a.appointment_ID,
    a.patient_ID,
    a.appointment_date,
    pr.prescription_ID
FROM Appointment a
LEFT JOIN Prescription pr
    ON a.appointment_ID = pr.appointment_ID
WHERE pr.prescription_ID IS NULL
ORDER BY a.appointment_ID;

-- ==================================================================================================================
-- QUERY 4 SUBQUERY identifies patients with more appointments.
-- ==================================================================================================================

use valentina_assig_mod3;
SELECT
    patient_ID,
    COUNT(*) AS total_appointments
FROM Appointment
GROUP BY patient_ID
HAVING COUNT(*) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT COUNT(*) AS appointment_count
        FROM Appointment
        GROUP BY patient_ID
    ) AS patient_totals
);



