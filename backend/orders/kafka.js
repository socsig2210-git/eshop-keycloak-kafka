const { Kafka, Partitioners } = require('kafkajs');
const { handleOrders } = require('./services');

const kafka = new Kafka({
    clientId: 'order-app',
    brokers: ['kafka:19092'],
    retry: {
        initialRetryTime: 2000,
        retries: 5
    }
});

// Consumer of order-statuses
const consumer = kafka.consumer({
    groupId: "orders-group",
    allowAutoTopicCreation: true,
});

const fetchOrderStatus = async () => {
  try {
    await consumer.connect();
    await consumer.subscribe({ topics: ["status-topic"] });

    await consumer.run({
        eachMessage: async ({ message }) => {
            const jsonMsg = JSON.parse(message.value);
            const result = await handleOrders(jsonMsg.id, jsonMsg.status);
        }
    })

  } catch (error) {
    await consumer.disconnect()
    console.log(error.message)
  }  
};

setTimeout(async () => {
    try {
        await fetchOrderStatus()
    } catch (error) {
        console.log(error.message)
    }
}, 2000)

// Producer of orders 
const producer = kafka.producer({
    allowAutoTopicCreation: true,
    createPartitioner: Partitioners.LegacyPartitioner
});

const sendOrders = async (msg) => {
    await producer.connect()
    await producer.send({
        topic: 'orders-topic',
        messages: [{
            value: JSON.stringify(msg)
        }]
    })

    await producer.disconnect()
}

module.exports = {
    kafkaProducer: sendOrders
}
