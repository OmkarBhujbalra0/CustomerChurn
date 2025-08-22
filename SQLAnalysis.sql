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

-- To check which Contract has highest churn in tenure 0-24
Select Contract,Avg(ChurnNum)*100 as churnrate 
from Telco_Churn_Table
where tenureBins = '0-24'
group by Contract;

-- To check count for each type of contract under tenure 0-24
select contract,count(*) 
from Telco_churn_Table
where tenureBins = '0-24'
group by Contract;

-- To check the churn type for each type of contract
select contract,churn,count(*)
from telco_churn_table
group by contract,churn;

-- To check the churn rate for each type of contract 
select contract,avg(churnnum)*100
from telco_churn_table
group by contract;

-- To check churnrate for each type of Internet Service 
select InternetService,avg(churnNum)*100 as churnrate
from telco_churn_table
group by InternetService;

-- To check churn rate for each type of payment method
select PaymentMethod,avg(churnnum)*100 as churnrate
from telco_churn_table
group by PaymentMethod;

-- To check churn rate for by combining all the groups with highest churn rate
select InternetService,tenureBins,Contract,PaymentMethod, avg(churnNum)*100,count(*)
from telco_churn_table
where InternetService = 'Fiber optic' 
and tenureBins = '0-24' 
and Contract = 'Month-to-month' 
and PaymentMethod = 'Mailed check'
group by InternetService,tenureBins,Contract,PaymentMethod;

-- Groups having more than 30 customers are considered for actually calling it a trend
select InternetService,tenureBins,Contract,PaymentMethod, avg(churnNum)*100 as churnrate,count(*)
from telco_churn_table
group by InternetService,tenureBins,Contract,PaymentMethod
having count(*) > 30
order by churnrate desc; 

-- Checking Churn Rate on the basis of Age, SeniorCitizens and Dependents
select Gender, SeniorCitizen,Dependents,round(avg(ChurnNum)*100,2) as ChurnRate,count(*) 
from Telco_Churn_Table
group by Gender, SeniorCitizen,Dependents
order by ChurnRate desc; 

create table Riskiest_Group as
select Gender, SeniorCitizen,Dependents,InternetService,tenureBins,Contract,PaymentMethod,avg(ChurnNum)*100 as ChurnRate,count(*) as Count
from Telco_Churn_Table
group by Gender, SeniorCitizen,Dependents,InternetService,tenureBins,Contract,PaymentMethod;

select * from riskiest_group 
where Count > 30
order by ChurnRate desc
limit 10;

select * from riskiest_group 
where Count > 30 and ChurnRate > 0
order by ChurnRate
limit 10;

select avg(ChurnNum)*100 * avg(MonthlyCharges)*100 *count(*) as Loss
from telco_churn_table
group by churnNum,MonthlyCharges;