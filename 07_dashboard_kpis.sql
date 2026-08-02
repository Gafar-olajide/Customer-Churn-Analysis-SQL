/* -------------------------------------------------------------------------------
This file contains only the KPI queries used in the Power_BI DAX.
-- =============================================================================
-- 👥 Total Customers
-- =============================================================================
Total Customers = COUNTROWS(telecom_customer_churn)

-- =============================================================================
-- ✅ Active Customers
-- =============================================================================
Active Customers =
CALCULATE(
    COUNTROWS(telecom_customer_churn),
    telecom_customer_churn[Churn] = "No"
)

-- =============================================================================
-- ❌ Churned Customers
-- =============================================================================
Churned Customers =
CALCULATE(
    COUNTROWS(telecom_customer_churn),
    telecom_customer_churn[Churn] = "Yes"
)

-- =============================================================================
-- 📉 Churn Rate
-- =============================================================================
Churn Rate =
DIVIDE(
    [Churned Customers],
    [Total Customers]
)
________________________________________________________________________________
Churn Rate =
DIVIDE(
    CALCULATE(
        COUNTROWS(telecom_customer_churn),
        telecom_customer_churn[Churn] = "Yes"
    ),
    COUNTROWS(telecom_customer_churn),
    0
)
-- =============================================================================
-- 💰 Total Revenue
-- =============================================================================
Total Revenue =
SUM(telecom_customer_churn[TotalCharges])

-- =============================================================================
-- 💵 Avg Monthly Charge
-- =============================================================================
Average Monthly Charge =
AVERAGE(telecom_customer_churn[MonthlyCharges])

-- =============================================================================
-- 📈 Customer Lifetime Value / Average Customer Value
-- =============================================================================
Average Customer Value =
AVERAGE(telecom_customer_churn[TotalCharges])

-- =============================================================================
-- Tenure Group
-- =============================================================================
Tenure Group =
SWITCH(
    TRUE(),
    telecom_customer_churn[tenure] <= 12, "0–12 Months",
    telecom_customer_churn[tenure] <= 24, "13–24 Months",
    telecom_customer_churn[tenure] <= 48, "25–48 Months",
    "49–72 Months"
)

-- =============================================================================
-- Tenure Group Sort
-- =============================================================================
Tenure Group Sort =
SWITCH(
    telecom_customer_churn[Tenure Group],
    "0–12 Months", 1,
    "13–24 Months", 2,
    "25–48 Months", 3,
    "49–72 Months", 4
)

-- =============================================================================
-- Customer Group for Senior Citizen
-- =============================================================================
Customer Group =
IF(
    telecom_customer_churn[SeniorCitizen] = 1,
    "Senior Citizen",
    "Non-Senior Citizen"
)
---------------------------------------------------------------------------------*/
