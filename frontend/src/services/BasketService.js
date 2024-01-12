// BasketService.js

const getBasket = () => {
    // Retrieve basket from local storage or initialize an empty array
    return JSON.parse(localStorage.getItem("basket")) || [];
};

const clearBasket = () => {
    localStorage.removeItem('basket');
}

// Both adds and edits products to basket
const addToBasket = (productToAdd) => {
    const basket = getBasket();

    const productIndex = basket.findIndex(
        (product) => product.id === productToAdd.id
    );

    if (productIndex !== -1) {
        basket[productIndex] = productToAdd;
        // alert('Changes successfully aplied on basket!')
    } else {
        basket.push(productToAdd);
        // alert('Product added to basket!')
    }

    localStorage.setItem("basket", JSON.stringify(basket));
};

const removeFromBasket = (productId) => {
    const basket = getBasket();

    const productIndexToRemove = basket.findIndex(
        (product) => product.id === productId
    );

    if (productIndexToRemove !== -1) {
        basket.splice(productIndexToRemove, 1);
        localStorage.setItem("basket", JSON.stringify(basket));
        // alert('Successfully removed from basket!')
    }
};

const findProduct = (productId) => {
    const basket = getBasket();
    const productIndex = basket.findIndex(
        (product) => product.id === productId
    );

    if (productIndex !== -1) {
        return basket[productIndex]
    } else {
        return null;
    }
};

const calculateTotalPrice = () => {
    const basket = getBasket();
    let totalPrice = 0.00;
    basket.forEach(product => {
        totalPrice = totalPrice + (product.price*product.quantity);
    });
    return totalPrice;
}

const getProductsForOrder = () => {
    const basket = getBasket();
    let orderProducts = [];
    basket.forEach(product => {
        const orderProduct = {
            product_id: product.id,
            title: product.title,
            amount: product.quantity
        };

        orderProducts.push(orderProduct);
    });

    return orderProducts;
}

export { getBasket, clearBasket, addToBasket, removeFromBasket, findProduct, calculateTotalPrice, getProductsForOrder };