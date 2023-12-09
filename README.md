# Data-Mart
Data Mart is a Data Analysis project which is done using the Python, Pandas, SQL and Tableau. Data is cleaned using the python and pandas, Data exploration is done using the SQL, and it is represented using the Tableau.

Table of contents
- [Introduction](#introduction)
- [Data Cleansing](#data-cleansing)
- [Data Exploration](#data-exploration) 
- [Data Representation](#data-representation)
- [Conclusion](#conclusion)


## Introduction
Data Mart is Danny’s latest venture and after running international operations for his online supermarket that specialises in fresh produce - Danny is asking for your support to analyse his sales performance.

In June 2020 - large scale supply changes were made at Data Mart. All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.

Danny needs your help to quantify the impact of this change on the sales performance for Data Mart and it’s separate business areas.

The key business question he wants you to help him answer are the following:

->What was the quantifiable impact of the changes introduced in June 2020?

->Which platform, region, segment and customer types were the most impacted by this change?

->What can we do about future introduction of similar sustainability updates to the business to minimise impact on sales?


## Data Cleansing
->Convert the week_date to a DATE format. 
->Add a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 8th to 14th will be 2 etc. 
->Add a month_number with the calendar month for each week_date value as the 3rd column. 
->Add a calendar_year column as the 4th column containing either 2018, 2019 or 2020 values. 
->Add a new column called age_band after the original segment column using the following mapping on the number inside the segment value. 
->Add a new demographic column using the following mapping for the first letter in the segment values. 
->Ensure all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns. 
->Generate a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record. 

You can find the dataset [before](data_mart.csv) and [after](cleaned_data_mart.csv) cleaning here. The Cleansing is done using the Python, pandas.

## Data Exploration
1. What day of the week is used for each week_date value?
2. How many total transactions were there for each year in the dataset?
3. What is the total sales for each region for each month?
4. What is the total count of transactions for each platform?
5. What is the percentage of sales for Retail vs Shopify for each month?
6. What is the percentage of sales by demographic for each year in the dataset?
7. Which age_band and demographic values contribute the most to Retail sales?
8. Can we use the avg_transaction column to find the average transaction size for each year for Retail vs Shopify? If not - how would you calculate it instead?                                                                

You can find the queries to these above questions [here](cleaned_data_mart.sql).

## Data Representation
This technique is usually used when we inspect an important event and want to inspect the impact before and after a certain point in time.

Taking the week_date value of 2020-06-15 as the baseline week where the Data Mart sustainable packaging changes came into effect. We would include all week_date values for 2020-06-15 as the start of the period after the change and the previous week_date values would be before.

1. What is the total sales for the 4 weeks before and after 2020-06-15? What is the growth or reduction rate in actual values and percentage of sales?
2. What about the entire 12 weeks before and after?
3. How do the sale metrics for these 2 periods before and after compare with the previous year in 2019?

You can get the visualization graphs for the above questions [here](cleaned_data_mart.twbx).

4.Bonus Question
Which areas of the business have the highest negative impact in sales metrics performance in 2020 for the 12 week before and after period?

The answer for this bonus question is uploaded [here](cleaned_data_mart.sql).

## Conclusion

The impact that is created because of some changes happened at the data mart in june 2020 is high. 
We can see that the sales are decreasing over the period in june 2020. The chart in the tableau file shows that sales are changing week over week every year. However the trendline in 2019 is rising, and in 2020 the trend is falling.

Sales in 2019 sales look like a plateau, and sales in 2020 are falling. Actually we can not say that the month june in 2020 was the worst one.

However, the year 2020 shows the maximum absolute sales level comparing to 2019.

Africa and USA showed drop in sales before the period, and Oceania during the period.

Oceania had the highest negative impact in sales metrics performance in 2020.

The sale drops on Retail platform in the middle of the year.

Sales drop in Retail had the highest negative impact in sales metrics performance in 2020. And we can see that the Shopify platform has showed the growth. However, the growth of the Shopify platform did not compensate for the drop in Retail platform.

There is sale drop in the 'unknown' age group inthe months of april, june,august, and in the Retirees age group in the month of April.

Sales drop in unknown demographic group had the highest negative impact in sales metrics performance in 2020.

We can see that Guests and Existing customers had a sales drop in march, and guest customers also showed sales drop in june.

We can conclude that these areas of business had the highest negative impact in sales metrics performance in 2020: sales in Asia and Oceania, retail platform, unknown age and demographic group and guest customers.

In general, packaging issues had a negative sales impact but it was not the only reason for decreasing sales in 2020.
