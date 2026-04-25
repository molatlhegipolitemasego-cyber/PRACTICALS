---viewing the first 100 rows
SELECT *
 FROM `wise-imagery-494114-s6.Retail_Sales.Data` 
 LIMIT 100;

---Q1.WHERE Clause
 SELECT *
 FROM `wise-imagery-494114-s6.Retail_Sales.Data`   
 WHERE EXTRACT(YEAR FROM Date) = 2023;

---Q2.Filtering + Conditions
SELECT *
FROM (
    SELECT 
        *,
        AVG(`Total Amount`) OVER () AS Avg_Total_Amount
     FROM `wise-imagery-494114-s6.Retail_Sales.Data`   
)
WHERE `Total Amount` > Avg_Total_Amount;

---Q3.Aggregate Functions
SELECT 
    SUM(`Total Amount`) AS Total_Revenue
FROM `wise-imagery-494114-s6.Retail_Sales.Data`;

---Q4. DISTINCT
SELECT DISTINCT `Product Category`
FROM `wise-imagery-494114-s6.Retail_Sales.Data`;

---Q5.GROUP BY
SELECT 
    `Product Category`,
    SUM(Quantity) AS Total_Quantity
FROM `wise-imagery-494114-s6.Retail_Sales.Data`
GROUP BY `Product Category`;

---Q6. CASE Statement
SELECT 
    `Customer ID`,
    Age,
    CASE 
        WHEN Age < 30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group
FROM `wise-imagery-494114-s6.Retail_Sales.Data`;


---Q7. Conditional Aggregation
SELECT 
    Gender,
    COUNT(CASE WHEN `Total Amount` > 500 THEN 1 END) AS High_Value_Transactions
FROM `wise-imagery-494114-s6.Retail_Sales.Data`
GROUP BY Gender;

---Q8. HAVING Clause
SELECT 
    `Product Category`,
    SUM(`Total Amount`) AS Total_Revenue
FROM `wise-imagery-494114-s6.Retail_Sales.Data`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

---Q9. Calculated Fields
SELECT 
    `Transaction ID`,
    `Price per Unit`,
    CASE 
        WHEN `Price per Unit` < 50 THEN 'Cheap'
        WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
        ELSE 'Expensive'
    END AS Unit_Cost_Category
FROM `wise-imagery-494114-s6.Retail_Sales.Data`;

---Q10. Combining WHERE + CASE
SELECT 
    `Customer ID`,
    Age,
    `Total Amount`,
    CASE 
        WHEN `Total Amount` > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM `wise-imagery-494114-s6.Retail_Sales.Data`
WHERE Age >= 40;

 
 


