const express = require('express');
const cors = require('cors');
const axios = require('axios');

const port = process.env.port || 5000;

const { connection } = require("./dbConnect");

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Auth Middleware
const validateTokenMiddleware = async (req, res, next) => {
    try {
        const token = req.headers['authorization'].split(' ')[1];
        // Check if the token is present
        if (!token) {
            return res.status(401).json({ error: 'Token is missing' });
        }

        // Send a request to the Keycloak introspect endpoint
        const keycloakResponse = await axios.post('http://localhost:8182/auth/realms/e-shop/protocol/openid-connect/token/introspect', {
            client_id: 'frontend-app',
            client_secret: 'spxkUSHmR4D3955m1E6asFBVD0pMi0mU',
            token: token,
        },
        { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });

        const introspectData = keycloakResponse.data;
        
        // Check if the user is active
        if (!introspectData.active) {
            return res.status(401).json({ error: 'Token is not valid' });
        }
        // console.log(introspectData);

        const username = introspectData.username;
        const roles = introspectData.realm_access.roles;

        // Attach user information to the request for further processing in your routes
        req.user = {
            username,
            roles
        };

        // Continue to the next middleware or route handler
        next();
    } catch (error) {
        console.error('Error validating token:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
};

// GET
app.get("/health", (req, res) => {
    res.send("ok");
});

app.get("/products", validateTokenMiddleware, async (req, res) => {
    try {
        const db = await connection;
        const results = await db.execute("SELECT * FROM Products;");
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.get("/products/id/:id", validateTokenMiddleware, async (req, res) => {
    try {
        const id = req.params.id;
        const db = await connection;
        const results = await db.execute(`SELECT * FROM Products WHERE Id=${id};`);
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.get("/products/title/:title", validateTokenMiddleware, async (req, res) => {
    try {
        const title = req.params.title;
        const db = await connection;
        const results = await db.execute(`SELECT * FROM Products WHERE title LIKE '${title}%';`);
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.get("/products/seller/:seller", validateTokenMiddleware, async (req, res) => {
    try {
        const seller = req.params.seller;
        const db = await connection;
        const results = await db.execute(`SELECT * FROM Products WHERE User_username LIKE '%${seller}%';`);
        res.send(results[0]);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
})

// PUT
app.put("/products/:id", validateTokenMiddleware, async (req, res) => {
    try {
        const user = req.user.username;
        const roles = req.user.roles;
        const productId = req.params.id
        const stock = req.body.stock;

        if (roles.includes("seller")){
            const db = await connection;
            const results = await db.execute(`UPDATE Products SET quantity=${stock} WHERE User_username = '${user}' AND Id = ${productId};`)
            res.send({ id: productId, stock: stock });
        }

    } catch (error) {
        console.error("Error updating products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
})

app.delete("/products/:id", validateTokenMiddleware, async (req, res) => {
    try {
        const user = req.user.username;
        const roles = req.user.roles;
        const productId = req.params.id

        if (roles.includes("seller")){
            const db = await connection;
            const results = await db.execute(`DELETE FROM Products WHERE User_username = '${user}' AND Id = ${productId};`)
            res.send({ id: productId });
        }
    } catch (error) {
        console.error("Error deleting products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.post("/products", validateTokenMiddleware, async(req, res) => {
    try {
        const user = req.user.username;
        const roles = req.user.roles;
        
        if (roles.includes("seller")) {
            // Access form data
            const title = req.body.title;
            const price = req.body.price;
            const quantity = req.body.quantity;

            const db = await connection;
            const results = await db.execute(
                `INSERT INTO Products (title, img, price, quantity, User_username)
                 VALUES('${title}', 'dunk.jpeg', '${price}', ${quantity}, '${user}');`
            );
            res.send(req.body);
        }
    } catch (error) {
        console.error("Error adding product: ", error);
        res.status(500).json({error: "Internal Server Error"});
    }
});

app.listen(port, () => {
    console.log(`listening in port ${port}`)
});

// TODO: FOR IMAGE UPLAODING

// const express = require('express');
// const multer = require('multer');
// const bodyParser = require('body-parser');

// const app = express();
// const port = 3000;

// // Set up multer for handling file uploads
// const storage = multer.memoryStorage(); // Use memory storage for simplicity
// const upload = multer({ storage: storage });

// // Set up body-parser for parsing other form data
// app.use(bodyParser.urlencoded({ extended: true }));
// app.use(bodyParser.json());

// // Route for handling the POST request
// app.post('/your-api-endpoint', upload.single('image'), (req, res) => {
//   try {
//     // Access form data
//     const title = req.body.title;
//     const price = req.body.price;
//     const stock = req.body.stock;

//     // Access file data
//     const imageBuffer = req.file.buffer; // Buffer containing the file data
//     const imageOriginalName = req.file.originalname; // Original name of the file

//     // Handle the data as needed
//     console.log('Title:', title);
//     console.log('Price:', price);
//     console.log('Stock:', stock);
//     console.log('Image Original Name:', imageOriginalName);
    
//     // In a real-world scenario, you might save the file to disk or process it further

//     // Send a response
//     res.status(200).json({ message: 'Product added successfully' });
//   } catch (error) {
//     console.error('Error handling the request:', error);
//     res.status(500).json({ error: 'Internal server error' });
//   }
// });

// app.listen(port, () => {
//   console.log(`Server is running on port ${port}`);
// });
