-- Switch to the newly created database
USE products_db;

-- Create the Products table
CREATE TABLE IF NOT EXISTS Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    img VARCHAR(255),
    price DECIMAL(10,2),
    quantity INT,
    User_username VARCHAR(255)
);

INSERT INTO Products (title, img, price, quantity, User_username)
VALUES('shoes', 'dunk.jpeg', '19.99', 1, 'socsig'),
('dunks2', 'dunk.jpeg', '19.99', 6, 'socsig'),
('dunks3', 'dunk.jpeg', '19.99', 3, 'socsig'),
('dunks4', 'dunk.jpeg', '19.99', 3, 'test'),
('dunks5', 'dunk.jpeg', '23.33', 4, 'socsig'),
('dunks6', 'dunk.jpeg', '19.99', 4, 'socsig'),
('dunks7', 'dunk.jpeg', '19.99', 0, 'socsig'),
('dunks8', 'dunk.jpeg', '19.99', 4, 'socsig'),
('dunks9', 'dunk.jpeg', '21.08', 4, 'socsig'),
('dunks10', 'dunk.jpeg', '19.99', 4, 'socsig'),
('dunks11', 'dunk.jpeg', '19.99', 4, 'socsig');