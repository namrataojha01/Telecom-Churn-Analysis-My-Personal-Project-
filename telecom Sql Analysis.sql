use telecom_churn;

-- Q1. Total Customers, Churned Customers & Overall Churn Rate
-- Business: Sabse pehla aur important metric — kitne customers gaye?

SELECT 
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned_Customers,
    COUNT(*) - SUM(Is_Churned) AS Retained_Customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct
FROM customer_churn;
 

-- Q2. Customer Status wise Count & Percentage
-- Business: Customers teen categories mein — Churned, Stayed, Joined

SELECT 
    Customer_Status,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_churn), 2) AS Percentage,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge
FROM customer_churn
GROUP BY Customer_Status
ORDER BY Total_Customers DESC;
 
 
-- Q3. Top 10 Cities by Customer Count
-- Business: Kaunse cities mein sabse zyada customers hain?

SELECT 
    City,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue
FROM customer_churn
GROUP BY City
ORDER BY Total_Customers DESC
LIMIT 10;
 

-- Q4. Gender wise Churn Analysis
-- Business: Kya gender churn mein role play karta hai?

SELECT 
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned_Customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Tenure_in_Months), 2) AS Avg_Tenure_Months
FROM customer_churn
GROUP BY Gender
ORDER BY Churn_Rate_Pct DESC;
 
 

-- Q5. Contract Type wise Customer Distribution
-- Business: Kaunse contract type pe sabse zyada churn?

SELECT 
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Total_Revenue), 2) AS Avg_Revenue
FROM customer_churn
GROUP BY Contract
ORDER BY Churn_Rate_Pct DESC;
  

-- Q6. Churn Rate by Age Group
-- Business: Kaun si age group sabse zyada churn kar rahi hai?

SELECT 
    Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Tenure_in_Months), 2) AS Avg_Tenure
FROM customer_churn
GROUP BY Age_Group
ORDER BY Age_Group;
 
 

-- Q7. Top 10 Churn Reasons
-- Business: Customers kyun ja rahe hain — exact reasons kya hain

SELECT 
    Churn_Reason,
    Churn_Category,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_churn WHERE Is_Churned = 1), 2) AS Pct_of_Churned,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(SUM(Total_Revenue), 2) AS Revenue_Lost
FROM customer_churn
WHERE Is_Churned = 1
  AND Churn_Reason != 'No Churn'
GROUP BY Churn_Reason, Churn_Category
ORDER BY Total_Customers DESC
LIMIT 10;
 
 

-- Q8. Average Revenue by Customer Status
-- Business: Churned customers kitna revenue generate kar rahe the?

SELECT 
    Customer_Status,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Total_Revenue), 2) AS Avg_Revenue_Per_Customer,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Revenue_per_Month), 2) AS Avg_Revenue_Per_Month,
    ROUND(AVG(Tenure_in_Months), 2) AS Avg_Tenure_Months
FROM customer_churn
GROUP BY Customer_Status
ORDER BY Total_Revenue DESC;
 
 

-- Q9. Offer wise Churn Rate
-- Business: Kaunsa offer churn rokne mein sabse effective hai?

SELECT 
    Offer,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Tenure_in_Months), 2) AS Avg_Tenure_Months
FROM customer_churn
GROUP BY Offer
ORDER BY Churn_Rate_Pct ASC;
 
 

-- Q10. Internet Type wise Churn Analysis
-- Business: Fiber optic customers zyada churn kar rahe hain kya?

SELECT 
    Internet_Type,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Avg_Monthly_GB_Download), 2) AS Avg_GB_Download
FROM customer_churn
GROUP BY Internet_Type
ORDER BY Churn_Rate_Pct DESC;
 
 

-- Q11. Tenure Group wise Churn Rate
-- Business: Naye customers zyada jaate hain ya purane?

SELECT 
    Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Total_Revenue), 2) AS Avg_Total_Revenue
FROM customer_churn
GROUP BY Tenure_Group
ORDER BY Tenure_Group;
 
 

-- Q12. Payment Method wise Analysis
-- Business: Kaunse payment method wale customers loyal hain?

SELECT 
    Payment_Method,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue
FROM customer_churn
GROUP BY Payment_Method
ORDER BY Churn_Rate_Pct DESC;
 
 

-- Q13. Monthly Charge Comparison — Churned vs Stayed
-- Business: Kya high paying customers zyada churn kar rahe hain?

SELECT 
    Customer_Status,
    ROUND(MIN(Monthly_Charge), 2) AS Min_Charge,
    ROUND(MAX(Monthly_Charge), 2) AS Max_Charge,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Charge,
    ROUND(AVG(Total_Charges), 2) AS Avg_Total_Charges,
    ROUND(AVG(Total_Refunds), 2) AS Avg_Refunds,
    COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Customer_Status
ORDER BY Avg_Charge DESC;
 

-- Q14. Revenue Lost by City with Population (JOIN Query)
-- Business: Kaunse cities mein sabse zyada revenue loss hua?

SELECT 
    cc.City,
    zp.Population,
    COUNT(*) AS Total_Customers,
    SUM(cc.Is_Churned) AS Churned_Customers,
    ROUND(SUM(cc.Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(SUM(CASE WHEN cc.Is_Churned = 1 THEN cc.Total_Revenue ELSE 0 END), 2) AS Revenue_Lost,
    ROUND(SUM(CASE WHEN cc.Is_Churned = 0 THEN cc.Total_Revenue ELSE 0 END), 2) AS Revenue_Retained
FROM customer_churn cc
JOIN zipcode_population zp ON cc.Zip_Code = zp.Zip_Code
GROUP BY cc.City, zp.Population
ORDER BY Revenue_Lost DESC
LIMIT 10;
 

-- Q15. High Risk Customers Identification
-- Business: Kaun se active customers churn karne wale hain?

SELECT 
    Customer_ID,
    City,
    Age,
    Contract,
    Tenure_in_Months,
    Monthly_Charge,
    Internet_Type,
    Number_of_Services,
    Number_of_Referrals,
    CASE 
        WHEN Contract = 'Month-to-Month' 
             AND Tenure_in_Months <= 12 
             AND Monthly_Charge > 70 
             AND Number_of_Services <= 2 THEN 'Very High Risk'
        WHEN Contract = 'Month-to-Month' 
             AND Tenure_in_Months <= 24 
             AND Number_of_Referrals = 0 THEN 'High Risk'
        WHEN Contract = 'Month-to-Month' 
             AND Number_of_Services <= 3 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Churn_Risk
FROM customer_churn
WHERE Customer_Status = 'Stayed'
ORDER BY 
    CASE 
        WHEN Contract = 'Month-to-Month' 
             AND Tenure_in_Months <= 12 
             AND Monthly_Charge > 70 
             AND Number_of_Services <= 2 THEN 1
        WHEN Contract = 'Month-to-Month' 
             AND Tenure_in_Months <= 24 
             AND Number_of_Referrals = 0 THEN 2
        WHEN Contract = 'Month-to-Month' 
             AND Number_of_Services <= 3 THEN 3
        ELSE 4
    END
LIMIT 20;
 

-- Q16. Services Impact on Churn
-- Business: Jitni zyada services, utna kam churn?

SELECT 
    Number_of_Services,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(Total_Revenue), 2) AS Avg_Total_Revenue,
    ROUND(AVG(Tenure_in_Months), 2) AS Avg_Tenure
FROM customer_churn
GROUP BY Number_of_Services
ORDER BY Number_of_Services;
 
 

-- Q17. Customer Lifetime Value (CLV) Calculation
-- Business: Har customer kitna valuable hai company ke liye?

SELECT 
    Customer_ID,
    City,
    Contract,
    Tenure_in_Months,
    Monthly_Charge,
    Total_Revenue,
    ROUND(Monthly_Charge * Tenure_in_Months, 2) AS Expected_Revenue,
    ROUND(Total_Revenue / NULLIF(Tenure_in_Months, 0), 2) AS Monthly_CLV,
    ROUND((Monthly_Charge * 12), 2) AS Annual_Value,
    CASE 
        WHEN Total_Revenue >= 5000 THEN 'Platinum'
        WHEN Total_Revenue >= 3000 THEN 'Gold'
        WHEN Total_Revenue >= 1000 THEN 'Silver'
        ELSE 'Bronze'
    END AS Customer_Segment,
    Customer_Status
FROM customer_churn
ORDER BY Total_Revenue DESC
LIMIT 20;
 
 

-- Q18. Churn Rate by Tenure with Running Total
-- Business: Konse month pe churn rate peak hoti hai?

SELECT 
    Tenure_in_Months,
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    SUM(SUM(Is_Churned)) OVER (ORDER BY Tenure_in_Months) AS Running_Total_Churned,
    ROUND(
        SUM(SUM(Is_Churned)) OVER (ORDER BY Tenure_in_Months) * 100.0 / 
        SUM(COUNT(*)) OVER (), 2
    ) AS Cumulative_Churn_Pct
FROM customer_churn
GROUP BY Tenure_in_Months
ORDER BY Tenure_in_Months;
 
 

-- Q19. Top 10 Cities — Churn Rate with Population Density
-- Business: High population cities mein churn alag hai kya?

SELECT 
    cc.City,
    MAX(zp.Population) AS Population,
    COUNT(*) AS Total_Customers,
    SUM(cc.Is_Churned) AS Churned,
    ROUND(SUM(cc.Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct,
    ROUND(COUNT(*) * 100.0 / MAX(zp.Population), 4) AS Customer_Penetration_Pct,
    ROUND(SUM(cc.Total_Revenue), 2) AS Total_Revenue,
    ROUND(SUM(CASE WHEN cc.Is_Churned = 1 THEN cc.Total_Revenue ELSE 0 END), 2) AS Revenue_Lost
FROM customer_churn cc
JOIN zipcode_population zp ON cc.Zip_Code = zp.Zip_Code
GROUP BY cc.City
HAVING COUNT(*) >= 30
ORDER BY Churn_Rate_Pct DESC
LIMIT 10;
 
 
-- ─────────────────────────────────────────────────────────────
-- Q20. Revenue Contribution — Contract + Internet Type (Pivot Style)
-- Business: Kaunsa combination sabse zyada revenue deta hai?
-- ─────────────────────────────────────────────────────────────
SELECT 
    Contract,
    ROUND(SUM(CASE WHEN Internet_Type = 'Fiber Optic' THEN Total_Revenue ELSE 0 END), 2) AS Fiber_Optic_Revenue,
    ROUND(SUM(CASE WHEN Internet_Type = 'Cable' THEN Total_Revenue ELSE 0 END), 2) AS Cable_Revenue,
    ROUND(SUM(CASE WHEN Internet_Type = 'DSL' THEN Total_Revenue ELSE 0 END), 2) AS DSL_Revenue,
    ROUND(SUM(CASE WHEN Internet_Type = 'No Internet Service' THEN Total_Revenue ELSE 0 END), 2) AS No_Internet_Revenue,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Monthly_Charge), 2) AS Avg_Monthly_Charge,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct
FROM customer_churn
GROUP BY Contract
ORDER BY Total_Revenue DESC;
 
 