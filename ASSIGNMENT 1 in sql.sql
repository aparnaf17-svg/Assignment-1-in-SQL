-- 1. Table Creation (CREATE)
CREATE DATABASE IF NOT EXISTS employee;
USE employee;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

-- 2. Table Alteration (ALTER)
-- Add email column
ALTER TABLE employees 
ADD email VARCHAR(100);

-- Modify designation column
ALTER TABLE employees 
MODIFY designation VARCHAR(255);

-- Drop age column
ALTER TABLE employees 
DROP COLUMN age;

-- Rename hire_date column
ALTER TABLE employees 
RENAME COLUMN hire_date TO date_of_joining;

-- 3. Table Renaming (RENAME)
RENAME TABLE departments TO Departments_Info;
RENAME TABLE location TO Locations;

-- 4. Table Truncation (TRUNCATE)
TRUNCATE TABLE employees;

-- 5. Database & Table Dropping (DROP)
DROP TABLE employees;
DROP DATABASE employee;

-- 1. Database Recreation
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- 2. Departments Table with Constraints
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3. Location Table with Constraints
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- 4. Employees Table with Constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

