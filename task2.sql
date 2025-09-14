-- Create database
CREATE DATABASE Company;
USE Company;

-- Departments Table
CREATE TABLE Departments
(
    Dept_id INT PRIMARY KEY AUTO_INCREMENT,
    Department_name VARCHAR(100) NOT NULL
);

-- Employees Table
CREATE TABLE Employees
(
    Employee_id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    Age INT,
    Gender VARCHAR(25),
    Dept_id INT,
    FOREIGN KEY (Dept_id) REFERENCES Departments(Dept_id)
);

-- Progress Report Table
CREATE TABLE Progress_report
(
    Report_id INT PRIMARY KEY AUTO_INCREMENT,
    Employee_id INT,
    Progress_percent INT CHECK (Progress_percent BETWEEN 0 AND 100),
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id)
);

-- INSERTING DATA into Departments
INSERT INTO Departments (Department_name)
VALUES 
('Human Resources'),
('Finance'),
('IT'),
('Sales'),
('Marketing');

-- INSERTING DATA into Employees
INSERT INTO Employees (First_name, Last_name, Address, Age, Gender, Dept_id)
VALUES
('Amit', 'Sharma', 'Delhi, India', 29, 'Male', 1),
('Priya', 'Verma', 'Mumbai, India', 32, 'Female', 2),
('Rohit', 'Mehta', 'Bangalore, India', 27, 'Male', 3),
('Sneha', 'Patel', 'Ahmedabad, India', 35, 'Female', 4),
('Karan', 'Singh', 'Chennai, India', 30, 'Male', 5),
('Neha', 'Kapoor', 'Kolkata, India', 26, 'Female', 3),
('Vikram', 'Nair', 'Hyderabad, India', 40, 'Male', 2),
('Anjali', 'Desai', 'Pune, India', 28, 'Female', 1);

-- Insert Data into Progress_report
INSERT INTO Progress_report (Employee_id, Progress_percent)
VALUES
(1, 85),
(2, 90),
(3, 70),
(4, 95),
(5, 60),
(6, 75),
(7, 88),
(8, 92);

-- List all employees with their department names
SELECT e.Employee_id, e.First_name, e.Last_name, d.Department_name
FROM Employees e
JOIN Departments d ON e.Dept_id = d.Dept_id;

-- Show employees where progress is greater than 80%
SELECT e.First_name, e.Last_name, p.Progress_percent
FROM Employees e
JOIN Progress_report p ON e.Employee_id = p.Employee_id
WHERE p.Progress_percent > 80;

-- Department-wise average progress
SELECT d.Department_name, AVG(p.Progress_percent) AS AvgProgress
FROM Departments d
JOIN Employees e ON d.Dept_id = e.Dept_id
JOIN Progress_report p ON e.Employee_id = p.Employee_id
GROUP BY d.Department_name
ORDER by AvgProgress DESC
LIMIT 3;


