-- enter database enrollment;
USE enrollment;

-- rank()
SELECT
	takes.ID, 
	takes.grade, 
	RANK() OVER(ORDER BY grade) AS grade_rank
FROM 
	takes
WHERE 
	grade IS NOT NULL;

-- percent
SELECT 
  takes.ID, 
  takes.grade, 
  concat(round(PERCENT_RANK() OVER (ORDER BY grade) * 100, 0), "%") AS grade_percent
FROM 
  takes 
WHERE 
  grade IS NOT NULL;


-- percentile
-- SELECT 
--   takes.ID, 
--   takes.grade, 
--   concat(round(PERCENTILE_RANK() OVER (ORDER BY grade) * 100, 0), "%") AS grade_percent
-- FROM 
--   takes 
-- WHERE 
--   grade IS NOT NULL;
-- 

-- dense_rank
SELECT 
  takes.ID, 
  takes.grade, 
  DENSE_RANK() OVER (ORDER BY grade) AS grade_percent
FROM 
  takes 
WHERE 
  grade IS NOT NULL;


-- Use self join instead of rank()  
SELECT 
    takes.ID,
    takes.grade,
    1 + (
        SELECT
            COUNT(b.ID)
        FROM
            takes b
        WHERE
            b.grade < takes.grade
    ) AS s_rank
FROM
    takes
WHERE grade IS NOT NULL 
ORDER BY s_rank;

-- cumulative percent
SELECT 
  takes.ID, 
  takes.grade, 
  round(cume_Dist() OVER (ORDER BY grade), 2) AS grade_cume
FROM 
  takes 
WHERE 
  grade IS NOT NULL;
  

-- NTILE
SELECT 
    takes.id, 
    takes.grade, 
    NTILE(3) OVER (ORDER BY grade ASC) AS gpa_rank
FROM
    takes
WHERE grade IS NOT NULL 
ORDER BY 
    gpa_rank

-- partitioning and ntile()
-- rank quarterly total_Amount for each type in the transaction table.
USE bank;
WITH quarterly_trans AS (
	SELECT `type`, 
		quarter(new_date) AS `quarter`, 
		SUM(amount) as total_amount 
	FROM trans 
	GROUP BY 1, 2 
)
SELECT `type`, `quarter`, total_amount,
NTILE(4) OVER(
	PARTITION BY `type`
	order BY total_amount DESC) AS quarterly_trans
FROM quarterly_trans;


