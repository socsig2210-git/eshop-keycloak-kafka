import React, { useState, useEffect } from 'react';
import MainLayout from './MainLayout';
import ProductsList from './ProductsList';
import { reqProductsFilter } from '../services/ProductsService'
import { useNavigate } from 'react-router-dom';


const MyProducts = () => {
  const [products, setProducts] = useState([]);
  const navigate = useNavigate();

  const fetchProducts = async () => {
    try {
      // Make API request with the filter parameter
      const response = await reqProductsFilter(localStorage.getItem('username'),'seller');
      setProducts(response.data)
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };
  
  const handleClickProduct = (id) =>{
    try {
      navigate(`/myproducts/${id}`)
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  }

  useEffect(() => {
    fetchProducts()
  }, []);

  return (
    <MainLayout>
      <ProductsList products={products} handleClickProduct={handleClickProduct} key={null}/>
    </MainLayout>
  );
};

export default MyProducts;