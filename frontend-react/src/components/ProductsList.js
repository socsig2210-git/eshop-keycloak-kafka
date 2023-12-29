import React from "react";

const ProductsList = ({products}) => {
    return (
        <div className="products-list">
          {products.map(product => (
            <div className="product " key={product.id}>
                <img src={product.img_path} alt={product.title} style={{ maxWidth: '100%', height: 'auto' }} />
                <h3>{product.title}</h3>
                <p>Price: ${product.price}</p>
                <p>Quantity: {product.quantity}</p>
                <p>Seller: {product.seller}</p>
          </div>
          ))}
        </div>
      );
};

export default ProductsList;