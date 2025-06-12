## Data Wrangling

use Netflix;
select * from amazon;
SELECT TIME from amazon;

# describe amazon
describe amazon;

# Checking Null Values

select * from amazon where null;

## Renaming Columns

Create TABLE amazon_sales
(invoice_id VARCHAR(30) PRIMARY KEY NOT NULL,
 branch VARCHAR(5) NOT NULL,
 city VARCHAR(30) not NULL,
 customer_type VARCHAR(30) NOT NULL,
 gender VARCHAR(30) NOT NULL,
 product_line VARCHAR(100) NOT NULL,
 unity_price DECIMAL(10,2) NOT NULL,
 quantity int NOT NULL,
 vat FLOAT NOT NULL,
 total DECIMAL(10,2) NOT NULL,
 date DATE NOT NULL,
 time TIME NOT NULL,
 payment_method VARCHAR(30) NOT NULL,
 cogs DECIMAL(10,2) NOT NULL,
 gross_margin_percentage FLOAT NOT NULL,
 gross_income DECIMAL(10,2) NOT NULL,
 rating FLOAT NOT NULL);
 
 
 insert into amazon_sales
 (SELECT * FROM amazon);
 
 
 
