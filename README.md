# delivery_logistics_data_analysis
# Project Overview

This project analyzes delivery logistics data to evaluate delivery cost, delivery performance, delivery failures, delivery partners, distance, weather conditions, vehicle types, and package types.

The project follows a practical data analysis workflow using Excel and MySQL, starting with data preparation and moving toward business-focused analysis and insights.

# Business Objective

The objective of this project is to understand delivery operations and answer key business questions such as:

* Which delivery partners have higher delivery costs or failure rates?
* Does delivery distance affect delivery cost?
* Does weather impact delivery performance?
* Which delivery modes and vehicle types show different performance patterns?
* Which delivery partners handle the highest number of deliveries?
* Which package types have better delivery performance?

⸻
# Data Preparation & Cleaning

Before performing the analysis, the dataset was reviewed and prepared for analysis.

The data preparation process included:

* Reviewing the dataset structure and available fields
* Checking data types and ensuring fields were suitable for analysis
* Reviewing missing or inconsistent values
* Standardizing categorical values where required
* Checking numerical fields such as distance, package weight, delivery time, expected time, rating, and delivery cost
* Preparing the dataset for Pivot Table analysis in Excel
* Preparing the dataset for querying in MySQL

# The cleaned/prepared data was then used for both Excel and SQL analysis.

⸻

# Tools & Technologies

Tool	Purpose
Excel	Data analysis, Pivot Tables & Charts
MySQL	SQL-based business analysis
⸻
# Excel Analysis

Excel was used to perform exploratory and comparative analysis using Pivot Tables, Scatter Charts, and Column Charts.

1. Delivery Distance vs Delivery Cost

Question: Does delivery distance affect delivery cost?

A Scatter Chart was used to examine the relationship between delivery distance and delivery cost.

2. Average Delivery Cost by Delivery Partner

Question: Which delivery partner has the highest average delivery cost?

A Pivot Table was used to compare average delivery costs across delivery partners.

3. Delivery Failure Rate by Delivery Partner

Question: Which delivery partner has the highest delivery failure rate?

A Pivot Table was used to compare failure rates across delivery partners.

4. Top 5 Delivery Partners by Number of Deliveries

Question: Which are the top five delivery partners by number of deliveries?

A Pivot Table was used to identify the delivery partners handling the highest number of deliveries.

5. Weather vs Delivery Performance

Question: Does weather affect delivery performance?

A Pivot Table and Column Chart were used to compare delivery performance across different weather conditions.

⸻

# SQL Analysis

MySQL was used to perform deeper business-oriented analysis using SQL concepts such as:

* Aggregate functions
* GROUP BY
* HAVING
* CASE
* Subqueries
* Conditional calculations
* Comparison with overall averages/rates
* Ranking and filtering

Business Questions Analysed

1. Which delivery partner has the highest average delivery cost?
2. Which delivery partner has the highest on-time delivery rate?
3. Which delivery mode has the highest average delivery cost?
4. Which delivery partner has the highest delivery failure rate?
5. Does longer delivery distance lead to higher delivery cost?
6. How many deliveries were successful and how many failed?
7. Which are the top five delivery partners by number of deliveries?
8. Which vehicle type has the highest number of delivery failures?
9. Which delivery partners have a failure rate higher than the overall failure rate?
10. Which delivery partners have both a high failure rate and high average delivery cost?
11. Which delivery partners perform above the overall average on-time delivery rate?
12. Which package type has the highest average delivery rate?

The SQL Analysis folder contains screenshots showing the queries and their corresponding outputs.

The complete SQL queries are also provided in:

query of Delivery_Logistics.sql

⸻

# Business Insights

The analysis was designed to identify operational patterns related to:

# Cost

* Variation in average delivery cost across delivery partners
* Relationship between delivery distance and delivery cost
* Differences in cost across delivery modes

# Delivery Partner Performance

* Delivery partners with higher delivery volumes
* Delivery partners with higher failure rates
* Delivery partners performing above the overall on-time delivery benchmark
* Delivery partners showing both higher failure rates and higher average costs

# Operational Conditions

* Relationship between weather conditions and delivery performance
* Delivery failures across different vehicle types

# Package Performance

* Comparison of delivery performance across package types

These findings can support delivery performance monitoring, cost optimization, and operational decision-making.

⸻

# Project Structure

Delivery Logistics Data Analysis
│
├── Excel Analysis
│   └── Excel analysis screenshots
│
├── SQL Analysis
│   └── SQL query + output screenshots
│
├── query of Delivery_Logistics.sql
│   └── Complete SQL queries
│
└── README.md

⸻

# Skills Demonstrated

Data Analysis | Excel | Pivot Tables | Data Visualization | MySQL | SQL | Business Analysis | KPI Analysis | Data Cleaning | GitHub

⸻

# Conclusion

This project demonstrates an end-to-end approach to analyzing logistics data using Excel and SQL, from data preparation and exploratory analysis to business-focused questions and operational insights.
