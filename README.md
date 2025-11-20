/* 
======================================================================
  EMPLOYEE PAYROLL MANAGEMENT – COMPLETE SQL PROJECT FILE
  Author : Rohith
  Purpose: Full DB Project for Resume / GitHub / Portfolio
======================================================================
*/

/* ----------------------------- README ------------------------------
This is a complete MySQL-based Employee Payroll Management System.
It includes table creation, sample data, joins, views, stored 
procedures, and reporting queries.

Features:
✔ Employee, Department & Payroll Tables
✔ Normalized Schema with Foreign Keys
✔ CRUD operations
✔ Views for salary reporting
✔ Stored Procedure for salary calculation
✔ Join-based analytics
--------------------------------------------------------------------- */

/* ========================== CREATE DATABASE ======================== */
CREATE DATABASE IF NOT EXISTS employee_payroll;
USE employee_payroll;

/* ========================== TABLES ================================= */

/* ---------- departments table ---------- */
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);

/* ---------- employees table ---------- */
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dept_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

/* ---------- payroll table ---------- */
CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    month VARCHAR(20),
    basic DECIMAL(10,2),
    hra DECIMAL(10,2),
    bonus DECIMAL(10,2),
    total DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

/* ========================== SAMPLE DATA ============================ */

/* Insert departments */
INSERT INTO departments (dept_name)
VALUES ('IT'), ('HR'), ('Finance');

/* Insert employees */
INSERT INTO employees (emp_name, email, phone, dept_id, hire_date, salary)
VALUES 
('Rohith', 'rohith@example.com', '9876543210', 1, '2024-01-15', 45000),
('Vijay', 'vijay@example.com', '9123456789', 2, '2023-09-10', 38000),
('Akhil', 'akhil@example.com', '9988776655', 1, '2022-05-20', 52000);

/* ========================== JOINS ================================= */

/* Join employees + departments */
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

/* ========================== VIEW ================================== */

/* Payroll summary view */
CREATE VIEW payroll_summary AS
SELECT e.emp_name, p.month, p.total
FROM payroll p
JOIN employees e ON p.emp_id = e.emp_id;

/* ====================== STORED PROCEDURE =========================== */

DELIMITER $$

CREATE PROCEDURE calculate_salary(IN eid INT, IN mon VARCHAR(20))
BEGIN
    INSERT INTO payroll(emp_id, month, basic, hra, bonus, total)
    VALUES (eid, mon, 30000, 10000, 5000, 45000);
END $$

DELIMITER ;

/* Example procedure call */
CALL calculate_salary(1, 'January');

/* ========================== REPORTS =============================== */

/* Monthly payroll report */
SELECT * FROM payroll_summary;

/* Department-wise employee count */
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

/* Highest salary employees */
SELECT emp_name, salary 
FROM employees
ORDER BY salary DESC
LIMIT 3;

/* =========================== END ================================== */
