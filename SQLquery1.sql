-- view the table
select 
* from amazon_sales

  --1.Which product characteristics are most strongly associated with high customer engagement and satisfaction, and how do these characteristics differ between high-performing and low-performing products?
WITH ranked_products AS (
    SELECT
        product_id,
        product_name,
        rating,
        rating_count,
        actual_price,
        discounted_price,
        discount_percentage,
        ROW_NUMBER() OVER (
            ORDER BY rating DESC, rating_count DESC
        ) AS high_rank,
        ROW_NUMBER() OVER (
            ORDER BY rating ASC, rating_count ASC
        ) AS low_rank
    FROM amazon_sales
    WHERE rating_count >= 100
)
SELECT
    product_id,
    product_name,
    rating,
    rating_count,
    actual_price,
    discounted_price,
    discount_percentage,
    'High-performing' AS product_group,
    high_rank AS ranking
FROM ranked_products
WHERE high_rank <= 5

UNION ALL

SELECT
    product_id,
    product_name,
    rating,
    rating_count,
    actual_price,
    discounted_price,
    discount_percentage,
    'Low-performing' AS product_group,
    low_rank AS ranking
FROM ranked_products
WHERE low_rank <= 5

ORDER BY product_group, ranking;


--2.Which product categories have the strongest customer demand, and what characteristics explain their performance compared with low-performing categories?

WITH rank_categories AS (
    SELECT
        category,
        rating_count,
        rating,
        ROW_NUMBER() OVER (
            ORDER BY rating_count DESC, rating DESC
        ) AS high_rank,
        ROW_NUMBER() OVER (
            ORDER BY rating_count ASC, rating ASC
        ) AS low_rank
    FROM amazon_sales
    WHERE rating_count >= 100
)

SELECT
    category,
    rating_count,
    rating,
    high_rank AS ranking
FROM rank_categories
WHERE high_rank <= 5

UNION ALL

SELECT
    category,
    rating_count,
    rating,
    low_rank AS ranking
FROM rank_categories
WHERE low_rank <= 5

ORDER BY rating_count desc, ranking desc

--3.Does a higher discount correspond to higher customer demand, and which discount range is associated with the strongest demand?
with Discount_rank as (select
   product_name,
   category,
   discount_percentage,
   rating_count,
   row_number() over(
   order by discount_percentage desc,rating_count desc ) as high_performing,
   row_number() over(
   order by discount_percentage asc, rating_count asc) as low_performing
from amazon_sales
where rating_count >= 100
)

select
   product_name,
   category,
   discount_percentage,
   rating_count
from Discount_rank
where high_performing <= 5

union all

select
   product_name,
   category,
   discount_percentage,
   rating_count
from Discount_rank
where low_performing <= 5
order by rating_count desc

--4.Among the top 5 categories by customer demand, which categories have the largest gap between market share and product performance, indicating potential growth opportunities?
select 
   product_name,
   category,
   rating,
   rating_count
from amazon_sales
order by rating_count desc
limit 5;

5.Which product/category segments combine strong customer satisfaction with low market share, representing the best opportunities for increasing sales?
with performance as (
select
   product_name,
   category,
   rating_count,
   rating,
   row_number() over(
   order by rating desc)as high_rank,
   row_number() over(
   order by rating asc) as low_rank
from amazon_sales
)

select
   product_name,
   category,
   rating_count,
   rating
from performance
where high_rank <= 5

union all

select
   product_name,
   category,
   rating_count,
   rating
from performance
where low_rank <= 5
order by rating desc
