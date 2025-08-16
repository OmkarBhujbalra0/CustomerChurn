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

select * from Telco_Churn_Table where RiskLevel = 'High';


