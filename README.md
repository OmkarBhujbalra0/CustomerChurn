# CustomerChurn

This project aims to analyze and identify the factors that affect Customer Churn Rate and methods through which it can be reduced.

## Tech Stack
- Python
- Pandas
- Matplotlib
- MySQL

## Tools
- Google Colab
- MySQL WorkBench

## Data Cleaning

- Data is loaded and its data types are known.
- Dataset is Checked to find null values.
** Total Charges - have Object as a datatype due to which null values were masked as string values.
- Values in TotalCharges Column were converted to numeric values and null values were replaced by column's median value.

## Feature Engineering

- Values under Tenure and Monthly Charges columns were converted into continuous values for better plotting and added to the dataset.
- RiskLevel is new column added for labelling rows according to their combination of column values.
- A new Dataframe was created from original dataset by grouping customers based on similar column values.
- Values under Churn Column were mapped into 0 and 1 for easier analysis.
- 

## Data Analysis

- Countplots were plotted for combination of each 2 to 3 columns to check the groups with highest churn rate.
- Barplots were plotted based on different combination of columns.

# Results and Observations

- Customers using Fiber Optics Service under Month-to-Month Contract paying through Mailed Check in tenure ranging 0-24 are at highest Churn Risk.
- Customers using No Internet Service under Two Year Contract paying through Credit Card are at lowest Churn Risk.
