-- Switch to the newly created database
USE orders_db;

-- Create the Products table
CREATE TABLE IF NOT EXISTS Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    img VARCHAR(255),
    price DECIMAL(10,2),
    quantity INT,
    User_username VARCHAR(255)
);

