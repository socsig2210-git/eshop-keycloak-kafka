import React, { useEffect, useState } from "react";
import { useParams, Navigate } from "react-router-dom";
import MainLayout from "./MainLayout";
import { reqProductsFilter } from "../services/ProductsService";

// Create your component
const ProductDetail = () => {
    const {id} = useParams();
    const [product, setProducts] = useState([]);

    const fetchProduct = async () => {
        try {
            const response = await reqProductsFilter(id, "id");
            setProducts(response.data[0])
        } catch (error) {
        console.error('Error fetching products:', error);
        }
    };

    useEffect(() => {
        fetchProduct();
    }, []);

    if(product){
        return (
            <MainLayout>
                <div className="product-details-container">
                    <div className="product-details-image">
                        <div className="product-details-title">{product.title}</div>
                        <img src={`${process.env.PUBLIC_URL}/items/${product.img}`} alt={product.title} />
                        <div className="product-details-id">ID: {product.id}, Seller: {product.User_username}</div>
                    </div>
                    <div className="product-details-info">
                        <div className="product-details-field">
                            <span className="product-details-label">Price:</span>
                            <span className="product-details-value">${product.price}</span>
                        </div>
                        <div className="product-details-field">
                            <span className="product-details-label">Stock:</span>
                            <span className="product-details-value">{product.quantity}</span>
                        </div>
                    </div>
                </div>
            </MainLayout>
        );
    } else {
        return (
            <Navigate to='/products' />
        );
    }
};

export default ProductDetail;