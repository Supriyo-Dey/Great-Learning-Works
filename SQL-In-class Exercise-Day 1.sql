# Question 1:
# 1) Create a Database Bank
create database Bank;
use Bank;
# Question 2:
# 2) Create a table with the name “Bank_Inventory” with the following columns

-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purcahase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --
create table Bank_Inventory(Product varchar(20), Quantity integer(5), Price real, purchase_cost decimal(6,2), estimated_sales_price float)
# Question 3:
# 3) Display all columns and their datatype and size in Bank_Inventory
select * from Bank_Inventory;
# Question 4:
# 4) Insert two records into Bank_Inventory .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --
-- 2nd record with values --
			-- Product : PayPoints
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56
insert into Bank_Inventory values('Paycard',2,300.45,8000.87,9000.56);
insert into Bank_Inventory values('Paypoints',4,200.89,7000.67,6700.56);
# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 
alter table Bank_Inventory add Geo_Location varchar(20);
# Question 6:
# 6) What is the value of Geo_Location for product : ‘PayCard’?
select Geo_Location from Bank_Inventory where product = 'PayCard';
# Question 7:
# 7) How many characters does the  Product : ‘PayCard’ stores in the Bank_Inventory table.
select char_length(product) from Bank_Inventory where product = 'PayCard';
# Question 8:
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 
# b) How many characters does the  Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table
update Bank_Inventory
set Geo_Location = 'Delhi-City'
where Geo_Location is Null;
select char_length(Geo_Location) from Bank_Inventory where product = 'Delhi-City';

# Question 9:
# 9) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 
alter table Bank_Inventory modify Product varchar(10);
# Question 10:
# 10) Reduce the size of the Product field from 10 to 6 and check if it is possible 
alter table Bank_Inventory modify Product varchar(6);
# Question 11:
# 11) Bank_inventory table consists of ‘PayCard’ product details .
-- For ‘PayCard’ product, Update the quantity from 2 to 10  
update Bank_Inventory set quantity = 10 where product ='PayCard';
 # Question 12:
# 12) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date 
-- b) Start_time field which also displays or accepts date and time both.  
-- c) End_time field which also displays or accepts date and time along with the timezone also. 
create table Bank_Holiday (Holiday date, Start_time datetime, End_time timestamp);
 # Question 13:
# 13) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 
insert into Bank_holiday values(current_date(),current_date(),current_date());
update Bank_Holiday set Holiday = date_add(Holiday, interval 1 day);
# Question 14:
# 14) Modify  the Start_time data with today’s date in the Bank_Holidays table 
update Bank_Holiday set Start_time = current_timestamp();
# Question 15:
# 15) Update the End_time with current european time in the Bank_Holidays table. 
update Bank_Holiday set End_time = utc_timestamp();
# Question 16:
# 16) Select all columns from Bank_Inventory without mentioning any column name
select * from Bank_Inventory;
# Question 17:
# 17)  Display output of PRODUCT field as NEW_PRODUCT in  Bank_Inventory table 
select product as NEW_PRODUCT from Bank_Inventory; 
# Question 18:
# 18)  Display only one record from bank_Inventory 
select*from Bank_Inventory limit 1;
# Question 19:
# 19) Display Holiday field as  DD-MM-YYYY format in Bank_holidays table. 
--  Ex: 10-February-2020
update Bank_Holiday set End_time = current_timestamp(); ## Other solution as per the question displayed in Mam's screen. 

SELECT DATE_FORMAT(Holiday, "%d-%M-%Y")  from Bank_Holiday;

# Question 20:
# 20) Display the first five characters of the Geo_location field of Bank_Inventory.
select Geo_Location from Bank_Inventory limit 5; ## Other solution as per the question displayed in Mam's screen. 

select substr('Geo_Location',1,5) as ExtractString from bank_inventory;

