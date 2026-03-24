-- 1. Tabel Calendar
CREATE TABLE aw_calendar (
date DATE
);

-- 2. Tabel Territories
CREATE TABLE aw_territories (
sales_territory_key INT PRIMARY KEY,
region VARCHAR(50),
country VARCHAR(50),
continent VARCHAR(50)
);

-- 3. Tabel Customers
CREATE TABLE aw_customers(
customer_key INT PRIMARY KEY,
prefix VARCHAR(5),
first_name VARCHAR(100),
last_name VARCHAR(100),
birth_date DATE,
marital_status VARCHAR(2),
gender VARCHAR(2),
email_address TEXT UNIQUE,
annual_income NUMERIC,
totalchildren INT,
education_level VARCHAR(50),
occupation VARCHAR(50),
home_owner VARCHAR(2)
);

-- 4. Tabel Product Categories
CREATE TABLE aw_product_categories(
product_category_key INT PRIMARY KEY,
category_name VARCHAR(255)
);

-- 5. Tabel Product Subcategories
CREATE TABLE aw_product_subcategories(
product_subcategory_key INT PRIMARY KEY,
subcategory_name VARCHAR(255),
product_category_key INT
);

-- 6. Tabel Products
CREATE TABLE aw_products(
product_key INT PRIMARY KEY,
product_subcategory_key INT,
product_sku VARCHAR(50),
product_name VARCHAR(255),
model_name VARCHAR(255),
product_description TEXT,
product_color VARCHAR(50),
product_size VARCHAR(4),
product_style VARCHAR(2),
productcost NUMERIC,
product_price NUMERIC
);
-- 7. Tabel Returns
CREATE TABLE aw_returns(
return_date DATE,
territory_key INT,
product_key INT,
return_quantity INT
);
-- 8. Tabel Sales (Kita buat 3 tabel terpisah dulu sesuai CSV-nya)
CREATE TABLE aw_sales_2015(
order_date DATE,
stock_date DATE,
order_number VARCHAR(255),
product_key INT,
customer_key INT,
territory_key INT,
order_line_item INT,
order_quantity INT
);

CREATE TABLE aw_sales_2016(
order_date DATE,
stock_date DATE,
order_number VARCHAR(255),
product_key INT,
customer_key INT,
territory_key INT,
order_line_item INT,
order_quantity INT
);

CREATE TABLE aw_sales_2017(
order_date DATE,
stock_date DATE,
order_number VARCHAR(255),
product_key INT,
customer_key INT,
territory_key INT,
order_line_item INT,
order_quantity INT
);