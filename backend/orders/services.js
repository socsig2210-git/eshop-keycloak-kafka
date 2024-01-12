//update database for products amount
const { connection } = require('./dbConnect')

const handleOrders = async (id, status)=>{
    try {
        const db = await connection;

        console.log([id, status]);
        const update = await db.execute(
            `UPDATE Orders 
             SET status='${status}' 
             WHERE id=${id}`);

        return true;

    } catch (error) {
        console.log(error.message)
        throw new Error(error)
    }
}

module.exports = { handleOrders }