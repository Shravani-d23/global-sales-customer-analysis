-- Purpose: Generate sales overview for 2004 with product, location, and pricing details

SELECT 
    t1.orderDate,          -- Order date
    t1.orderNumber,        -- Unique order ID
    t2.quantityOrdered,    -- Quantity sold
    t2.priceEach,          -- Selling price per unit
    t3.productName,        -- Product name
    t3.productLine,        -- Product category
    t3.buyPrice,           -- Cost per unit
    t4.city,               -- Customer city
    t4.country             -- Customer country

FROM orders t1

-- Join order details to get quantity and price
INNER JOIN orderdetails t2
    ON t1.orderNumber = t2.orderNumber

-- Join products to get product details and cost
INNER JOIN products t3
    ON t2.productCode = t3.productCode

-- Join customers to get location details
INNER JOIN customers t4
    ON t1.customerNumber = t4.customerNumber

-- Filter for year 2004
WHERE YEAR(t1.orderDate) = 2004;

