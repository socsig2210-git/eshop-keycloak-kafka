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

    return connection;
  } catch (e) {
    console.error("Error connecting to MySQL:", e);
    throw new Error(e);
  }
};

const connection = connect();

module.exports = { connection };
