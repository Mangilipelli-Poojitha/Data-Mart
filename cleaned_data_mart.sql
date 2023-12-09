create database cleaned_data_mart;
use cleaned_data_mart;
select * from weekly_sales;

1. What day of the week is used for each week_date value?

SELECT distinct(dayname(Date)) AS day_name
FROM weekly_sales;

2. How many total transactions were there for each year in the dataset?

select calendar_year,sum(transactions) from weekly_sales group by calendar_year;

3. What is the total sales for each region for each month?

select region, month_number, sum(sales) as 'Total sales' from weekly_sales group by region,month_number;

4. What is the total count of transactions for each platform

select platform, sum(transactions) as 'Total transactions' from weekly_sales group by platform;

5. What is the percentage of sales for Retail vs Shopify for each month?

select a.platform,a.month_number,(a.sales*100)/sum(a.sales) over(partition by a.month_number) as 'percentage_sales' from
(select platform,month_number,sum(sales) as 'sales' from weekly_sales group by platform,month_number)a;

6. What is the percentage of sales by demographic for each year in the dataset?

select a.calendar_year,a.demographic,(a.sales*100)/sum(a.sales) over(partition by calendar_year) as 'percantage_sales' from
(select calendar_year,demographic,sum(sales) as 'sales' from weekly_sales group by calendar_year,demographic)a;

7. Which age_band and demographic values contribute the most to Retail sales?

select b.age_band,b.demographic,b.sales,(b.sales*100)/sum(b.sales) over() as 'contribution' from
(select a.age_band,a.demographic,sum(a.sales) as 'sales' from
(select * from weekly_sales where platform='Retail')a
group by age_band,demographic order by sales desc)b;

8. Can we use the avg_transaction column to find the average transaction size for each year for Retail vs Shopify?
 If not - how would you calculate it instead?
 
 select platform,calendar_year, round(avg(avg_transaction),1) as 'avg_transacton_size' from weekly_sales 
 group by platform,calendar_year;



Bonus Questions

1. Which areas of the business have the highest negative impact in sales metrics performance
 in 2020 before and after period?
 
-REGION

 select c.region from
 (select a.region,(a.sales-b.sales) as 'sales_diff' from
 (select region, sum(sales) as 'sales' from weekly_sales where month_number<6 and calendar_year=2020 
 group by region)a
 inner join
(select region, sum(sales) as 'sales' from weekly_sales 
where month_number>6 and calendar_year=2020 group by region)b on a.region=b.region)c 
order by c.sales_diff limit 3;
 
 -PLATFORM
 
 select c.platform from
 (select a.platform,a.sales-b.sales as 'sales_diff' from
 (select platform, sum(sales) as 'sales' from weekly_sales where month_number<6 and calendar_year=2020 
 group by platform)a
 inner join
(select platform, sum(sales) as 'sales' from weekly_sales 
where month_number>6 and calendar_year=2020 group by platform)b on a.platform=b.platform)c 
order by c.sales_diff desc limit 1;

-AGE BAND

select c.age_band from
 (select a.age_band,abs(a.sales-b.sales) as 'sales_diff' from
 (select age_band, sum(sales) as 'sales' from weekly_sales where month_number<6 and calendar_year=2020 
 group by age_band)a
 inner join
(select age_band, sum(sales) as 'sales' from weekly_sales 
where month_number>6 and calendar_year=2020 group by age_band)b on a.age_band=b.age_band)c 
order by c.sales_diff desc limit 3;

-DEMOGRAPHIC
 
 select c.demographic from
 (select a.demographic,abs(a.sales-b.sales) as 'sales_diff' from
 (select demographic, sum(sales) as 'sales' from weekly_sales where month_number<6 and calendar_year=2020 
 group by demographic)a
 inner join
(select demographic, sum(sales) as 'sales' from weekly_sales 
where month_number>6 and calendar_year=2020 group by demographic)b on a.demographic=b.demographic)c 
order by c.sales_diff desc limit 3;

-CUSTOMER TYPE

 select c.customer_type from
 (select a.customer_type,abs(a.sales-b.sales) as 'sales_diff' from
 (select customer_type, sum(sales) as 'sales' from weekly_sales where month_number<6 and calendar_year=2020 
 group by customer_type)a
 inner join
(select customer_type, sum(sales) as 'sales' from weekly_sales 
where month_number>6 and calendar_year=2020 group by customer_type)b on a.customer_type=b.customer_type)c 
order by c.sales_diff desc limit 3;


 