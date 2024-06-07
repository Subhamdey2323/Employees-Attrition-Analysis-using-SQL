CREATE DATABASE IF NOT EXISTS Hr_Database;

USE hr_database;

CREATE TABLE employees(
	Age int,
    Attrition text,
    BusinessTravel text,
    DailyRate int,
    Department text,
	DistanceFromHome int,
    Education int,
    EducationField text,
    EmployeeCount int,
    EmployeeNumber int primary key auto_increment,
    EnvironmentSatisfaction int,
	Gender text,
	HourlyRate int,
	JobInvolvement int,
	JobLevel int,
	JobRole text,
	JobSatisfaction int,
	MaritalStatus text,
	MonthlyIncome int,
	MonthlyRate int,
	NumCompaniesWorked int,
	Over18 text,
	OverTime text,
	PercentSalaryHike int,
	PerformanceRating int,
	RelationshipSatisfaction int,
	StandardHours int,
	StockOptionLevel int,
	TotalWorkingYears int,
	TrainingTimesLastYear int,
	WorkLifeBalance int,
	YearsAtCompany int,
	YearsInCurrentRole int,
	YearsSinceLastPromotion int,
	YearsWithCurrManager int
);

# 1. Write a query to get all employee details

select * from employees;

# 2. Write a query to get the number of employees working with the company 

select count(*) from employees;

# 3. Write a query to get unique department ID from employee table

select distinct(Department)
from employees;

# 4. Write a query to get the total salaries payable to employees 

select sum(MonthlyIncome) from employees;

# 5. Write a query to get the maximum and minimum salary from employees table

select max(MonthlyIncome), min(MonthlyIncome) from employees;

# 6. Write a query to get the average salary and number of employees in the employees table 

select avg(MonthlyIncome), count(*) from employees;

# 7. Write a query to get the number of jobs available in the employees table 

select count(distinct JobRole) from employees;

# 8. Write a query to display the salary for all employees whose salary is not in the range $10,000 through $15,000

select count(EmployeeNumber) from employees where MonthlyIncome not between 10000 and 15000;

# 9. Write a query to display the first word from those job titles which contains more than one words

select distinct(JobRole), substr(JobRole, 1,instr(JobRole,' ')-1) from employees;

# 10. create a sql quuery to find the details of employess having 5+ years of experience in between the age group 27-35

select * from employees
where age between 27 and 35
and TotalWorkingYears >5;

# 11. fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike

select Department,min(MonthlyIncome) as min_salary,max(MonthlyIncome) as max_salary
from employees
where PercentSalaryHike < 13
group by Department;

# 12. calculate the average monthly income of all the employees who worked more than 3 years whose education background is medical

select avg(MonthlyIncome)
from employees
where YearsAtCompany >3 and EducationField='Medical'
group by EducationField;

# 13. indentify the total no of married male and female employees who didn't received promotion in the last 2 year

select Gender,count(EmployeeNumber) as employee_count
from employees
where MaritalStatus='Married' and YearsSinceLastPromotion=1
group by Gender;

# 14. Employees with max performance and no promotion for 4 years and above

select * from employees
where PerformanceRating= (select max(PerformanceRating) from employees) and YearsSinceLastPromotion>=4;

# 15. who has maximum and minimum percentage of salary hike

select YearsAtCompany,PerformanceRating,YearsSinceLastPromotion,min(PercentSalaryHike),max(PercentSalaryHike)
from employees
group by YearsAtCompany,PerformanceRating,YearsSinceLastPromotion
order by max(PercentSalaryHike) desc,min(PercentSalaryHike) asc;

# 16. fetch the details of employees working overtime but given min salary hike and are more than with 5 yrs of company

select * from employees
where OverTime='Yes' and PercentSalaryHike = (select min(PercentSalaryHike) from employees) and YearsAtCompany >5;

# 17. fetch the details of employees working no overtime but given max salary hike and are lees than with 5 yrs of company

select * from employees
where OverTime='No' and PercentSalaryHike = (select max(PercentSalaryHike) from employees) and YearsAtCompany <5;















