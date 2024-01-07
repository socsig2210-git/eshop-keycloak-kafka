import React, { useState } from "react";
import { addToBasket, removeFromBasket } from "../services/BasketService";
import { findProduct } from "../services/BasketService";

const AddBasket = ({ product }) => {
  const [quantity, setQuantity] = useState(1);
  const [basketItem, setBasketItem] = useState(findProduct(product.id));

  const handleAddToBasket = () => {

    const item = {
      id: product.id,
      title: product.title,
      img: product.img,
      price: product.price,
      seller: product.User_username,
      stock: product.quantity,
      quantity: quantity,
    };

    if(quantity > 0 && quantity <= product.quantity) {
      addToBasket(item);
      setBasketItem(item);
    }
  };

  const handleRemoveFromBasket = () => {
    removeFromBasket(product.id);
    setBasketItem(null);
  }

  return (
    <div className="add-basket-container">
      <input
        type="number"
        min="1"
        max={product.quantity}
        value={quantity}
        onChange={(e) => setQuantity(parseInt(e.target.value, 10))}
        className="add-basket-input"
      />
      <button onClick={handleAddToBasket} className="add-basket-button">
        Add to Basket
      </button>
      <br />
      {basketItem ? `(${basketItem.quantity} in basket)` : ""}
      <br />
      <br />
      <span className="gg-trash" onClick={handleRemoveFromBasket} />
    </div>
  );

};

export default AddBasket;