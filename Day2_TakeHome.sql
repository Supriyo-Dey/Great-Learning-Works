# Use bank_inventory, cricket_1 and cricket_2 tables from Online_Day1_InClass and Online_Day2_InClass to solve the queries.

# # Question 1:
# Q1.Write MySQL query to find highest priced product
use bank;
use sample;
select Product, max(Price) from bank_inventory;

# Question 2:
use sample;
# Q2.Write MySQL query to find third lowest run scorer.
select Distinct Runs from cricket_1 order by Runs desc limit 3; 
#or 
select Runs from cricket_1 c1 where 3=(select count(distinct Runs) from cricket_1 c2 where c1.Runs >= c2.Runs);

# Question 3:
# Q3. Write MySQL query to find player_ID and Player_name which contains “D”.
select Player_ID, Player_Name from cricket_1 where Player_Name like '%D%';

# Question 4:
# Q4.Write MySQL query to extract Player_Name whose name is having second character as 'R'
select Player_Name from cricket_1 where Player_Name like'_R%';

# Question 5:
use sample;
# Q5.Write MySQL query to extract Player_Name whose name whose popularity is greater than 10 or charisma is greater than 50
# from tables cricket_1 and cricket_2 using set operator
select Player_Name from cricket_1 union select Player_Name from cricket_2 where Charisma > 50 or Popularity > 10; 

/* Prerequisites */
-- Use the bank_inventory table from Online_Day1_Inclass file to answer the below questions
# Question 6:
# 6) Display the Geo_locations in capital letters from the table Bank_Holiday.
use bank;
select upper(Geo_location) from bank_inventory;

# Question 7:
# 7) Display the position of occurance of the string ‘City’ in the column  Geo_location from the table Bank_Inventory.
select instr(Geo_location,'City') from bank_inventory;

# Question 8:
# 8) Display the column Quantity from the table Bank_Inventory by applying the below formatting: 
-- a) convert the data type from numeric to character 
-- b) Pad the column with 0's  
select char(Quantity) from bank_inventory;
update bank_inventory set Quantity INT = Quantity zerofill not null;

# To answer 9th question there are few prerquisites to be followed
# PRE - REQUISITE:
Insert into bank_Inventory values ( 'MaxGain',    6 , 220.39, 4690.67, 4890 , 'Riverdale-village' ) ;
Insert into bank_Inventory values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,'Victoria-Town') ;

# Question 9:
# 9) Display the column Geo_location by replacing the underscores with spaces (" ").
-- Use the cricket2 table to answer the below questions
select replace(Geo_Location,'-',' ') from bank_inventory;

# Question 10:
# Q10. Display the columns Player_Name, charisma and Runs by combining into a single comma seperated output. (Name the column as : 'Details')
use sample;
select concat(Player_Name, Charisma, Runs) as Details from cricket_2;