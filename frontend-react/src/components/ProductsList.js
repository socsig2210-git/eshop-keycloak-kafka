import React from "react";
import { useNavigate } from "react-router-dom";

const ProductsList = ({products}) => {

    const navigate = useNavigate();

    const handleClick = (id) =>{
      try {
        navigate(`/products/${id}`)
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    }

    return (
      <div className="products-list">
          {products.map(product => (
            <div className="product " key={product.id} onClick={() => handleClick(product.id)}>
                <img src={`${process.env.PUBLIC_URL}/items/${product.img}`} alt={product.title} style={{ maxWidth: '100%', height: 'auto' }} />
                <h3>{product.title}{!product.quantity ? " (out of stock)" : ""}</h3>
                <p>Price: ${product.price}</p>
                {/* <p>Quantity: {product.quantity}</p>
                <p>Seller: {product.User_username}</p> */}
          </div>
          ))}
      </div>
    );
};

export default ProductsList;