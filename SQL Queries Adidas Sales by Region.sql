-- SQL Query for Adidas Sales Overview Analysis Power BI Dashboard

-- Total Sales for each region in 2020 and 2021
select distinct mysqlpb2.adidas.Region as region,
			year(mysqlpb2.adidas.Invoice_date) as year,
				sum(mysqlpb2.adidas.Total_Sale) as total_sales
from mysqlpb2.adidas
	where year(mysqlpb2.adidas.Invoice_date) in (2020,2021)
group by year, region
order by region

-- Total Profit for each region in 2020 and 2021
select distinct mysqlpb2.adidas.Region as region,
			year(mysqlpb2.adidas.Invoice_date) as year,
				sum(mysqlpb2.adidas.Operating_Profit) as total_profit
from mysqlpb2.adidas
	where year(mysqlpb2.adidas.Invoice_date) in (2020,2021)
group by year, region
order by region

-- Total quantity for each region in 2020 and 2021
select distinct mysqlpb2.adidas.Region as region,
			year(mysqlpb2.adidas.Invoice_date) as year,
				sum(mysqlpb2.adidas.Units_Sold) as total_quantity
from mysqlpb2.adidas
	where year(mysqlpb2.adidas.Invoice_date) in (2020,2021)
group by year, region
order by region

-- Sales by state and Region in all time
select distinct mysqlpb2.adidas.state as state, mysqlpb2.adidas.region as region,
			sum(mysqlpb2.adidas.Total_Sale) as sales
from mysqlpb2.adidas
group by state, region
order by sales desc

-- Sales by state and Region in 2021
select distinct mysqlpb2.adidas.state as state, mysqlpb2.adidas.region as region,
			sum(mysqlpb2.adidas.Total_Sale) as sales
from mysqlpb2.adidas
	where year(mysqlpb2.adidas.Invoice_date) = 2021
group by state, region
order by sales desc

-- Sales by state and Region in 2020
select distinct mysqlpb2.adidas.state as state, mysqlpb2.adidas.region as region,
			sum(mysqlpb2.adidas.Total_Sale) as sales
from mysqlpb2.adidas
	where year(mysqlpb2.adidas.Invoice_date) = 2020
group by state, region
order by sales desc

-- Year of Year Sales
with cte as(select mysqlpb2.adidas.region region,  year(mysqlpb2.adidas.Invoice_Date) year, SUM(mysqlpb2.adidas.Total_Sale) sales
            from mysqlpb2.adidas
				group by mysqlpb2.adidas.region, year(mysqlpb2.adidas.Invoice_Date)
					order by mysqlpb2.adidas.region)
select c1.*, round(((c1.sales - c2.sales) / c2.sales),2) * 100 as yoy_sales
from cte c1
left join cte c2 on c1.region = c2.region and c1.year = c2.year + 1

-- Year of Year Profit
with cte as(select mysqlpb2.adidas.region region, 
				year(mysqlpb2.adidas.Invoice_Date) year, 
                   SUM(mysqlpb2.adidas.Operating_profit) profit
            from mysqlpb2.adidas
            group by mysqlpb2.adidas.region, year(mysqlpb2.adidas.Invoice_Date)
            order by mysqlpb2.adidas.region)
select c1.*, round(((c1.profit - c2.profit) / c2.profit),2) * 100  as yoy_profit
from cte c1
left join cte c2 on c1.region = c2.region and c1.year = c2.year + 1

-- Year of Year Quantity
with cte as(select mysqlpb2.adidas.region region, 
				year(mysqlpb2.adidas.Invoice_Date) year, 
                   SUM(mysqlpb2.adidas.Units_sold) quantity
            from mysqlpb2.adidas
            group by mysqlpb2.adidas.region, year(mysqlpb2.adidas.Invoice_Date)
            order by mysqlpb2.adidas.region)
select c1.*, round(((c1.quantity - c2.quantity) / c2.quantity),2) * 100  as yoy_quantity
from cte c1
left join cte c2 on c1.region = c2.region and c1.year = c2.year + 1