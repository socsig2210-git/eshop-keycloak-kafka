const express = require('express');
const cors = require('cors');
const port = process.env.port || 5000;

const { connection } = require("./dbConnect");

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.get("/health", (req, res) =>{
    res.send("ok");
});

app.get("/products", async(req, res) => {
    try {
        const db = await connection;
        const results = await db.execute("SELECT * FROM Products");
        console.log('tried');
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
})

app.get("/products/id/:id", async(req, res) => {
    try {
        const id = req.params.id;
        const db = await connection;
        const results = await db.execute(`SELECT * FROM Products WHERE Id=${id}`);
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.get("/products/title/:title", async(req, res) => {
    try {
        const title = req.params.title;
        const db = await connection;
        const results = await db.execute(`SELECT * FROM Products WHERE title LIKE '%${title}%'`);
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
})

app.get("/products/seller/:seller", async(req, res) => {
    try {
        const seller = req.params.seller;
        const db = await connection;
        const results = await db.execute(`SELECT * FROM Products WHERE User_username LIKE '%${seller}%'`);
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
})

app.listen(port, () => {
    console.log(`listening in port ${port}`)
})
