USE valentina_assig_mod3;

-- ================================================================================
-- Test: attempt to insert a medicine with an existing name - Error code 1062
-- ================================================================================

INSERT INTO Medicine (medicine_name)
VALUES ('Latanoprost');


-- ================================================================================
-- Test: attempt to insert a NULL value into medicine_name field - Error code 1048
-- ================================================================================

USE valentina_assig_mod3;
INSERT INTO Medicine (medicine_name)
VALUES (NULL);