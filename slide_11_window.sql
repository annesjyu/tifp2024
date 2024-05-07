USE bank;

DROP VIEW if exists month_trans;

CREATE VIEW month_trans AS (
	SELECT `type`, DATE_FORMAT(new_date, '%Y-%m')  AS `month`, 
	round(SUM(amount),0) AS total_amount
	FROM trans GROUP BY 1, 2
);

SELECT `type`, `month`, total_amount FROM month_trans;

SELECT `type`, `month`, 
AVG(total_amount) OVER (
	PARTITION BY `type`
	order BY `month` ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) 
AS moving_avg
FROM month_trans;

-- create sales table
DROP DATABASE if EXISTS sales;
CREATE DATABASE sales;
USE sales;

DROP TABLE if exists sales_data;
CREATE TABLE sales_data (
    sales_month DATE,
    naics_code VARCHAR(10),
    kind_of_business VARCHAR(255),
    sales INT
);

DROP PROCEDURE if EXISTS InsertDateData;

DELIMITER $$
CREATE PROCEDURE InsertDateData()
BEGIN
    DECLARE vDate DATE;
    DECLARE vIndex INT;
    DECLARE codes VARCHAR(100) DEFAULT '441,4411,44111,44112,4413,442,4421';
    DECLARE businesses VARCHAR(255) DEFAULT 'Motor vehicle and parts dealers,Automobile dealers,New car dealers,Used car dealers,Automotive parts, accessories, and tire stores,Furniture and home furnishings stores,Furniture stores';
    DECLARE codeList VARCHAR(10);
    DECLARE businessList VARCHAR(1024);

    SET vDate = '1992-01-01';
    SET vIndex = 0;
    
    WHILE vDate <= '1992-01-31' DO
        SET vIndex = FLOOR(1 + (RAND() * 7));
        SET codeList = SUBSTRING_INDEX(SUBSTRING_INDEX(codes, ',', vIndex), ',', -1);
        SET businessList = SUBSTRING_INDEX(SUBSTRING_INDEX(businesses, ',', vIndex), ',', -1);
        
        INSERT INTO sales_data (sales_month, naics_code, kind_of_business, sales)
        VALUES
        (vDate, codeList, businessList, FLOOR(1000 + (RAND() * 29000))); 

        SET vDate = DATE_ADD(vDate, INTERVAL 1 DAY);
    END WHILE;
END$$
DELIMITER ;

CALL InsertDateData();






CREATE PROCEDURE InsertDateData()
BEGIN
    DECLARE vDate DATE;
    SET vDate = '1992-01-01';
    WHILE vDate <= '1992-01-31' DO
        INSERT INTO sales_data (sales_month, naics_code, kind_of_business, sales)
        VALUES
        (vDate, '441', 'Sample Business Type', FLOOR(1000 + (RAND() * 29000)));
        SET vDate = DATE_ADD(vDate, INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;
sales_data
CALL InsertDateData();
