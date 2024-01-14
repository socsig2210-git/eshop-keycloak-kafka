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

INSERT INTO Products (title, img, price, quantity, User_username) VALUES
('dunk15', 'dunk.jpeg', '63.42', 12, 'socsig'),
('laptop28', 'laptop.jpeg', '124.15', 6, 'socsig'),
('pc7', 'pc.jpeg', '45.78', 3, 'socsig'),
('dunk49', 'dunk.jpeg', '101.23', 17, 'socsig'),
('laptop2', 'laptop.jpeg', '32.56', 8, 'socsig'),
('pc36', 'pc.jpeg', '89.37', 5, 'socsig'),
('dunk10', 'dunk.jpeg', '78.91', 11, 'socsig'),
('laptop23', 'laptop.jpeg', '22.89', 14, 'socsig'),
('pc44', 'pc.jpeg', '130.47', 19, 'socsig'),
('dunk5', 'dunk.jpeg', '67.88', 2, 'socsig'),
('laptop12', 'laptop.jpeg', '42.15', 10, 'socsig'),
('pc33', 'pc.jpeg', '95.76', 7, 'socsig'),
('dunk21', 'dunk.jpeg', '56.32', 15, 'socsig'),
('laptop9', 'laptop.jpeg', '73.45', 4, 'socsig'),
('pc18', 'pc.jpeg', '110.89', 16, 'socsig'),
('dunk30', 'dunk.jpeg', '38.20', 13, 'socsig'),
('laptop14', 'laptop.jpeg', '82.67', 9, 'socsig'),
('pc25', 'pc.jpeg', '117.54', 18, 'socsig'),
('dunk8', 'dunk.jpeg', '29.99', 1, 'socsig'),
('laptop42', 'laptop.jpeg', '50.45', 20, 'socsig'),
('pc3', 'pc.jpeg', '103.68', 16, 'socsig'),
('dunk47', 'dunk.jpeg', '69.87', 7, 'socsig'),
('laptop19', 'laptop.jpeg', '88.21', 14, 'socsig'),
('pc6', 'pc.jpeg', '121.99', 3, 'socsig');