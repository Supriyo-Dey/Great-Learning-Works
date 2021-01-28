# Datasets used: employee_details.csv and Department_Details.csv
# Use subqueries to answer every question

CREATE SCHEMA IF NOT EXISTS Employee;
USE Employee;
# import csv files in Employee database.

SELECT * FROM DEPARTMENT_DETAILS;
SELECT * FROM EMPLOYEE_DETAILS;


#Q1. Retrive employee_id , first_name , last_name and salary details of those employees whose salary is greater than the average salary of all the employees.
select Employee_id, First_name, Last_name, Salary from employee_details where Salary > (select avg(salary) from employee_details);

#Q2. Display first_name , last_name and department_id of those employee where the location_id of their department is 1700
select First_name, Last_name, department_id from employee_details e
where e.department_id in (select d.department_id from department_details d where d.location_id = 1700);

#Q3. From the table employees_details, extract the employee_id, first_name, last_name, job_id and department_id who work in  any of the departments of Shipping, Executive and Finance.
select employee_id, First_name, Last_name, Job_id, e.department_id from employee_details e 
where e.department_id in (select d.department_id from department_details d where d.department_name in ('shipping','executive','finance'));

#Q4. Extract employee_id, first_name, last_name,salary, phone_number and email of the CLERKS who earn more than the salary of any IT_PROGRAMMER.
select * from employee_details where job_id like '%Clerk%' and salary > any (select salary from employee_details where job_id like '%IT_Prog%');

#Q5. Extract employee_id, first_name, last_name,salary, phone_number, email of the AC_ACCOUNTANTs who earn a salary more than all the AD_VPs.
select employee_id, First_name, Last_name, salary, phone_number, email from employee_details
where job_id = 'AC_ACCOUNTANT' and salary > all (select salary from employee_details where job_id = 'AD_VP'); 

#Q6. Write a Query to display the employee_id, first_name, last_name, department_id of the employees who have been recruited in the recent half timeline since the recruiting began. 
alter table employee_details modify column hire_date date;
select employee_id, First_name, Last_name, department_id from employee_details where year(hire_date) > 
(select year(max(hire_date)) - ((year(max(hire_date)) - year(min(hire_date)))/2) from employee_details); 

#Q7. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees belonging to the 'Contracting' department 
select employee_id, first_name, last_name, phone_number, salary, job_id from employee_details e 
where e.department_id in (select d.department_id from department_details d where d.department_name = 'Contracting');

#Q8. Extract employee_id, first_name, last_name, phone_number, salary and job_id of the employees who does not belong to 'Contracting' department
select employee_id, first_name, last_name, phone_number, salary, job_id from employee_details e 
where e.department_id in (select d.department_id from department_details d where d.department_name != 'Contracting');

#Q9. Display the employee_id, first_name, last_name, job_id and department_id of the employees who were recruited first in the department
select employee_id, First_name, Last_name, job_id, department_id, hire_date from employee_details where hire_date in 
(select min(hire_date) from employee_details group by department_id);

#Q10. Display the employee_id, first_name, last_name, salary and job_id of the employees who earn maximum salary for every job.
select employee_id, first_name, last_name, salary, job_id from employee_details where 
salary in (select max(salary) from employee_details group by job_id);
