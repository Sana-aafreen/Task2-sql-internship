📊** Company Database – Key Steps**

_Create Database
_
CREATE DATABASE Company; USE Company;

_Tables_

Departments(Dept_id, Department_name)

Employees(Employee_id, First_name, Last_name, Address, Age, Gender, Dept_id [FK])

Progress_report(Report_id, Employee_id [FK], Progress_percent)

_Sample Data_

Inserted 5 departments (HR, Finance, IT, Sales, Marketing)

Inserted 8 employees across departments

Inserted progress reports (percentages 60–95)

**Reporting Queries**

List employees with department

Employees with progress > 80%

Department-wise average progress

Top 3 departments by average progress
