import React, { useEffect, useState } from 'react';
import MainLayout from './MainLayout';
import { reqOrders } from '../services/OrderService';
import OrderTab from './OrderTab';

const Orders = () => {
  const [orders, setOrders] = useState([]);

  const fetchOrders = async () => {
    try {
      const response = await reqOrders();
      setOrders(response.data)
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };

  useEffect(() => {
    fetchOrders()
  }, []);

  return (
    <MainLayout>
      <div>
      {orders.map((order) => 
        <OrderTab key={order.id} order={order}/>
      )}
      </div>
    </MainLayout>
  );
};

export default Orders;