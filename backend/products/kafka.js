const { Kafka, Partitioners } = require('kafkajs')
const { handleProducts } = require('./services')

const kafka = new Kafka({
  clientId: 'products-app',
  brokers: ['localhost:8097'],
  retry: {
    initialRetryTime: 2000,
    retries: 5
  }
});

// Consumer of orders
const consumer = kafka.consumer({
  groupId: "products-group",
  allowAutoTopicCreation: true,
});

const fetchProductsFromOrderTopic = async () => {
  try {
    await consumer.connect();
    await consumer.subscribe({ topics: ["orders-topic"] });

    await consumer.run({
      eachMessage: async ({ message }) => {

        const jsonMsg = JSON.parse(message.value)
        const result = await handleProducts(jsonMsg)

        if (result) {
          await sendStatus({ id: jsonMsg.orderId, status: 'success' });
        };

        if (!result) {
          await sendStatus({ id: jsonMsg.orderId, status: 'rejected' });
        }

      }
    });
  } catch (error) {
    await consumer.disconnect()
    console.log(error.message)
  }
}

setTimeout(async () => {
  try {
    await fetchProductsFromOrderTopic()
  } catch (error) {
    console.log(error.message)
  }
}, 2000)

// Producer of order statuses
const producer = kafka.producer({
  allowAutoTopicCreation: true,
  createPartitioner: Partitioners.LegacyPartitioner
});

const sendStatus = async (msg) => {
  await producer.connect()
  await producer.send({
    topic: 'status-topic',
    messages: [{
      value: JSON.stringify(msg)
    }]
  })

  await producer.disconnect()
}

module.exports = {
  kafkaProducer: sendStatus
};
