-- Purpose:
-- Identify products (product lines) that are frequently purchased together
-- by pairing items within the same order (market basket analysis)

WITH prod_sales AS (
    -- Extract product lines for each order
    SELECT 
        t1.orderNumber,
        t1.productCode,
        t2.productLine
    FROM orderdetails t1
    INNER JOIN products t2
        ON t1.productCode = t2.productCode
)

SELECT DISTINCT 
    t1.orderNumber,                    -- Order ID
    t1.productLine AS product_one,     -- First product in pair
    t2.productLine AS product_two      -- Second product in pair

FROM prod_sales t1

-- Self join to pair products within the same order
LEFT JOIN prod_sales t2
    ON t1.orderNumber = t2.orderNumber
    AND t1.productLine <> t2.productLine   -- Exclude same product pairing

-- Result:
-- Each row represents a combination of two different product lines
-- purchased within the same order
