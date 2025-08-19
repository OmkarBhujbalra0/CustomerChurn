create database telco_customer_db;
use telco_customer_db;

create table Telco_Churn_Table (
customerID varchar(50) primary key,
gender varchar(50),
SeniorCitizen int,
Partner varchar(50),
Dependents varchar(50),
tenure int,
PhoneService varchar(50),
MultipleLines varchar(50),
InternetService varchar(50),
OnlineSecurity varchar(50),
OnlineBackup varchar(50),
DeviceProtection varchar(50),
TechSupport varchar(50),
StreamingTV varchar(50),
StreamingMovies varchar(50),
Contract varchar(50),
PaperlessBilling varchar(50),
PaymentMethod varchar(50),
MonthlyCharges decimal(10,2),
TotalCharges decimal(10,2),
Churn varchar(50),
ChargesBin varchar(50),
ChurnNum int,
TenureBins varchar(50),
RiskLevel varchar(50));

select * from Telco_Churn_Table;

select COUNT(*) as Total_Rows from Telco_Churn_Table;

describe Telco_Churn_Table;

select * from Telco_Churn_Table where RiskLevel = 'High';

-- To check unique values
select count(distinct customerID) from Telco_Churn_Table;

-- To check any null values
select count(*) as total_Rows,
sum(case when tenure is null then 1 else 0 end) as null_Tenure_Values,
sum(case when TotalCharges is null or TotalCharges = '' then 1 else 0 end) as null_TotalC_Values
from Telco_Churn_Table;

-- to check duplicates 

select customerID,count(*) as duplicate_values
from Telco_Churn_Table
group by customerID
having count(*) > 1;

-- To Check how many Customers churned
Select Churn,count(*)
from Telco_Churn_Table
group by Churn;

-- Find the percentage of Churned Customers
select round(100 * sum(case when Churn='Yes' then 1 else 0 end) / count(*),2) as Churn_Rate
from Telco_Churn_Table;

-- To check which tenure group is most likely to be churned
select tenureBins,sum(case when Churn='Yes' then 1 else 0 end) as Churned_Customers,
round(sum(case when Churn='Yes' then 1 else 0 end)/count(*),2)*100 as Churn_Rate
from Telco_Churn_Table
group by tenureBins
order by tenureBins; 