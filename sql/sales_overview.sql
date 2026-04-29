/* Overview of sales for 2004. Breakdown by product, country and City. Also include sales value , cost of sales and net profit */


select t1.orderdate ,t1.ordernumber , quantityOrdered , priceEach, productName , productLine , buyPrice ,city , country
from orders t1
inner join orderdetails t2
on t1.ordernumber = t2.ordernumber
inner join products t3
on t2.productcode = t3.productcode
inner join customers t4
on t1.customernumber = t4.customernumber
where year(orderDate) = 2004


