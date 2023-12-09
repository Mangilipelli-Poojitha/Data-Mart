# Data-Mart
Data Mart is a Data Analysis project which is done using the Python, Pandas, SQL and Tableau. Data is cleaned using the python and pandas, Data exploration is done using the SQL, and it is represented using the Tableau.

Table of contents
## [Introduction](#Introduction)
## [Data Cleansing](#Data-cleansing)
## [Data Exploration](#Data-Exploration) 
## [Data Representation](#Data-Representation)


# Introduction
Data Mart is Danny’s latest venture and after running international operations for his online supermarket that specialises in fresh produce - Danny is asking for your support to analyse his sales performance.

In June 2020 - large scale supply changes were made at Data Mart. All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.

Danny needs your help to quantify the impact of this change on the sales performance for Data Mart and it’s separate business areas.

The key business question he wants you to help him answer are the following:

->What was the quantifiable impact of the changes introduced in June 2020?

->Which platform, region, segment and customer types were the most impacted by this change?

->What can we do about future introduction of similar sustainability updates to the business to minimise impact on sales?


# Data Cleansing
->Convert the week_date to a DATE format. 
->Add a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 8th to 14th will be 2 etc. 
->Add a month_number with the calendar month for each week_date value as the 3rd column. 
->Add a calendar_year column as the 4th column containing either 2018, 2019 or 2020 values. 
->Add a new column called age_band after the original segment column using the following mapping on the number inside the segment value. 
->Add a new demographic column using the following mapping for the first letter in the segment values. 
->Ensure all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns. 
->Generate a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record. 



