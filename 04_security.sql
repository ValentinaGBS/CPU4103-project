USE valentina_assig_mod3;
-- =========================================================
-- QUERY SECURITY creation roles, if not exist.
-- =========================================================
CREATE ROLE
    'administrator_role'@'%',
    'doctor_role'@'%',
    'receptionist_role'@'%',
    'patient_role'@'%';
    
-- =========================================================
-- Administrator privileges
-- =========================================================

GRANT ALL PRIVILEGES
ON valentina_assig_mod3.*
TO 'administrator_role'@'%';

-- =========================================================
-- Doctor privileges
-- =========================================================

GRANT SELECT
ON valentina_assig_mod3.Appointment
TO 'doctor_role'@'%';

GRANT SELECT
ON valentina_assig_mod3.Clinician
TO 'doctor_role'@'%';

GRANT SELECT
ON valentina_assig_mod3.Patient
TO 'doctor_role'@'%';

GRANT SELECT, INSERT, UPDATE
ON valentina_assig_mod3.Diagnosis
TO 'doctor_role'@'%';

GRANT SELECT, INSERT, UPDATE
ON valentina_assig_mod3.Prescription
TO 'doctor_role'@'%';

GRANT SELECT, INSERT, UPDATE
ON valentina_assig_mod3.Prescription_Item
TO 'doctor_role'@'%';

GRANT SELECT, INSERT, UPDATE
ON valentina_assig_mod3.FollowUpPlan
TO 'doctor_role'@'%';

-- =========================================================
-- Receptionist privileges
-- =========================================================


GRANT SELECT, INSERT, UPDATE
ON valentina_assig_mod3.Appointment
TO 'receptionist_role'@'%';

GRANT SELECT
ON valentina_assig_mod3.Clinician
TO 'receptionist_role'@'%';

GRANT SELECT, INSERT, UPDATE
ON valentina_assig_mod3.Patient
TO 'receptionist_role'@'%';

-- =========================================================
-- Patient privileges
-- =========================================================

GRANT SELECT
ON valentina_assig_mod3.Appointment
TO 'patient_role'@'%';

GRANT SELECT
ON valentina_assig_mod3.Diagnosis
TO 'patient_role'@'%';

GRANT SELECT
ON valentina_assig_mod3.Prescription
TO 'patient_role'@'%';

-- =========================================================
-- Role assignment
-- =========================================================

GRANT 'administrator_role'@'%'
TO 'administrator'@'%';

GRANT 'doctor_role'@'%'
TO 'doctor'@'%';

GRANT 'receptionist_role'@'%'
TO 'receptionist'@'%';

GRANT 'patient_role'@'%'
TO 'patient'@'%';

-- =========================================================
-- Default roles
-- =========================================================

SET DEFAULT ROLE ALL TO 'administrator'@'%';

SET DEFAULT ROLE ALL TO 'doctor'@'%';

SET DEFAULT ROLE ALL TO 'receptionist'@'%';

SET DEFAULT ROLE ALL TO 'patient'@'%';

-- =========================================================
-- Verification
-- =========================================================

USE valentina_assig_mod3;

SHOW GRANTS FOR 'administrator_role'@'%';

SHOW GRANTS FOR 'doctor_role'@'%';

SHOW GRANTS FOR 'receptionist_role'@'%';

SHOW GRANTS FOR 'patient_role'@'%';

-- =========================================================
-- DATA PROTECTION
-- =========================================================

USE valentina_assig_mod3;
SELECT
    'SensitiveData123' AS Original_Data,
    SHA2('SensitiveData123', 256) AS Hashed_Data;
 
-- ========================================================= 
-- HASH VERIFICATION
-- =========================================================

use valentina_assig_mod3;
SELECT
SHA2('SensitiveData123', 256) =
SHA2('SensitiveData123', 256) AS Hash_Verification;

-- =========================================================
-- CREATE TEMPORARY TABLE FOR TRANSACTION TESTS
-- =========================================================
use valentina_assig_mod3;

CREATE TEMPORARY TABLE transaction_demo (
    test_ID INT PRIMARY KEY,
    description VARCHAR(100)
) ENGINE = InnoDB;

-- =========================================================
-- TRANSACTION COMMIT TEST
-- =========================================================

use valentina_assig_mod3;
START TRANSACTION;

INSERT INTO transaction_demo
(test_ID, description)
VALUES
(1, 'COMMIT test - confirmed');

COMMIT;

SELECT * FROM transaction_demo;

-- =========================================================
-- TRANSACTION ROOLBACK TEST
-- =========================================================

use valentina_assig_mod3;
START TRANSACTION;

INSERT INTO transaction_demo
(test_ID, description)
VALUES
(2, 'ROLLBACK test - cancelled');

ROLLBACK;

SELECT * FROM transaction_demo;

-- =========================================================
-- SQL injection vulnerabilities 
-- Preparated statement - Valid input
-- =========================================================

USE valentina_assig_mod3;

SET @patient_id = 'OP001';

SET @sql = '
    SELECT patient_ID, patient_name, postcode
    FROM Patient
    WHERE patient_ID = ?
';

PREPARE secure_query FROM @sql;

EXECUTE secure_query USING @patient_id;

DEALLOCATE PREPARE secure_query;

-- =========================================================
-- Preparated statement - Malicious input treated as data, not SQL code.
-- =========================================================

USE valentina_assig_mod3;
SET @patient_id = '' OR '1'='1';
SET @sql = '
    SELECT patient_ID, patient_name, postcode
    FROM Patient
    WHERE patient_ID = ?
';
PREPARE secure_query FROM @sql;
EXECUTE secure_query USING @patient_id;
DEALLOCATE PREPARE secure_query;


    