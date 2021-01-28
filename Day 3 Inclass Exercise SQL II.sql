# Datasets used: AirlineDetails.csv, passengers.csv and senior_citizen.csv
-- -----------------------------------------------------
-- Schema Airlines
create database Airlines;
use Airlines;
-- -----------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a table Airline_Details. Follow the instructions given below: 
-- -- Q1. Values in the columns Flight_ID should not be null.
-- -- Q2. Each name of the airline should be unique.
-- -- Q3. No country other than United Kingdom, USA, India, Canada and Singapore should be accepted
-- -- Q4. Assign primary key to Flight_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create table Airline_Details(Flight_ID varchar(10) not null, Airline_name varchar(30) unique, Country varchar(30));
drop table Airline_Details;
desc Airline_Details;
alter table Airline_Details add constraint primary key(Flight_ID);
alter table Airline_Details add constraint Country check (Country='United Kingdom'or Country = 'USA'or Country='India'or Country='Canada'or Country='Singapore');

-- 2. Create a table Passengers. Follow the instructions given below: 
-- -- Q1. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q2. Only passengers having age greater than 18 are allowed.
-- -- Q3. Assign primary key to Traveller_ID
create table Passengers(Flight_Id varchar(10),Traveller_ID int not null primary key, PNR int not null, Age int);
desc Passengers;
drop table Passengers;
-- Questions for table Passengers:  
-- -- Q3. PNR status should be unique and should not be null.
-- -- Q4. Flight Id should not be null.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
alter table Passengers modify PNR int not null unique;
alter table Passengers modify Flight_Id varchar(10) not null;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Create a table Senior_Citizen_Details. Follow the instructions given below: 
-- -- Q1. Column Traveller_ID should not contain any null value.
-- -- Q2. Assign primary key to Traveller_ID
-- -- Q3. Assign foreign key constraint on Traveller_ID such that if any row from passenger table is updated, then the Senior_Citizen_Details table should also get updated.
-- -- --  Also deletion of any row from passenger table should not be allowed.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create table Senior_Citizen_Details(Traveller_Id int not null primary key);
alter table Senior_Citizen_Details add constraint foreign key(Traveller_Id) references Passengers(Traveller_ID);
-- -----------------------------------------------------
-- Table Senior_Citizen_Details
-- -- Q6. Create a new column Age in Passengers table that takes values greater than 18. 
 alter table Senior_Citizen_Details add column Age int;
 alter table Senior_Citizen_Details add constraint Age check(Age>18);
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Create a table books. Follow the instructions given below: 
-- -- Columns: books_no, description, author_name, cost
-- -- Qa. The cost should not be less than or equal to 0.
-- -- Qb. The cost column should not be null.
-- -- Qc. Assign a primary key to the column books_no.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create table books(books_no float not null primary key, description varchar(50), author_name varchar(30), cost int not null);
alter table books add constraint cost check(cost>0);

# Q8. Update the table 'books' such that the values in the columns 'description' and author' must be unique.
alter table books modify description varchar(50) unique;
alter table books modify author_name varchar(30) unique;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Create a table bike_sales. Follow the instructions given below: 
-- -- Columns: id, product, quantity, release_year, release_month
-- -- Q1. Assign a primary key to ID. Also the id should auto increment.
-- -- Q2. None of the columns should be left null.
-- -- Q3. The release_month should be between 1 and 12 (including the boundries i.e. 1 and 12).
-- -- Q4. The release_year should be between 2000 and 2010.
-- -- Q5. The quantity should be greater than 0.
-- --------------------------------------------------------------------------
-- Use the following comands to insert the values in the table bike_sales
/*('1','Pulsar','1','2001','7');
('2','yamaha','3','2002','3');
('3','Splender','2','2004','5');
('4','KTM','2','2003','1');
('5','Hero','1','2005','9');
('6','Royal Enfield','2','2001','3');
('7','Bullet','1','2005','7');
('8','Revolt RV400','2','2010','7');
('9','Jawa 42','1','2011','5');*/
-- --------------------------------------------------------------------------
create table bike_sales
(id int not null auto_increment primary key, product varchar(20) not null, quantity int not null, release_year int not null, release_month int not null);
drop table bike_sales;
alter table bike_sales add constraint release_month check(release_month>=1 and release_month<=12);
alter table bike_sales add constraint release_year check(release_year>=2000 and release_year<=2010);
alter table bike_sales add constraint quantity check(quantity>0);

insert into bike_sales values('1','Pulsar','1','2001','7'),
('2','yamaha','3','2002','3'),
('3','Splender','2','2004','5'),
('4','KTM','2','2003','1'),
('5','Hero','1','2005','9'),
('6','Royal Enfield','2','2001','3'),
('7','Bullet','1','2005','7'),
('8','Revolt RV400','2','2010','7'),
('9','Jawa 42','1','2011','5');
