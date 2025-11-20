DELIMITER //
CREATE PROCEDURE calculate_salary(IN eid INT, IN mon VARCHAR(20))
BEGIN
    INSERT INTO payroll(emp_id,month,basic,hra,bonus,total)
    VALUES (eid, mon, 30000, 10000, 5000, 45000);
END //
DELIMITER ;