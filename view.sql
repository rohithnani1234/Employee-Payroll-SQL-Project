CREATE VIEW payroll_summary AS
SELECT p.month, e.emp_name, p.total
FROM payroll p
JOIN employees e ON e.emp_id = p.emp_id;