import React, {useState} from "react";
import { useNavigate } from "react-router-dom";
import { addToBasket, removeFromBasket } from "../services/BasketService";

const BasketItem = ({product, handleTotalPriceChange}) => {
    const [quantity, setQuantity] = useState(product.quantity);
    const navigate = useNavigate();

    const handleIncrement = () => {
        if (quantity < product.stock) {
            setQuantity(quantity + 1);
            product.quantity++;
            addToBasket(product);
            handleTotalPriceChange();
        }
    };

    const handleDecrement = () => {
        if (quantity > 1) {
            setQuantity(quantity - 1);
            product.quantity--;
            addToBasket(product);
            handleTotalPriceChange();
        }
    };

    const handleDelete = () => {
        removeFromBasket(product.id);
        window.location.reload();
    };

    return (
        <div className="shopping-cart-item" key={product.id}>
            <div className="shopping-cart-buttons">
                <span className="shopping-cart-delete-btn" onClick={handleDelete}/>
            </div>
            <div className="shopping-cart-image" onClick={() => navigate(`/products/${product.id}`)}>
                <img src={`${process.env.PUBLIC_URL}/items/${product.img}`} alt=""
                    width="70"
                    height="70" />
            </div>
            <div className="shopping-cart-description">
                <span>{product.title}</span>
                <span>{product.seller}</span>
                <span>Id: {product.id}</span>
            </div>
            <div className="shopping-cart-quantity">
                <button className="shopping-cart-minus-btn" onClick={handleDecrement}>
                    -
                </button>
                <span>{quantity}</span>
                <button className="shopping-cart-plus-btn" onClick={handleIncrement}>
                    +
                </button>
            </div>
            <div className="shopping-cart-price">${product.price}</div>
        </div>
    );
}

export default BasketItem;