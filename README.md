# Little Sprout Sales Performance Analysis

## Project Overview

This project analyzes 1,780 FY2025 Retail and E-Commerce transactions for Little Sprout, a fictional retail business.

The analysis was developed in Power BI to evaluate overall sales and profitability, identify performance differences across products, branches, and sales channels, and investigate the drivers behind changes in business performance.

A focused root-cause analysis was also conducted to understand the significant increase in E-Commerce revenue in March.

## Business Questions

This analysis aims to answer the following questions:

- How did overall sales and profitability perform in FY2025?
- Which products, categories, and branches contributed most to business performance?
- How did Retail and E-Commerce channels perform differently?
- What caused the significant increase in E-Commerce revenue in March?
- Was the change in revenue driven by transaction volume, units sold, pricing, or product mix?

## Dashboard Preview

![Little Sprout Sales Performance Dashboard](executive_overview.png)

## Key Insights

- **March recorded the highest monthly net revenue at RM24.2K**, generated from 170 transactions, making it the strongest-performing month in FY2025.

- **Mount Austin was the top-performing branch by net revenue**, generating RM75.5K from 570 transactions with a 49.2% gross margin. However, the **Online channel achieved the highest gross margin at 50.2%** across 455 transactions, indicating stronger profitability relative to sales.

- **CloudSoft Foldable Playmat was the strongest product by gross profit**, contributing RM21.1K.

## March E-Commerce Growth – Root Cause Analysis

March recorded a significant increase in E-Commerce performance, with net revenue rising from **RM2,714.80 in February to RM5,417.40 in March (+99.6%)**.

To understand the drivers behind this growth, I used SQL to investigate transaction volume, units sold, basket size, discount levels, and product mix.

### Key Findings

- **Transactions increased by 60.7%**, from 28 in February to 45 in March.
- **Units sold increased by 115.8%**, from 38 to 82.
- **Average units per transaction increased from 1.36 to 1.82 (+34.2%)**, indicating larger basket sizes.
- Despite the strong revenue growth, **net revenue per unit decreased by 7.5%**, from RM71.44 to RM66.07.
- Average discount increased from **3.93% to 5.56%**.
- March sales shifted toward lower-priced products. **Silicone Bib (RM35), Training Cup (RM39), and Sensory Ball Set (RM55)** contributed 42 units, representing **51.2% of March E-Commerce units sold**.

### Conclusion

The March E-Commerce revenue increase was primarily **volume-driven**. Growth came from both a higher number of transactions and more units purchased per transaction, resulting in units sold more than doubling.

However, revenue per unit declined, coinciding with higher average discounts and a product mix weighted toward lower-priced products. This partially offset the impact of the strong increase in sales volume.

## Tools & Skills

- Power BI
- Power Query
- DAX
- SQL Server (T-SQL)
- Data Cleaning
- Data Analysis
- Root-Cause Analysis
- Data Visualization

## Project Files

- `Sales_Data.pbix` – Interactive Power BI dashboard
- `sql/march_ecommerce_root_cause.sql` – SQL analysis investigating March E-Commerce revenue growth
- `executive_overview.png` – Dashboard preview
