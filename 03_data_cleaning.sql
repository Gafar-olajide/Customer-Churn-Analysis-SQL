/*-------------------------------------------------------------------------------
 Data Cleaning & Verification 
 -------------------------------------------------------------------------------*/
-- =============================================================================
-- Check 1
-- =============================================================================

SELECT customerID,
       TotalCharges
FROM telecom_customer_churn
WHERE TotalCharges REGEXP '[^0-9.]';

-- =============================================================================
-- Check 2
-- =============================================================================

SELECT *
FROM telecom_customer_churn
WHERE CAST(TotalCharges AS DECIMAL(10,2)) < tenure;

-- =============================================================================
-- Check 3
-- =============================================================================

SELECT customerID,
       tenure,
       MonthlyCharges,
       TotalCharges
FROM telecom_customer_churn
WHERE TRIM(TotalCharges) = '';

-- =============================================================================
-- Then Replace the blank values with NULL.
-- =============================================================================

UPDATE telecom_customer_churn
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

-- =============================================================================
--                                     OR
-- =============================================================================

UPDATE telecom_customer_churn
SET TotalCharges = NULL
WHERE customerID IN (
    '1371-DWPAZ',
    '2520-SGTTA',
    '2775-SEFEE',
    '2923-ARZLG',
    '3115-CZMZD',
    '3213-VVOLG',
    '4075-WKNIU',
    '4367-NUYAO',
    '4472-LVYGI',
    '5709-LVOEQ',
    '7644-OMVMY'
);

-- =============================================================================
-- Verify the above query
-- =============================================================================

SELECT COUNT(*) AS null_totalcharges
FROM telecom_customer_churn
WHERE TotalCharges IS NULL;

-- =============================================================================
-- Comfirm if the field contains a space or an empty string (NULL)
-- =============================================================================

SELECT
    customerID,
    LENGTH(TotalCharges) AS length_value,
    CONCAT('[', TotalCharges, ']') AS displayed_value
FROM telecom_customer_churn
WHERE customerID = '1371-DWPAZ';

-- =============================================================================
-- Then clean the column "TotalCharges" by converting it to a numeric data type:
-- =============================================================================

ALTER TABLE telecom_customer_churn
MODIFY COLUMN TotalCharges DECIMAL(10,2);

-- =============================================================================
-- Then verify it:
-- =============================================================================

DESCRIBE telecom_customer_churn;