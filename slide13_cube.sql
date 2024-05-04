SELECT * FROM trans LIMIT 2;

ALTER TABLE
    trans
ADD
    new_date DATE AFTER `date`;
    
SELECT STR_TO_DATE(CAST(`date` AS CHAR), '%y%m%d') AS formatted_date FROM trans LIMIT 2;

UPDATE
    trans
SET
    new_date = STR_TO_DATE(CAST(`date` AS CHAR), '%y%m%d');
    

-- Use GROPU BY CUBE to create the cube
-- This syntax is supported in Google BigQuery

-- SELECT YEAR(new_date) AS `year`, QUARTER(new_date) AS `quarter`, 
-- `type`, operation, SUM(amount) AS total_trans FROM trans
-- GROUP BY CUBE(`year`, `quarter`, `type`, operation);


-- Use GROUP BY GROUPING SETS to create the cube.
-- PostgreSQL (9 and later), SQL Server (2008 and later), Oracle, SQL Anywhere and DB2 support grouping sets

-- SELECT YEAR(new_date) AS `year`, QUARTER(new_date) AS `quarter`, 
-- `type`, operation, SUM(amount) AS total_trans
-- FROM trans
GROUP BY GROUPING SETS (
	(`year`, `quarter`, `type`, operation), 
	(`year`, `quarter`, `type`), 
	(`year`, `quarter`), 
	(`year`), 
	()
);

-- Use GROUP BY and UNION ALL to create the cube

SELECT YEAR(new_date) AS `year`, QUARTER(new_date) AS `quarter`, `type`, operation, round(SUM(amount),1) AS total_trans
FROM trans
GROUP BY `year`, `quarter`, `type`, operation UNION ALL
SELECT YEAR(new_date) AS `year`, QUARTER(new_date) AS `quarter`, `type`, NULL AS operation, round(SUM(amount),1) AS total_trans
FROM trans
GROUP BY `year`, `quarter`, `type` UNION ALL
SELECT YEAR(new_date) AS `year`, QUARTER(new_date) AS `quarter`, NULL AS `type`, NULL AS operation, round(SUM(amount),1) AS total_trans
FROM trans
GROUP BY `year`, `quarter` UNION ALL
SELECT YEAR(new_date) AS `year`, NULL AS `quarter`, NULL AS `type`, NULL AS operation, round(SUM(amount),1) AS total_trans
FROM trans
GROUP BY `year` UNION ALL
SELECT NULL AS `year`, NULL AS `quarter`, NULL AS `type`, NULL AS operation, round(SUM(amount),1) AS total_trans
FROM trans
order BY `year`, `quarter`, `type`, operation
LIMIT 10;


-- Use ROLLUP to create the CUBE

SELECT `cube`.`year`, `cube`.`quarter`, `cube`.`type`, `cube`.`operation`, `cube`.`total_trans`
FROM (
    SELECT 
        YEAR(new_date) AS `year`, 
        QUARTER(new_date) AS `quarter`, 
        `type`, 
        operation, 
        SUM(amount) AS total_trans
    FROM 
        trans 
    GROUP BY 
        `year`, 
        `quarter`, 
        `type`, 
        operation WITH ROLLUP
) AS `cube`
ORDER BY 1, 2, 3, 4
LIMIT 10;

