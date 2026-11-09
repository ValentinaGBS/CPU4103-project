# CPU4103-Crownfield Eye Hospital Database Project

## Repository Structure

The repository is organised into the following SQL scripts and directories:

* **`01_schema.sql`**: Script for creating the relational database, tables, integrity constraints (`PK`, `FK`), and ensuring 3NF normalisation.
* **`02_individual_queries.sql`**: Contains the 6 required advanced SQL queries (Aggregate with HAVING, multi-table JOINs, LEFT JOIN, CTEs, etc.).
* **`03_procedure_and_trigger.sql`**: Script containing the Stored Procedure and the business automation Trigger (including audit logging).
* **`04_security.sql`**: Role-based access control (RBAC) following the Principle of Least Privilege, password hashing (`SHA2`), and sensitive data encryption.
* **`05_ERD/`**: Directory containing all database diagrams:
  * Conceptual ERD (Task A2)
  * Logical ERD (Task A3)
  * Physical ERD (MySQL Workbench schema implementation)

---

## Execution Instructions

To properly test and run the database on a local MySQL server, it is recommended to execute the scripts in the following sequential order:

1. Run **`01_schema.sql`** to create the database and table structures.
2. Run **`02_individual_queries.sql`** to test the analytical and relational queries.
3. Run **`03_procedure_and_trigger.sql`** to register the automated procedures and triggers.
4. Run **`04_security.sql`** to configure user roles and security policies.

---

## Technologies Used
* **DBMS**: MySQL / valentina_assig_mod3
* **Modelling**: Crow's Foot Notation & 3NF Relational Schema
* **Tools**: MySQL Workbench, GitHub, Draw.io
