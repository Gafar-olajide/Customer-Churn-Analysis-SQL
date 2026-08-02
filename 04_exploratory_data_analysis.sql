/*--------------------------------------------------------------------------------
Section 1 – Customer Overview
-- =============================================================================
--  Query 1: Total Customers
-- =============================================================================
----------------------------------------------------------------------------------*/

SELECT COUNT(*) AS Total_Customers
FROM telecom_customer_churn;

-- =============================================================================
-- Query 2: Active Customers
-- =============================================================================

SELECT COUNT(*) AS Active_Customers
FROM telecom_customer_churn
WHERE Churn = 'No';

-- =============================================================================
-- Query 3: Churned Customers
-- =============================================================================

SELECT COUNT(*) AS Churned_Customers
FROM telecom_customer_churn
WHERE Churn = 'Yes';

-- =============================================================================
-- Query 4: Overall Churn Rate
-- =============================================================================

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM telecom_customer_churn;

/*---------------------------------------------------------------------------------
 Section 2 – Customer Demographics
 -- =============================================================================
 -- Part A: Gender Distribution:
 -- Query 1: Customer Distribution by Gender
 -- =============================================================================
-----------------------------------------------------------------------------------*/

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telecom_customer_churn), 2) AS Percentage
FROM telecom_customer_churn
GROUP BY Gender;

-- =============================================================================
-- Query 2: Churn by Gender
-- =============================================================================

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY Gender;

-- =============================================================================
-- Part B: Senior Citizen Analysis:
-- Query 1: Distribution
-- =============================================================================

SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS Customer_Group,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telecom_customer_churn), 2) AS Percentage
FROM telecom_customer_churn
GROUP BY SeniorCitizen;

-- =============================================================================
-- Query 2: Churn by Senior Citizen
-- =============================================================================

SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS Customer_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY SeniorCitizen;

-- =============================================================================
-- Part C: Partner Status:
-- Distribution
-- =============================================================================

SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telecom_customer_churn),2) AS Percentage
FROM telecom_customer_churn
GROUP BY Partner;

-- =============================================================================
-- Churn by Partner Status
-- =============================================================================

SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY Partner;

-- =============================================================================
-- Part D: Dependents:
-- Distribution
-- =============================================================================

SELECT
    Dependents,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM telecom_customer_churn),2) AS Percentage
FROM telecom_customer_churn
GROUP BY Dependents;

-- =============================================================================
-- Churn by Dependents
-- =============================================================================

SELECT
    Dependents,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY Dependents;

/*----------------------------------------------------------------------------------
 Section 3 – Customer Services Analysis
 -- =============================================================================
 -- Part A: Internet Service:
 -- Query 1: Customer Distribution
 -- =============================================================================
------------------------------------------------------------------------------------*/

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telecom_customer_churn),2) AS Percentage
FROM telecom_customer_churn
GROUP BY InternetService;

-- =============================================================================
-- Query 2: Churn by Internet Service
-- =============================================================================

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part B: Online Security
-- =============================================================================

SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY OnlineSecurity
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part C: Online Backup
-- =============================================================================

SELECT
    OnlineBackup,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY OnlineBackup
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part D: Device Protection
-- =============================================================================

SELECT
    DeviceProtection,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY DeviceProtection
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part E: Tech Support
-- =============================================================================

SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY TechSupport
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part F: Streaming TV
-- =============================================================================

SELECT
    StreamingTV,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY StreamingTV
ORDER BY Churn_Rate DESC;

-- =============================================================================
-- Part G: Streaming Movies
-- =============================================================================

SELECT
    StreamingMovies,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS Churn_Rate
FROM telecom_customer_churn
GROUP BY StreamingMovies
ORDER BY Churn_Rate DESC;

/*-----------------------------------------------------------------------------------
 Section 4 – Revenue Analysis
 -- =============================================================================
 -- Part A: Overall Revenue
 -- Query 1: Total Revenue
 -- =============================================================================
------------------------------------------------------------------------------------*/

SELECT
    ROUND(SUM(TotalCharges),2) AS Total_Revenue
FROM telecom_customer_churn;

-- =============================================================================
-- Query 2: Average Monthly Charge
-- =============================================================================

SELECT
    ROUND(AVG(MonthlyCharges),2) AS Average_Monthly_Charge
FROM telecom_customer_churn;

-- =============================================================================
-- Query 3: Average Total Customer Value
-- =============================================================================

SELECT
    ROUND(AVG(TotalCharges),2) AS Average_Total_Customer_Value
FROM telecom_customer_churn;

-- =============================================================================
-- Part B: Revenue by Contract Type
-- =============================================================================

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges),2) AS Total_Revenue,
    ROUND(AVG(TotalCharges),2) AS Average_Revenue_Per_Customer
FROM telecom_customer_churn
GROUP BY Contract
ORDER BY Total_Revenue DESC;

-- =============================================================================
-- Part C: Revenue by Internet Service
-- =============================================================================

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges),2) AS Total_Revenue,
    ROUND(AVG(TotalCharges),2) AS Average_Revenue
FROM telecom_customer_churn
GROUP BY InternetService
ORDER BY Total_Revenue DESC;

-- =============================================================================
-- Part D: Revenue by Churn Status
-- =============================================================================

SELECT
    Churn,
    COUNT(*) AS Customers,
    ROUND(SUM(TotalCharges),2) AS Total_Revenue,
    ROUND(AVG(TotalCharges),2) AS Average_Revenue
FROM telecom_customer_churn
GROUP BY Churn;

-- =============================================================================
-- Part E: Monthly Charges by Churn Status
-- =============================================================================

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS Average_Monthly_Charge
FROM telecom_customer_churn
GROUP BY Churn;

-- =============================================================================
-- Part F: Top Revenue-Generating Payment Methods
-- =============================================================================

SELECT
    PaymentMethod,
    COUNT(*) AS Customers,
    ROUND(SUM(TotalCharges),2) AS Total_Revenue,
    ROUND(AVG(TotalCharges),2) AS Average_Revenue
FROM telecom_customer_churn
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;

-- =============================================================================
-- Advanced SQL with Window Functions (Revenue by Contract Type Ranking)
-- =============================================================================

SELECT
    Contract,
    ROUND(SUM(TotalCharges),2) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(TotalCharges) DESC
    ) AS Revenue_Rank
FROM telecom_customer_churn
GROUP BY Contract;
