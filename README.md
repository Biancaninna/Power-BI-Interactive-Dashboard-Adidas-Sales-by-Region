# Adidas Sales Overview Analysis
In this project we will build dynamic and interactive Adidas Sales Overview Analysis Dashboard by Region, we will use MySQL and Power BI tools which are currently being used in the market and there is a very high demand for these particular tools. We will use some advanced functions, some advanced Dax functions, conditional filtering and conditional formatting, and also action filters. Adidas sales data by Region in this project is obtained from Kaggle.com.

## Steps in Project
1. Requirement Gathering/ Business Requirements
2. Data Walkthrough
3. Data Connection
4. Data Cleaning/ Quality Check
5. Data Modeling
6. Data Processing
7. Dax Calculations
8. Dashboard Background
9. Dashboard Lay outing
10. Charts Development and Formatting
11. Dashboard/ Report Development
12. Insights Generation

## Software Used
- MS EXCEL
- MS SQL Server
- Power BI

## Business Requirement
Our clients wants us to create a Adidas sales by region dashboard so that they can have insight on the below requirements. They wants us to design a dynamic Power BI Dashboard that tracks key metrics -Sales, Profit, and Quantity- across five regions that is Midwest, Northeast, South, Southeast, West. The Dashboard should allow users to filter by year and dynamically switch between the three metrics (Sales, Profit, and Quantity). Additionally, it should include the comparison with the previous year's (PY) sales for the selected year.
### KPI's Requirements
##### Midwest Region
1. Display Sales, Profit, and Quantity as per the selected year filter.
2. Allow dynamic selection between Sales, Profit, and Quantity.
3. Show Sales for the previous year based on the selected year.
4. Create a bar sparkline for monthly data, including an average line for better trend data analysis.

##### Northeast Region
1. Display Sales, Profit, and Quantity as per the selected year filter.
2. Allow dynamic selection between Sales, Profit, and Quantity.
3. Show Sales for the previous year based on the selected year.
4. Create a bar sparkline for monthly data, including an average line for better trend data analysis.

##### South Region
1. Display Sales, Profit, and Quantity as per the selected year filter.
2. Allow dynamic selection between Sales, Profit, and Quantity.
3. Show Sales for the previous year based on the selected year.
4. Create a bar sparkline for monthly data, including an average line for better trend data analysis.

##### Southeast Region
1. Display Sales, Profit, and Quantity as per the selected year filter.
2. Allow dynamic selection between Sales, Profit, and Quantity.
3. Show Sales for the previous year based on the selected year.
4. Create a bar sparkline for monthly data, including an average line for better trend data analysis.

##### West Region
1. Display Sales, Profit, and Quantity as per the selected year filter.
2. Allow dynamic selection between Sales, Profit, and Quantity.
3. Show Sales for the previous year based on the selected year.
4. Create a bar sparkline for monthly data, including an average line for better trend data analysis.

### Chart's Requirements
##### Sales by State
- Bubble Map: Display a bubble map to visualize sales distribution across different states. The size of each bubble should correspond to the sales volume, allowing users to identify states with high or low sales.
- Bar Chart: Place a bar chart alongside the bubble map to provide a detailed breakdown of sales by state. This chart should allow for easy comparison between states, with bar sorted either in ascending or descending order of sales.

##### Create a table/ grid to display key metrics for both current and previous years. This table should include the following columns:
1. CY Sales: Current Year Sales
2. PY Sales: Previous Year Sales
3. YoY Sales: Year-Over-Year Sales Growth 
4. CY Profit: Current Year Profit
5. PY Profit: Previous Year Profit
6. YoY Profit: Year-Over-Year Profit Growth
7. CY Quantity: Current Year Quantity
8. PY Quantity: Previous Year Quantity
9. YoY Quantity: Year-Over-Year Quantity Growth

### Explanation of steps
1. Connecting MySQL database to Power BI.
2. We need to check carefully each row whether everything looks good, check each data type, make sure if the date order and date data type are correct, which is using the 'date' data type, make sure the columns and rows of the table use the correct data type.
3. Create Callender table or a date table and then we will do data modeling

   For calculating purposes to find out our current year and previous year, we hae to deal with time intelligence functions. Whenever you are doing time intelligence functions for finding out those metrics, it is recommended to build a callender table or a date table. You can do this in Table View. Home Tab and then click on New Table.

    >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Calender%20Table.png?raw=true)

    To find out the dates, the range of dates are taken from the original data. The start date will be our minimum date and the last date will be our maximum date. 
    For the start date will be using minimum function and for the last date will be using maximum function. There will be a unique date on each and every row and it will not be repeated.
4. Then we have to extract year

   Select Table Tools and click on New Column and name that column as Year

   >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Year.png?raw=true)
   
5. Extract month

   In sparkline we need to use month to find out all the metrics sales, profit as well as quantity. Click on New Column and we will name it as Month. We want names of the month so we have to use format function.

   >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Month.png?raw=true)
   
   If you want full name of that month, you have to type four times "m", and if you just want the first three initial letters of that month, then you just need to type three times "m".
6. Create connection between two tables

   Go to Model View then Manage Relationship

   >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Connection%20.png?raw=true)

7. Add background for our report

    Go to Report View and in Visualization you can choose Format Page. Then go to Canvas Background and click on Browse to browse your image, choose your PNG/JPG file and Open.

8. KPI's Building
    - Total Sales

      Right click on Data and click on New Measure

      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Total%20Sales.png?raw=true)
    - Total Profit

      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Total%20Profit.png?raw=true)
    - Total Quantity

      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Total%20Quantity.png?raw=true)

9. Create a Parameter 

   Because we have to switch between these three particular metrics. Go to Modeling Tab - New Parameter - Fields. Name  the Parameter as "Select Metrics" then just drag the Total Sales, Total Profit, and Total Quantity fields to Add and Reorder Fields and then click on create. The Dax function will automatically be created when we create the Particulars parameter. 

   >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Select%20Metrics.png?raw=true)

   As soon as you do, a new field has been created and automatically these matrices are displayed in the form of a slicer. Then create a KPI by clicking New Card in Visualizations and dragging the “Select Metrics” field on the KPI. Next, we just need to filter the KPIs for each region. For that, either by writing calculations or by manual filtering. In this project, we will use a manual filter condition only by dragging the region in the filter page.

10. Creating a slicer for the year

    Click the slicer on the Visualizations and drag the Year from Calendar Table to the slicer. Then you can do some formattings.
    
11. Creating a Dynamic Title

    On the sales data, right-click and select New Measure.
   
    >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/Dynamic%20Title.png?raw=true)

    To visualize it, just select card and drag the Dynamic Title field on it and do some formatting. This process gives us a dynamic way to display titles.
    
12. Creating PY KPI Sales

    just add New Measure

    >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/PY%20KPI%20Sales.png?raw=true)

    To visualize it, just select card and drag the PY KPI Sales field on it and do some formatting. Then do filtering for each region.
> After this, we just need to visualize the requirement chart and do some formatting.

13. Creating a Bubble Map
    
    Select a Map Chart, add and drag State field to Location, drag Region field to Legend, and drag "Select Metrics" field to Bubble Size. Then you can do some formatting.
    
14. Creating a Bar Chart

    Select Clustered Bar Chart. Add and drag State field to Y-axis and drag "Select Metrics" field to X-axis, drag Region field to Legend. After that switch the Clustered Bar Chart into Stacked Bar Chart because if you select Staked Bar Chart before then the Legend will be distorted. Next, you can do some formatting.
    
15. Creating a Table/Grid to display key metrics

    Before building the table or grid, we need to create New Measure for KPI Requirement first.

    >KPI's Building
    
      a. CY Sales
      
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/CY%20Sales.png?raw=true)
      
      b. CY Profit
         
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/CY%20Profit.png?raw=true)
      
      c. CY Quantity
      
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/CY%20Quantity.png?raw=true)
      
      d. PY Sales
         
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/PY%20Sales.png?raw=true)

      e. PY Profit
         
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/PY%20Profit.png?raw=true)
      
      f. PY Quantity
      
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/PY%20Quantity.png?raw=true)
      
      g. YoY Sales
      
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/YoY%20Sales.png?raw=true)
      
      h. YoY Profit
      
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/YoY%20Profit.png?raw=true)
      
      i. YoY Quantity
      
      >![image alt](https://github.com/Biancaninna/Power-BI-Documentation-Adidas/blob/master/YoY%20Quantity.png?raw=true)

To visualize it, just select Matrix on Visualization and drag Region field to Row, then bring all the KPIs above to Values. Next we just need to do some formatting.

You can see the final result of the Power BI Dashboard visualization in this project by clicking the badge below

   [![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://github.com/Biancaninna/Adidas-Sales-Overview-Analysis/blob/72e87c4f72902b266f727fb4bf50b4b141c181a2/Adidas%20Sales%20Dashboard%20Power%20BI.pbix)
