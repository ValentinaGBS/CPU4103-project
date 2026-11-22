-- ==================================================================================================================
-- QUERY 5 Stored Procedure identifies all appointments for a selected patient.
-- ==================================================================================================================

use valentina_assig_mod3;
DELIMITER //

CREATE PROCEDURE GetPatientAppointments(
    IN p_patient_ID VARCHAR(10)
)
BEGIN
    SELECT
        appointment_ID,
        patient_ID,
        appointment_date,
        appointment_time,
        appointment_notes
    FROM Appointment
    WHERE patient_ID = p_patient_ID
    ORDER BY appointment_date;
END //

DELIMITER ;
--
use valentina_assig_mod3;
CALL GetPatientAppointments('OP001');

-- =======================================================================================================================================
-- QUERY 6 Trigger automatically logs into the Diagnosis_Audit table every new diagnosis inserted into the Diagnosis table.
-- =======================================================================================================================================

use valentina_assig_mod3;

DELIMITER //

CREATE TRIGGER After_Diagnosis_Insert
AFTER INSERT ON Diagnosis
FOR EACH ROW
BEGIN
    INSERT INTO Diagnosis_Audit (
        diagnosis_ID,
        diagnosis_name,
        appointment_ID
    )
    VALUES (
        NEW.diagnosis_ID,
        NEW.diagnosis_name,
        NEW.appointment_ID
    );
END //

DELIMITER ;

-- =========================================================
-- Show the result of the trigger
-- =========================================================
USE VALENTINA_ASSIG_MOD3;
SELECT *
FROM Diagnosis_Audit
ORDER BY audit_ID;