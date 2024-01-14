const mysql = require("mysql2/promise");

// Connect to the database
const connect = async () => {
  try {
    const connection = await mysql.createPool({
      connectionLimit: 1,
      host: "orders_db",
      port: 3306,
      user: "admin",
      password: "admin",
      database: "orders_db",
    });

    console.log("Connected to MySQL database");

    // // Create a table
    // const createTableQuery = `
    //     CREATE TABLE IF NOT EXISTS products (
    //         id INT AUTO_INCREMENT PRIMARY KEY,
    //         title VARCHAR(255),
    //         img VARCHAR(255),
    //         price DECIMAL(10, 2),
    //         quantity INT,
    //         user_product VARCHAR(255)
    //     )
    //     `;

    // const table = await connection.query(createTableQuery);
    // console.log(table);

    return connection;
  } catch (e) {
    console.error("Error connecting to MySQL:", e);
    throw new Error(e);
  }
};

const connection = connect();

module.exports = { connection };
