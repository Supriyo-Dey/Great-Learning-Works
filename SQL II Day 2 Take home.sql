CREATE SCHEMA IF NOT EXISTS Video_Games;
USE Video_Games;
SELECT * FROM Video_Games_Sales;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.
select Name, Platform, sum(NA_Sales) from video_games_sales group by Platform;

# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.
select Name, Platform, Genre, sum(NA_Sales) over(partition by genre) as Genre_sales, 
sum(Global_Sales) over(partition by Platform) as Platformm_Sales,
Global_Sales as Total_Sales from video_games_sales group by Platform, genre order by Global_Sales desc;

# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.
select Platform, Year_of_Release, row_number()over(partition by Platform order by Year_of_Release) from video_games_sales;

# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). Also arrange the result in the descending order by year of release.
select avg(Global_sales) over(partition by Year_of_Release) from video_games_sales order by Year_of_Release desc;

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 
select Name, Critic_Score, Publisher from video_games_sales where Critic_Score in
(select Critic_Score from video_games_sales order by Critic_Score Desc limit 5) group by Publisher;


------------------------------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
------------------------------------------------------------------------------------
# 6. Write a query that displays the opening date two rows forward i.e. the 1st row should display the 3rd website launch date
select id, name, launch_date, lead(launch_date,2)over(order by launch_date asc) as Immediate_nxt from web;

# 7. Write a query that displays the statistics for website_id = 1 i.e. for each row, show the day, the income and the income on the first day.
select day, Income, first_value(Income)over(order by Income) First_income from website_stats where website_id =1;

-----------------------------------------------------------------
# Dataset Used: play_store.csv 
-----------------------------------------------------------------
# 8. For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.
select name, genre, released, rank()over(order by released), dense_rank()over(order by released),row_number()over(order by released)
from play_store group by name;