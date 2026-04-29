/* Breakdown of what products are commonly purchased together and any products that are rarely purchased together */

with prod_sales as 
(
select ordernumber, t1.productcode, productline
from orderdetails t1
inner join products t2
on t1.productcode = t2.productcode
)

select distinct t1.ordernumber , t1.productline as product_one , t2.productline as product_two
from prod_sales t1
left join prod_sales t2
on t1.ordernumber = t2.ordernumber and t1.productline <> t2.productline
