# Datasets used: employee.csv and membership.csv

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Schema EmpMemb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS EmpMemb;
USE EmpMemb;

-- 1. Create a table Employee by refering the data file given. 

# Follow the instructions given below: 
-- -- Q1. Values in the columns Emp_id and Members_Exclusive_Offers should not be null.
-- -- Q2. Column Age should contain values greater than or equal to 18.
-- -- Q3. When inserting values in Employee table, if the value of salary column is left null, then a value 20000 should be assigned at that position. 
-- -- Q4. Assign primary key to Emp_ID
-- -- Q5. All the email ids should not be same.
create table Employee(Emp_ID int not null primary key, email varchar(30) unique, age int, Members_Exclusive_Offers int not null, salary int);
alter table Employee add constraint age check(age>=18);
alter table Employee add constraint salary check(salary=ifnull(salary,20000));

-- 2. Create a table Membership by refering the data file given. 

# Follow the instructions given below: 
-- -- Q6. Values in the columns Prime_Membership_Active_Status and Employee_Emp_ID should not be null.
-- -- Q7. Assign a foreign key constraint on Employee_Emp_ID.
-- -- Q8. If any row from employee table is deleted, then the corresponding row from the Membership table should also get deleted.
create table Membership(Employee_Emp_ID int not null, Prime_Membership_Active_Status varchar(5) not null);
alter table Membership add constraint foreign key(Employee_Emp_ID) references Employee(Emp_ID);