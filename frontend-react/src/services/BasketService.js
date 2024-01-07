// BasketService.js

const getBasket = () => {
    // Retrieve basket from local storage or initialize an empty array
    return JSON.parse(localStorage.getItem("basket")) || [];
};

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
}

export { getBasket, addToBasket, removeFromBasket, findProduct };