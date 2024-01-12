const express = require('express');
const cors = require('cors');
const axios = require('axios');
const kafka = require('./kafka')

const port = process.env.port || 5001;

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

app.get("/orders", validateTokenMiddleware, async (req, res) => {
    try {
        const username = req.user.username;
        const roles = req.user.roles;
        
        if(roles.includes("customer")){    
            const db = await connection;
            const results = await db.execute(`SELECT * FROM Orders WHERE customer='${username}';`);
            res.send(results[0]);
        }
    } catch (error) {
        console.error("Error fetching orders:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.post("/orders", validateTokenMiddleware, async (req, res) => {
    try {
        const username = req.user.username;
        const roles = req.user.roles;

        const products = JSON.stringify(req.body.products); // maybe json.stringify?
        const total_price = req.body.total_price;

        if(roles.includes("customer")){    
            const db = await connection;
            const results = await db.execute(
                `INSERT INTO Orders (products, total_price, status, customer)
                 VALUES('${products}', ${total_price}, 'pending', '${username}');`
            );
            
            res.send("ok");
            kafka.kafkaProducer({
                orderId: results[0].insertId,
                products: req.body.products
            });
            // const order = JSON.stringify({Id: })
        }
    } catch (error) {
        console.error("Error posting order:", error);
        res.status(500).json({ error: "Internal Server Error" });        
    }
});

app.listen(port, () => {
    console.log(`listening in port ${port}`)
});