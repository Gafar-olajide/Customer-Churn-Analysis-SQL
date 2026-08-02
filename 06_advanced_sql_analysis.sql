/* -------------------------------------------------------------------------------
Section 5 – Advanced Churn Analysis 
-- =============================================================================
-- Part A – Churn by Contract Type
-- =============================================================================
---------------------------------------------------------------------------------*/

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part B – Churn by Payment Method
-- =============================================================================

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part C – Churn by Tenure Group (CASE Statement)
-- =============================================================================

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate

FROM telecom_customer_churn

GROUP BY Tenure_Group

ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part D – CTE Example
-- =============================================================================

WITH ChurnSummary AS
(
SELECT

Contract,

COUNT(*) AS Customers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned

FROM telecom_customer_churn

GROUP BY Contract
)

SELECT

Contract,

Customers,

Churned,

ROUND(Churned*100.0/Customers,2) AS Churn_Rate

FROM ChurnSummary

ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part E – Window Function (Ranking payment methods by churn rate).
-- =============================================================================

SELECT

PaymentMethod,

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
2
) AS Churn_Rate,

RANK() OVER(

ORDER BY

ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
2
) DESC

) AS Risk_Rank

FROM telecom_customer_churn

GROUP BY PaymentMethod;
 
-- =========================================================================================
-- Part F – Subquery (Find customers whose TotalCharges are above the company average).
-- =========================================================================================

SELECT

customerID,

Contract,

MonthlyCharges,

TotalCharges

FROM telecom_customer_churn

WHERE TotalCharges >
(
SELECT AVG(TotalCharges)

FROM telecom_customer_churn
)

ORDER BY TotalCharges DESC;

-- =========================================================================================
-- Part G – Top 10 Highest-Value Customers (combining a Window Function with ranking).
-- =========================================================================================
SELECT

customerID,

Contract,

TotalCharges,

RANK() OVER(

ORDER BY TotalCharges DESC

) AS Customer_Rank

FROM telecom_customer_churn

LIMIT 10;
