SELECT ROUND(sales, -3) AS BIN, COUNT(*) AS sales
FROM sales_data
GROUP BY 1;

SELECT ROUND(LOG(2, sales), 0) AS BIN, COUNT(*) AS sales
FROM sales_data
GROUP BY 1;

-- select COUNT(*) OVER (PARTITION BY NTILE(4) OVER (ORDER BY sales)) AS frequency
-- FROM sales_data;

SELECT 
  NTILE_group,
  sales,
  COUNT(*) AS frequency
FROM (
  SELECT 
    sales,
    NTILE(4) OVER (ORDER BY sales) AS NTILE_group
  FROM 
    sales_data
) AS subquery
GROUP BY 
  NTILE_group;

