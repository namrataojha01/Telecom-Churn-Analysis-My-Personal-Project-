#  Telecom Customer Churn Analysis
### End-to-End Data Analytics Project | Python • MySQL • Power BI

End-to-End Data Analytics Project analyzing 7,043 telecom customers to identify $3.68M revenue loss, churn drivers, and high-risk segments using Python, MySQL & Power BI.

![image alt](https://github.com/namrataojha01/Telecom-Churn-Analysis-My-Personal-Project-/blob/main/Screenshot%202026-09-11%20064312.png?raw=true)

---

## Project Overview

This project analyzes **7,043 telecom customers** from California to find out:
- Why customers are leaving (churning)?
- How much revenue is being lost?
- Which customers are at highest risk?

>  **Key Finding:** 26.5% customers churned — costing **$3.68M in lost revenue**

---

## Tools Used

| Tool | What I used it for |
|------|-------------------|
| Python | Data Cleaning & Exploratory Analysis |
| MySQL | Data Storage & Business Queries |
| Power BI | Interactive Dashboard |
| Pandas | Data Manipulation |
| Seaborn & Plotly | Data Visualization |

---

##  Project Structure

```
Telecom_Churn_Project/
│
├── data/                          → Raw CSV files
├── notebooks/                     → Jupyter Notebook (EDA)
├── sql/                           → 20 SQL Queries
├── dashboard/                     → Power BI (.pbix) file
├── images/                        → Dashboard Screenshots
└── README.md
```

---

##  Dataset

| Table | Rows | Columns |
|-------|------|---------|
| telecom_customer_churn | 7,043 | 38 |
| telecom_zipcode_population | 1,671 | 2 |

**Source:** [Maven Analytics](https://www.mavenanalytics.io)

---

##  Step 1 — Python (Jupyter Notebook)

### What I did:
- Handled 15 columns with missing values
- Removed duplicates & fixed anomalies
- Created 7 new features for better analysis
- Performed EDA — Demographics, Services & Revenue

### New Features Created:
| Feature | Description |
|---------|-------------|
| Age Group | 6 age buckets (18-25 to 65+) |
| Tenure Group | 6 tenure buckets (0-1 Year to 5-6 Years) |
| Revenue per Month | Total Revenue / Tenure |
| Is Churned | Binary flag (1=Churned, 0=Others) |
| Number of Services | Count of active add-on services |

---

## Step 2 — MySQL (20 Business Queries)

### 3 Levels of Queries:

** Basic (Q1-Q5)**
- Overall churn rate
- Customer status breakdown
- Top cities by customer count
- Gender wise analysis
- Contract type distribution

** Intermediate (Q6-Q13)**
- Churn by age group
- Top 10 churn reasons
- Revenue by customer status
- Offer & internet type analysis

**Advanced (Q14-Q20)**
- Revenue lost by city (JOIN query)
- High risk customer identification
- Customer Lifetime Value (CLV)
- Window functions & running totals

### Sample Query:
```sql
-- Overall Churn Rate
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(Is_Churned) AS Churned_Customers,
    ROUND(SUM(Is_Churned) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct
FROM customer_churn;
```

---

##  Step 3 — Power BI Dashboard (3 Pages)

### Page 1 — Executive Summary
![image alt](https://github.com/namrataojha01/Telecom-Churn-Analysis-My-Personal-Project-/blob/main/Screenshot%202026-09-11%20064312.png?raw=true)

**Visuals:**
- KPI Cards — Total Customers, Churn Rate, Revenue Lost
- Customer Status Donut Chart
- Churn Rate by Contract Type
- Churn Trend by Tenure
- Churn by Offer Type
- Churn by Internet Type (Treemap)

---

### Page 2 — Customer Deep Dive
![image alt](https://github.com/namrataojha01/Telecom-Churn-Analysis-My-Personal-Project-/blob/main/Screenshot%202026-09-11%20175409.png?raw=true)

**Visuals:**
- Churn by Age Group (Funnel Chart)
- Customer Status by Gender
- Services Impact on Churn (Ribbon Chart)
- Churn Trend by Tenure Group (Area Chart)
- Churn by Marital Status & Dependents

---

### Page 3 — Churn Risk & Revenue Intelligence
![image alt](https://github.com/namrataojha01/Telecom-Churn-Analysis-My-Personal-Project-/blob/main/Screenshot%202026-09-11%20180118.png?raw=true)

**Visuals:**
- Revenue Breakdown (Waterfall Chart)
- Top 10 Cities Revenue Lost (Bar Chart)
- Geographic Revenue Loss (Map)
- High Risk Customer Matrix
- Revenue vs Churn Rate by Tenure

---

##  Key Insights

| # | Insight |
|---|---------|
|  | 26.5% Churn Rate — 1,869 out of 7,043 customers churned |
|  | $3.68M Revenue Lost — Churned customers paid highest avg $73/month |
|  | Month-to-Month = 46% Churn — 15x higher than Two Year contracts |
|  | Fiber Optic Highest Churn — Premium users leaving despite high charges |
|  | First 12 Months Critical — New customers most vulnerable to churn |
|  | No Offer = Highest Churn — Targeted offers reduce churn significantly |

---

##  Business Recommendations

| Priority | Recommendation |
|----------|---------------|
|  High | Convert Month-to-Month → Annual contracts with discounts |
|   High | Launch onboarding program for new customers (0-12 months) |
|  Medium | Review Fiber Optic pricing strategy |
|  Medium | Targeted retention offers for no-offer customers |

##  How to Run This Project

### 1. Clone Repository
```bash
git clone https://github.com/namrataojha01/Telecom-Churn-Analysis-My-Personal-Project-
```

##  Connect With Me

[![LinkedIn](https://www.linkedin.com/in/namrata-ojha-743b50170/)
[![GitHub](https://github.com/namrataojha01)

---

**If you found this helpful, please give it a star!** 


---

##  Future Work

| # | Plan | Description |
|---|------|-------------|
| 1 |  Machine Learning | Build churn prediction model using Random Forest & XGBoost |
| 2 |   Advanced Dashboard | Add drill-through pages & tooltip reports in Power BI |
| 3 |  Real-time Data | Connect live data pipeline using Azure or AWS |
| 4 |  Automated Alerts | Email alerts for high-risk customers using Python |
| 5 |  Mobile Dashboard | Optimize Power BI dashboard for mobile view |

---

##  Author

**Your Name**
Data Analyst | Python • SQL • Power BI

-  Background in Data Analytics
-  Passionate about turning raw data into business insights
-  Location — India-Bengaluru

---

##  Contact

| Platform | Link |
|----------|------|
|  LinkedIn | [https://www.linkedin.com/in/namrata-ojha-743b50170/) |
|   GitHub | [https://github.com/namrataojha01) |
|  Email | namraaj.raaj@gmail.com|

---

> *"Data is not just numbers — it tells a story. 
> This project is my attempt to listen to that story 
> and turn it into actionable insights."* 

---

 **If you found this project helpful, please give it a star!** 




