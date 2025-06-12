 SELECT * FROM amazon_sales;
  
# 1. What is the count of distinct cities in the dataset?
select count(DISTINCT(city)) as unique_city from amazon_sales; 

# 2. For each branch, what is the corresponding city?
SELECT DISTINCT(city),branch from amazon_sales;

# 3. What is the count of distinct product lines in the dataset?
select product_line, COUNT(DISTINCT(product_line)) from amazon_sales
GROUP BY product_line;

# 4. Which payment method occurs most frequently?
SELECT payment_method, COUNT(payment_method) as count from amazon_sales
GROUP BY payment_method
order by count DESC;

# 5. Which product line has the highest sales?
SELECT product_line, SUM(quantity)AS total_sales FROM amazon_sales
GROUP BY product_line
ORDER BY total_sales DESC; 

#6. How much revenue is generated each month?

SELECT month_name, SUM(total) as total_revenue from amazon_sales
group by month_name;

# 7. In which month did the cost of goods sold reach its peak?

SELECT month_name, SUM(cogs) as total_cogs FROM amazon_sales
GROUP BY month_name
ORDER BY total_cogs;

# 8. Which product line generated the highest revenue?

SELECT product_line, SUM(total) as total_revenue from amazon_sales
GROUP BY product_line
ORDER BY total_revenue DESC
limit 2;

# 9. In which city was the highest revenue recorded?

SELECT city, SUM(total) as total_revenue from amazon_sales
GROUP BY city
ORDER BY total_revenue;

# 10. Which product line incurred the highest Value Added Tax?
SELECT product_line, max(vat) AS Highest_Value_Added_Tax  from amazon_sales
GROUP BY product_line
ORDER BY Highest_Value_Added_Tax DESC;

#12. Identify the branch that exceeded the average number of products sold.
SELECT branch, SUM(quantity) as product_sold FROM amazon_sales
GROUP BY branch
having product_sold >(SELECT SUM(quantity)/COUNT( DISTINCT branch) as avg_quantity from amazon_sales);

#14. Calculate the average rating for each product line.


SELECT product_line,round(AVG(rating),2)AS avg_rating from amazon_sales
GROUP BY product_line;

#16. Identify the customer type contributing the highest revenue.

SELECT customer_type, SUM(total) as highest_revenue FROM amazon_sales
GROUP BY customer_type 
ORDER BY highest_revenue DESC;

#17. Determine the city with the highest VAT percentage.

SELECT city, max(vat)as VAT_percentage FROM amazon_sales
GROUP BY city
ORDER BY VAT_percentage DESC;

#27. Identify the day of the week with the highest average ratings.
SELECT * from amazon_sales;
SELECT day_name, round(avg(rating),2) as avg_rating FROM amazon_sales
GROUP BY day_name
ORDER BY avg_rating DESC;

#28. Determine the day of the week with the highest average ratings for each branch.
with avg_rating as
(select branch, day_name, avg(rating) avg_rat from amazon_sales
group by branch, day_name),

max_rating as 
(select max(avg_rat) from avg_rating group by branch)

select branch, day_name, avg_rat as highest_avg_rat from avg_rating where avg_rat in (select * from max_rating);
 
 ## For each product line, add column indicating 'Good' if the average sales are above average else it is 'bad'
 
 SELECT product_line, SUM(total) AS revenue,
 case
	when sum(total) > (SELECT SUM(total)/count(DISTINCT (product_line)) FROM amazon_sales) then 'Good'
    ELSE 'Bad'
END performance
from amazon_sales
GROUP BY product_line;