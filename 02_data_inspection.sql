-- =============================================================================
-- Step 1: Verify the total number of records
-- =============================================================================

SELECT COUNT(*) AS total_customers
FROM telecom_customer_churn;

-- =============================================================================
-- Step 2: Preview the dataset
-- =============================================================================

SELECT *
FROM telecom_customer_churn
LIMIT 10;

-- =============================================================================
-- Step 3: Inspect the table structure
-- =============================================================================

DESCRIBE telecom_customer_churn;

-- =============================================================================
-- Step 4: Check for duplicate Customer IDs
-- =============================================================================

SELECT
    customerID,
    COUNT(*) AS duplicate_count
FROM telecom_customer_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

-- =============================================================================
-- Step 5: Count NULL values
-- =============================================================================

SELECT
    SUM(customerID IS NULL) AS customerID,
    SUM(gender IS NULL) AS gender,
    SUM(SeniorCitizen IS NULL) AS SeniorCitizen,
    SUM(Partner IS NULL) AS Partner,
    SUM(Dependents IS NULL) AS Dependents,
    SUM(tenure IS NULL) AS tenure,
    SUM(MonthlyCharges IS NULL) AS MonthlyCharges,
    SUM(TotalCharges IS NULL) AS TotalCharges,
    SUM(Churn IS NULL) AS Churn
FROM telecom_customer_churn;

-- =============================================================================
-- Step 6: Check for blank values
-- =============================================================================

SELECT COUNT(*) AS blank_totalcharges
FROM telecom_customer_churn
WHERE TotalCharges = '';

-- =============================================================================
-- Step 7: Check distinct values
-- =============================================================================

SELECT DISTINCT gender
FROM telecom_customer_churn;

SELECT DISTINCT Partner
FROM telecom_customer_churn;

SELECT DISTINCT Dependents
FROM telecom_customer_churn;

SELECT DISTINCT Contract
FROM telecom_customer_churn;

SELECT DISTINCT Churn
FROM telecom_customer_churn;

SELECT DISTINCT PaymentMethod
FROM telecom_customer_churn;

-- =============================================================================
-- Step 8: Inspect the numeric columns
-- =============================================================================

SELECT
    MIN(MonthlyCharges) AS minimum,
    MAX(MonthlyCharges) AS maximum,
    ROUND(AVG(MonthlyCharges),2) AS average
FROM telecom_customer_churn;

SELECT
    MIN(tenure) AS minimum,
    MAX(tenure) AS maximum,
    ROUND(AVG(tenure),2) AS average
FROM telecom_customer_churn;