DROP table if exists retail_sales;

CREATE TABLE retail_sales (
    id INT AUTO_INCREMENT,
    sales_month DATE,
    product_code VARCHAR(20),
    business VARCHAR(29),
    sales DECIMAL(10,2),
    PRIMARY KEY (id)
);


INSERT INTO retail_sales (sales_month, product_code, business, sales) VALUES
('2024-01-01', '01', 'women''s clothing stores', 2498.16),
('2024-01-02', '01', 'women''s clothing stores', 4802.86),
('2024-01-03', '01', 'women''s clothing stores', 3927.98),
('2024-01-04', '01', 'women''s clothing stores', 3394.63),
('2024-01-05', '01', 'women''s clothing stores', 1624.07),
('2024-01-07', '01', 'women''s clothing stores', 1623.98),
('2024-01-08', '01', 'women''s clothing stores', 1232.33),
('2024-01-09', '01', 'women''s clothing stores', 4464.7),
('2024-01-10', '01', 'women''s clothing stores', 3404.46),
('2024-01-12', '01', 'women''s clothing stores', 3832.29),
('2024-01-13', '01', 'women''s clothing stores', 1082.34),
('2024-01-14', '01', 'women''s clothing stores', 4879.64),
('2024-01-15', '01', 'women''s clothing stores', 4329.77),
('2024-01-17', '01', 'women''s clothing stores', 1849.36),
('2024-01-18', '01', 'women''s clothing stores', 1727.3),
('2024-01-19', '01', 'women''s clothing stores', 1733.62),
('2024-01-20', '01', 'women''s clothing stores', 2216.97),
('2024-01-22', '01', 'women''s clothing stores', 3099.03),
('2024-01-23', '01', 'women''s clothing stores', 2727.78),
('2024-01-24', '01', 'women''s clothing stores', 2164.92),
('2024-01-25', '01', 'women''s clothing stores', 3447.41),
('2024-01-27', '01', 'women''s clothing stores', 1557.98),
('2024-01-28', '01', 'women''s clothing stores', 2168.58),
('2024-01-29', '01', 'women''s clothing stores', 2465.45),
('2024-01-30', '01', 'women''s clothing stores', 2824.28),
('2024-01-31', '01', 'women''s clothing stores', 4140.7),
('2024-02-02', '01', 'women''s clothing stores', 1798.7),
('2024-02-03', '01', 'women''s clothing stores', 3056.94),
('2024-02-04', '01', 'women''s clothing stores', 3369.66),
('2024-02-05', '01', 'women''s clothing stores', 1185.8),
('2024-02-07', '01', 'women''s clothing stores', 3430.18),
('2024-02-08', '01', 'women''s clothing stores', 1682.1),
('2024-02-09', '01', 'women''s clothing stores', 1260.21),
('2024-02-10', '01', 'women''s clothing stores', 4795.54),
('2024-02-12', '01', 'women''s clothing stores', 4862.53),
('2024-02-13', '01', 'women''s clothing stores', 4233.59),
('2024-02-14', '01', 'women''s clothing stores', 2218.46),
('2024-02-15', '01', 'women''s clothing stores', 1390.69),
('2024-02-17', '01', 'women''s clothing stores', 3736.93),
('2024-02-18', '01', 'women''s clothing stores', 2760.61),
('2024-02-19', '01', 'women''s clothing stores', 1488.15),
('2024-02-20', '01', 'women''s clothing stores', 2980.71),
('2024-02-22', '01', 'women''s clothing stores', 1137.55),
('2024-02-23', '01', 'women''s clothing stores', 4637.28),
('2024-02-24', '01', 'women''s clothing stores', 2035.12),
('2024-02-25', '01', 'women''s clothing stores', 3650.09),
('2024-02-26', '01', 'women''s clothing stores', 2246.84),
('2024-02-28', '01', 'women''s clothing stores', 3080.27),
('2024-02-29', '01', 'women''s clothing stores', 3186.84),
('2024-03-01', '01', 'women''s clothing stores', 1739.42),
('2024-03-02', '01', 'women''s clothing stores', 4878.34),
('2024-03-04', '01', 'women''s clothing stores', 4100.53),
('2024-03-05', '01', 'women''s clothing stores', 4758.0),
('2024-03-06', '01', 'women''s clothing stores', 4579.31),
('2024-03-07', '01', 'women''s clothing stores', 3391.6),
('2024-03-09', '01', 'women''s clothing stores', 4687.5),
('2024-03-10', '01', 'women''s clothing stores', 1353.97),
('2024-03-11', '01', 'women''s clothing stores', 1783.93),
('2024-03-12', '01', 'women''s clothing stores', 1180.91),
('2024-03-14', '01', 'women''s clothing stores', 2301.32),
('2024-03-15', '01', 'women''s clothing stores', 2554.71),
('2024-03-16', '01', 'women''s clothing stores', 2085.4),
('2024-03-17', '01', 'women''s clothing stores', 4314.95),
('2024-03-19', '01', 'women''s clothing stores', 2427.01),
('2024-03-20', '01', 'women''s clothing stores', 2123.74),
('2024-03-21', '01', 'women''s clothing stores', 3170.78),
('2024-03-22', '01', 'women''s clothing stores', 1563.7),
('2024-03-23', '01', 'women''s clothing stores', 4208.79),
('2024-03-25', '01', 'women''s clothing stores', 1298.2),
('2024-03-26', '01', 'women''s clothing stores', 4947.55),
('2024-03-27', '01', 'women''s clothing stores', 4088.98),
('2024-03-28', '01', 'women''s clothing stores', 1794.86),
('2024-03-30', '01', 'women''s clothing stores', 1022.09),
('2024-03-31', '01', 'women''s clothing stores', 4261.85),
('2024-04-01', '01', 'women''s clothing stores', 3827.43),
('2024-04-02', '01', 'women''s clothing stores', 3916.03),
('2024-04-04', '01', 'women''s clothing stores', 4085.08),
('2024-04-05', '01', 'women''s clothing stores', 1296.18),
('2024-04-06', '01', 'women''s clothing stores', 2433.86),
('2024-04-07', '01', 'women''s clothing stores', 1463.48),
('2024-04-09', '01', 'women''s clothing stores', 4452.41),
('2024-04-10', '01', 'women''s clothing stores', 3493.19),
('2024-04-11', '01', 'women''s clothing stores', 2323.59),
('2024-04-12', '01', 'women''s clothing stores', 1254.23),
('2024-04-14', '01', 'women''s clothing stores', 2243.93),
('2024-04-15', '01', 'women''s clothing stores', 2300.73),
('2024-04-16', '01', 'women''s clothing stores', 3918.42),
('2024-04-17', '01', 'women''s clothing stores', 3550.23),
('2024-04-18', '01', 'women''s clothing stores', 4548.85),
('2024-04-20', '01', 'women''s clothing stores', 2888.86),
('2024-04-21', '01', 'women''s clothing stores', 1478.38),
('2024-04-22', '01', 'women''s clothing stores', 3852.98),
('2024-04-23', '01', 'women''s clothing stores', 4043.14),
('2024-04-25', '01', 'women''s clothing stores', 3245.11),
('2024-04-26', '01', 'women''s clothing stores', 4083.87),
('2024-04-27', '01', 'women''s clothing stores', 2975.18),
('2024-04-28', '01', 'women''s clothing stores', 3090.93),
('2024-04-30', '01', 'women''s clothing stores', 2710.16),
('2024-05-01', '01', 'women''s clothing stores', 1101.68),
('2024-05-02', '01', 'women''s clothing stores', 1431.57);

SELECT * FROM retail_sales;
