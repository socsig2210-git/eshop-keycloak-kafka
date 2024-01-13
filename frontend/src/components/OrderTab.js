import React from 'react';

const OrderTab = ({ order }) => {
  // Function to get the appropriate text color based on the order status
  const getStatusColor = () => {
    switch (order.status) {
      case 'rejected':
        return 'red';
      case 'success':
        return 'green';
      case 'pending':
        return 'orange';
      default:
        return 'black';
    }
  };

  return (
    <div className="order-tab-container">
      <div className="order-header">
        <span className="order-id">Order #{order.id}</span>
        <span className="order-status" style={{ color: getStatusColor() }}>{order.status}</span>
      </div>
      <ul className="order-products">
        {order.products.map((product, index) => (
          <li key={index} className="order-product">
            {`x${product.amount} ${product.title}`}
          </li>
        ))}
      </ul>
      <div className="order-total-price">$ {order.total_price}</div>
    </div>
  );
};

export default OrderTab;