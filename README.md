# CustomerChurn

This project aims to analyze and identify the factors that affect Customer Churn Rate and methods through which it can be reduced.

## Tech Stack
- Python
- Pandas

## Data Cleaning

- Data is loaded and its data types are known
- Dataset is Checked to find null values
### Total Charges - have Object as a datatype due to which null values were masked as string values
- Values in TotalCharges Column were converted to numeric values and null values were replaced by column's median value.
