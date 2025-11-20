CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dept_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);
CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    month VARCHAR(20),
    basic DECIMAL(10,2),
    hra DECIMAL(10,2),
    bonus DECIMAL(10,2),
    total DECIMAL(10,2),
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments(dept_name) VALUES ("IT"), ("HR"), ("Finance");

INSERT INTO employees(emp_name,email,phone,dept_id,hire_date,salary)
VALUES ("Rohith","rohith@gmail.com","9999999999",1,'2022-01-01',45000);







