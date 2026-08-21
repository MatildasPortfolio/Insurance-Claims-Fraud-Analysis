CREATE VIEW cleaned_insurance_claims AS
SELECT
months_as_customer,
age,
policy_number,
policy_bind_date,
policy_state,
policy_csl,
policy_deductable,
policy_annual_premium,
insured_zip,
insured_sex,
insured_education_level,
insured_occupation,
insured_hobbies,
insured_relationship,
capital_gains,
capital_loss,
incident_date,
incident_type,
authorities_contacted,
incident_state,
incident_city,
incident_severity,
incident_location,
incident_hour_of_the_day,
number_of_vehicles_involved,
bodily_injuries,
witnesses,
total_claim_amount,
injury_claim,
property_claim,
vehicle_claim,
auto_make,
auto_model,
auto_year,

CASE 
WHEN umbrella_limit = -1000000 THEN 0
ELSE umbrella_limit
END AS umbrella_limit_cleaned,

CASE
WHEN collision_type = '?' THEN 'Unknown'
ELSE collision_type
END AS collision_type_cleaned,

CASE 
WHEN property_damage IS NULL THEN 'Unknown'
WHEN property_damage = 1 THEN 'Yes'
WHEN property_damage = 0 THEN 'No'
ELSE 'Unknown'
END AS property_damage_cleaned,

CASE 
WHEN incident_severity = 'Major Damage' THEN 'Major Damage'
WHEN incident_severity ='Minor Damage' THEN 'Minor Damage'
WHEN incident_severity ='Trivial Damage' THEN 'Minor Damage'
WHEN incident_severity = 'Total loss' THEN 'Major Damage'
ELSE incident_severity
END AS incident_severity_cleaned,

CASE 
WHEN police_report_available IS NULL THEN 'Unknown'
WHEN police_report_available = 1 THEN 'Yes'
WHEN police_report_available = 0 THEN 'No'
ELSE 'Unknown'
END AS police_report_available_cleaned,

CASE 
WHEN fraud_reported IS NULL THEN 'Unknown'
WHEN fraud_reported = 1 THEN 'Yes'
WHEN fraud_reported = 0 THEN 'No'
ELSE 'Unknown'
END AS fraud_reported_cleaned
FROM insurance_claims