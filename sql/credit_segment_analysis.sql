-- Purpose:
-- Analyze sales performance by grouping customers based on credit limits
-- to understand whether higher credit limit customers generate higher sales

WITH sales AS (
    -- Combine order, product, and customer data
    SELECT 
        t1.orderNumber,
        t1.customerNumber,
        t2.productCode,
        t2.quantityOrdered,
        t2.priceEach,
        t2.priceEach * t2.quantityOrdered AS sales_value,   -- Total sales per item
        t3.creditLimit
    FROM orders t1

    -- Join order details to get quantity and price
    INNER JOIN orderdetails t2
        ON t1.orderNumber = t2.orderNumber

    -- Join customers to get credit limit
    INNER JOIN customers t3
        ON t1.customerNumber = t3.customerNumber
)

SELECT 
    orderNumber,
    customerNumber,

    -- Group customers into credit limit segments
    CASE 
        WHEN creditLimit < 75000 THEN 'A: < $75K'
        WHEN creditLimit BETWEEN 75000 AND 100000 THEN 'B: $75K - $100K'
        WHEN creditLimit BETWEEN 100000 AND 150000 THEN 'C: $100K - $150K'
        WHEN creditLimit > 150000 THEN 'D: > $150K'
        ELSE 'Other'
    END AS creditlimit_group,

    SUM(sales_value) AS total_sales   -- Total sales per customer/order

FROM sales

-- Aggregate sales by customer and credit segment
GROUP BY 
    orderNumber, 
    customerNumber, 
    creditlimit_group

-- Insight:
-- Helps identify whether higher credit limit customers contribute more to revenue
