use orders_db;

CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    products JSON,
    total_price DECIMAL(10, 2),
    status ENUM('pending', 'success', 'rejected'),
    customer VARCHAR(255)
);