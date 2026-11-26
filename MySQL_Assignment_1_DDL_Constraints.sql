CREATE DATABASE employee;

USE employee;
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);
CREATE TABLE location (
    location_id INT,
    location VARCHAR(30)
);
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender ENUM('M','F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
);
SHOW TABLES;
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
DESC employees;
ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(200);
DESC employees;
ALTER TABLE employees
DROP COLUMN age;

ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;
DESC employees;
RENAME TABLE departments TO Departments_Info;
RENAME TABLE location TO Locations;
SHOW TABLES;
TRUNCATE TABLE employees;
SELECT * FROM employees;
DROP TABLE employees;
SHOW TABLES;
DROP DATABASE employee;
DROP DATABASE employee;
-- PART 2: CONSTRAINTS

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
DESC departments;
CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30) NOT NULL UNIQUE
);
DESC location;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F'),
    age INT NOT NULL CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    FOREIGN KEY (location_id)
        REFERENCES location(location_id)
);
SHOW TABLES;
DESC employees;
SHOW CREATE TABLE employees;