 SELECT * FROM amazon_sales;
 
 DESCRIBE amazon_sales;
 
 ALTER TABLE amazon_sales 
 add column time_of_day varchar(30);
 
 SET SQL_SAFE_UPDATES = 0;
 
UPDATE amazon_sales set time_of_day = 
 case
	when time >= "06:00:00" AND time < "12:00:00" then 'Morning'
    when time >= "12:00:00" AND time < "17:00:00" then 'Afternoon'
    when time >= "17:00:00" AND time < "19:00:00" then 'evening'
    else 'Night'
 end;
 
SET SQL_SAFE_UPDATES = 1;


alter TABLE amazon_sales add COLUMN day_name VARCHAR(10);

UPDATE amazon_sales 
SET day_name = dayname(date);

alter TABLE amazon_sales add column month_name VARCHAR(30);

update amazon_sales 
set month_name = monthname(date);

 SELECT invoice_id,product_line, payment_method,time_of_day, day_name,month_name FROM amazon_sales LIMIT 10;
  
 
