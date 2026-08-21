CREATE VIEW facts_insurance AS
SELECT policy_number,

---KPI 1: Total Claim Cost
total_claim_amount AS total_claim_cost,


---KPI 2: Fraud Rate
CASE 
WHEN fraud_reported_cleaned = 'Yes' THEN 1
WHEN fraud_reported_cleaned = 'No' THEN 0
ELSE 0
END AS fraud_rate, 


---KPI 3: Total Fraud Cost
CASE 
WHEN fraud_reported_cleaned = 'Yes' THEN total_claim_amount
ELSE 0
END AS total_fraud_cost,


---KPI 4:Major Severity Claim Cost
CASE 
WHEN incident_severity_cleaned = 'Major Damage' THEN total_claim_amount
ELSE NULL 
END AS major_severity_claim_cost,


---KPI 5: Total Claim Count
CASE 
WHEN total_claim_amount IS NOT NULL THEN 1 
ELSE 0 
END AS total_claim_count
FROM cleaned_insurance_claims







