import React, { useState } from "react";
import MainLayout from "./MainLayout";
import BasketItem from "./BasketItem";
import { getBasket , calculateTotalPrice } from "../services/BasketService";

const Basket = () => {
    
    const [totalPrice, setTotalPrice] = useState(calculateTotalPrice);
    const handleTotalPriceChange = () => setTotalPrice(calculateTotalPrice);

    return (
        <div>
            <MainLayout>
                <div className="shopping-cart">
                    <div className="shopping-cart-title">
                        Basket
                    </div>
                    {getBasket().map(product => (
                        <BasketItem product={product} handleTotalPriceChange={handleTotalPriceChange} key={product.id} />
                    ))}
                    <div className="shopping-cart-total-price">
                        Total: ${totalPrice.toFixed(2)}
                    </div>
                </div>
                
            </MainLayout>
        </div>
    );
}

export default Basket;