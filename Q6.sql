DROP TABLE if EXISTS Transactions;
DROP TABLE if EXISTS Accounts;

CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_account_id INT NOT NULL,
    receiver_account_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    `time` DATETIME NOT NULL
);

INSERT INTO Accounts (balance) VALUES
(1000.00),
(1500.00),
(1200.00),
(1100.00),
(1600.00),
(2000.00),
(1800.00),
(1700.00),
(1900.00),
(2100.00);

DELIMITER $$
CREATE or replace FUNCTION generate_day()
RETURNS DATE
BEGIN
    RETURN '2024-01-01' + INTERVAL FLOOR(RAND() * 31) DAY;
END$$
DELIMITER ;

INSERT INTO Transactions (sender_account_id, receiver_account_id, amount, `time`) VALUES
(1, 2, 150.00, generate_day()),
(1, 5, 170.00, generate_day()),
(3, 4, 200.50, '2024-01-14 00:00:00'),
(3, 9, 1200.50, '2024-01-15 00:00:00'),
(3, 6, 800.50, '2024-01-15 00:00:00'),
(3, 2, 400.50, '2024-01-16 00:00:00'),
(5, 6, 99.99, generate_day()),
(7, 8, 300.00, generate_day()),
(9, 10, 250.755, generate_day()),
(2, 5, 100.00, generate_day()),
(4, 1, 50.00, generate_day()),
(6, 3, 125.60, generate_day()),
(8, 9, 180.25, generate_day()),
(10, 7, 75.00, generate_day());

SELECT * FROM accounts;
SELECT * FROM transactions; 