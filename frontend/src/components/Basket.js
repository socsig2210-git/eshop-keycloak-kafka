import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import MainLayout from "./MainLayout";
import BasketItem from "./BasketItem";
import { getBasket, clearBasket, calculateTotalPrice, getProductsForOrder } from "../services/BasketService";
import { reqPlaceOrder } from "../services/OrderService";

const Basket = () => {
    
    const [totalPrice, setTotalPrice] = useState(calculateTotalPrice);
    const handleTotalPriceChange = () => setTotalPrice(calculateTotalPrice);
    const navigate = useNavigate();

    const handlePlaceOrder = async() => {

        try {  
            const products = getProductsForOrder();
            const total_price = calculateTotalPrice();

            const order = {
                products: products,
                total_price: total_price
            };

            const response = await reqPlaceOrder(order);
            console.log(response);

            clearBasket();
            navigate('/orders');

        } catch (error) {
            console.error(error);
        }
    };

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
                    {totalPrice > 0 && 
                        <div className="shopping-cart-order-button">
                            <button onClick={handlePlaceOrder}>
                                Place Order
                            </button>
                        </div>
                    }
                </div>
                
            </MainLayout>
        </div>
    );
}

export default Basket;