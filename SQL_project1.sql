USE CustomerChurnDB;
select count(*) as Total_Rows
from customerchurn;

select customerID, count(*) as CountofCustomers
from CustomerChurn
group by customerID
having count(*)>1;

SELECT COUNT(*) AS Churned_Customers
FROM CustomerChurn
WHERE Churn = 'Yes';

SELECT COUNT(*) AS Retained_Customers
FROM CustomerChurn
WHERE Churn = 'No';

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM CustomerChurn;

SELECT
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charge
FROM CustomerChurn;

SELECT
    ROUND(AVG(TotalCharges), 2) AS Avg_Total_Charges
FROM CustomerChurn;

SELECT
    ROUND(AVG(CAST(tenure AS FLOAT)), 2) AS Avg_Tenure_Months
FROM CustomerChurn;

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Churn_Rate,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(TotalCharges), 2) AS Avg_Total_Charge,
    ROUND(AVG(CAST(tenure AS FLOAT)), 2) AS Avg_Tenure
FROM CustomerChurn;

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY Contract
ORDER BY Churn_Rate DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY Gender
ORDER BY Churn_Rate DESC;

SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY Partner
ORDER BY Churn_Rate DESC;

SELECT
    Dependents,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY Dependents
ORDER BY Churn_Rate DESC;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS Churn_Rate
FROM CustomerChurn
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END
ORDER BY Churn_Rate DESC;

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges < 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS Charge_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate
FROM CustomerChurn
GROUP BY
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges < 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END
ORDER BY Churn_Rate DESC;

SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS Churn_Rate
FROM CustomerChurn
GROUP BY TechSupport
ORDER BY Churn_Rate DESC;

SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS Churn_Rate
FROM CustomerChurn
GROUP BY OnlineSecurity
ORDER BY Churn_Rate DESC;

SELECT
    Contract,
    Churn,
    COUNT(*) AS Customers
FROM CustomerChurn
GROUP BY Contract, Churn
ORDER BY Contract;

WITH ContractChurn AS
(
    SELECT
        Contract,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
        ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS Churn_Rate
    FROM CustomerChurn
    GROUP BY Contract
)

SELECT *
FROM ContractChurn
WHERE Churn_Rate > 40;

