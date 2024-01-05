import React from "react";

const ProductsList = ({products}) => {
    return (
        <div className="products-list">
          {products.map(product => (
            <div className="product " key={product.id}>
                <img src={`${process.env.PUBLIC_URL}/items/${product.img}`} alt={product.title} style={{ maxWidth: '100%', height: 'auto' }} />
                <h3>{product.title}</h3>
                <p>Price: ${product.price}</p>
                <p>Quantity: {product.quantity}</p>
                <p>Seller: {product.User_username}</p>
          </div>
          ))}
        </div>
      );
};

export default ProductsList;