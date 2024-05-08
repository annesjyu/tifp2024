-- cross-tab table
DROP TABLE if EXISTS ProductSales;

CREATE TABLE ProductSales (
    Product VARCHAR(50),
    Region ENUM('North', 'South', 'East', 'West'),
    Amount DECIMAL(10,2)
);

INSERT INTO ProductSales (Product, Region, Amount) VALUES 
('Apple', 'North', 100),
('Apple', 'South', 50),
('Apple', 'East', 75),
('Apple', 'West', 630),
('Peach', 'North', 21),
('Peach', 'South', 19),
('Peach', 'East', 37),
('Peach', 'West', 66),
('Grape', 'North', 11),
('Grape', 'South', 78),
('Grape', 'East', 12),
('Grape', 'East', 63);

SELECT * FROM ProductSales;
