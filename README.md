# Amazon Sales End-to-End Data Analytics Project

## Objective
- To analyze Amazon product performance, customer demand, pricing, discounts, and customer ratings to identify business opportunities and develop data-driven strategies to improve product performance and sales.
## Table of content
- Data used
- [Tools](#Tools)
- Step 1 [Cleaning the data and transformation](https://github.com/putthipat05/amazon-sales/blob/main/amazon_sales.ipynb)
- Step 2 Analyze the data by [SQL](https://github.com/putthipat05/amazon-sales/blob/main/SQLquery1.sql)
- Step 3 Dashboard
- Step 4 [Business solution and improvement](https://github.com/putthipat05/amazon-sales/blob/main/analyze.md)
## Data used
In this project I used the amazon sales data from Kaggle about how each product have been sold lately.
More info for the dataset
- Website(https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset)
- CSV(https://github.com/putthipat05/amazon-sales/blob/main/amazon.csv)
## Tools
- Data sales from kaggle
- Python for clean the data
- SQL for find the inisght
- PowerBI for vitualization
## Data Architecture 
<img width="2000" height="1414" alt="Gray White Abstract Page Border A4 (Horizontal)" src="https://github.com/user-attachments/assets/2177ca07-f226-4512-b512-42f4a7782ba8" />

## Dashboard
<img width="1323" height="738" alt="Screenshot 2026-10-11 143206" src="https://github.com/user-attachments/assets/55960bf3-9f49-474c-b9d1-a20e53692ca4" />

An interactive Power BI dashboard analyzing Amazon product data to understand how product category, discounting, and customer ratings relate to each other.

Dashboard Overview

1. Rating Volume & Discount by Category
Compares total rating count and total discount percentage across main product categories. Electronics leads by a wide margin (14.2M), followed by Computers & Accessories (6.3M) and Home & Kitchen (3.0M). The remaining categories contribute very little.

2. Product Count & Average Rating by Discount Range
Shows how many products fall into each discount bracket (0–20% to 81–100%) alongside their average rating. Most products sit in the 41–60% range, while average ratings stay fairly stable at around 4.0–4.15 across brackets. Products with 81–100% discounts have the lowest average rating.

3. Rating Distribution
A histogram of product ratings (1 decimal place). Ratings cluster between 3.8 and 4.4 and peak around 4.1–4.3, so customer satisfaction is generally high, with very few products rated below 3.5.

Key Insights
- Electronics dominates customer engagement (by rating count).
- Heavy discounts (81–100%) do not guarantee better ratings and are linked to the lowest average rating.
- The rating distribution is left-skewed, with most products rated 4.0 or higher.


## Business problem

- 1.Which product characteristics are most strongly associated with high customer engagement and satisfaction, and how do these characteristics differ between high-performing and low-performing products?
- 2.Which product categories have the strongest customer demand, and what characteristics explain their performance compared with low-performing categories?
- 3.Does a higher discount correspond to higher customer demand, and which discount range is associated with the strongest demand?
- 4.Among the top 5 categories by customer demand, which categories have the largest gap between market share and product performance, indicating potential growth opportunities?
- 5.Which product/category segments combine strong customer satisfaction with low market share, representing the best opportunities for increasing sales?
