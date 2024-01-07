import React, { useState } from "react";
import MainLayout from "./MainLayout";
import BasketItem from "./BasketItem";
import { getBasket } from "../services/BasketService";

const Basket = () => {
    
    return (
        <div>
            <MainLayout>
                <div className="shopping-cart">
                    <div className="shopping-cart-title">
                        Basket
                    </div>
                    {getBasket().map(product => (
                        <BasketItem product={product} key={product.id} />
                    ))}
                </div>
            </MainLayout>
        </div>
    );
}

export default Basket;