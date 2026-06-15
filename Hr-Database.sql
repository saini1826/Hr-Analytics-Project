drop database if exists Hr_Database;
create database Hr_Database;
use Hr_Database;

create table hrdata (
      Employee_Number int primary key,
      Attrition varchar(50),
      Business_Travel varchar(50),
      Age_band varchar(50),
      Attrition_lable varchar(50),
      Department varchar(50),
      Education_Field varchar(50),
      Emp_no varchar(50),
      Gender varchar(50),
      Job_Role varchar(50),
      Marital_Status varchar(50),
      Over_time varchar(50),
      Over18 varchar(10),
      Training_times_last_year int,
      Age int,
      Attrition_count int,
      Attrition_rate int,
      Active_Employee int,
      Daily_rate int,
      Distance_from_home int,
      Education varchar(50),
      Employee_Count int,
      Environment_satisfaction int,
      Hourly_rate int,
      Job_involvement int,
      Job_level int,
      Job_Satisfaction varchar(50),
      Monthly_Income int,
      Monthly_rate int,
      Num_companies_worked int,
      Percent_salary_hike int,
      Performance_rating int,
      Relationship_satisfaction int,
      Standard_hours int,
      Stock_option_level int,
      Total_working_years int,
      Work_life_balance int,
      Year_at_company int,
      Years_in_current_role int,
      Years_since_last_promotion int,
      Years_with_curr_manager int)
      
select * from hrdata;

# 1. How many employees are currently available in the organization

select count(*) as Employee_count
from hrdata;

# 2. How many employees are currently active

select count(*) as Active_Employees
from hrdata
where Attrition = "No";

# 3. How many employees have left the company

select count(*) as Attrition_count
from hrdata
where Attrition = "Yes";

# 4. What percentage of employees have left the company

select
round(
count(case when Attrition = "Yes" then 1 end) * 100.0/ count(*), 2) as Attrition_Rate
from hrdata;

# 5. What is the average age of employees

select round(avg(age), 2) as Average_Age
from hrdata;

# 6. Which gender has the highest attrition

select Gender,
count(*) as Attrition_Count
from hrdata
where Attrition = "Yes"
group by Gender;

# 7. Which department has the highest attrition

select Department,
count(*) as Attrition_Count
from hrdata
where Attrition = "Yes"
group by Department
order by Attrition_Count desc;

# 8. Which education background employees are leaving most

select Education_field,
count(*) as Attrition_Count
from hrdata
where Attrition = "Yes"
group by Education_field
order by Attrition_Count desc;

# 9. Does overtime increase employee attrition

select Over_time,
count(*) as Attrition_count
from hrdata
where Attrition = "Yes"
group by Over_time;

# 10. Which marital status group has the highest attrition

select Marital_status,
count(*) as Attrition_count
from hrdata
where Attrition = "Yes"
group by Marital_status;

# 11. Which age group has the most employees

select Age_band,
count(*) as Employees_count
from hrdata
group by Age_band;

# 12. What is the gender ratio in the company

select Gender,
count(*) as Employees_count
from hrdata
group by Gender;

# 13. Which department pays the highest salary

select Department,
round(avg(Monthly_income), 0) as Avg_salary
from hrdata
group by Department
order by Avg_salary desc;

# 14. Who are the highest-paid employees in the company

select Employee_number,
Monthly_income
from hrdata
order by Monthly_income
desc limit 10;

# 15. What are the job satisfaction levels of employees

select Job_satisfaction,
count(*) as Employee_count
from hrdata
group by Job_satisfaction
order by Job_satisfaction;