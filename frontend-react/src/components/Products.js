import React from 'react';
import MainLayout from './MainLayout';
import ProductsList from './ProductsList'
import SearchBar from './SearchBar';

const Products = () => {
//   const { authenticated } = useAuth();

//   if (!authenticated) {
//     // Redirect to the home page or login page
//     return <Redirect to="/" />;
//   }

  const sampleProducts = [
    { id: 1, title: 'Product 1', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 19.99, quantity: 10, seller: 'Seller 1' },
    { id: 2, title: 'Product 2', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 29.99, quantity: 5, seller: 'Seller 2' },
    { id: 3, title: 'Product 3', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 39.99, quantity: 5, seller: 'Seller 3' },
    { id: 4, title: 'Product 4', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 49.99, quantity: 5, seller: 'Seller 4' },
    { id: 5, title: 'Product 5', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 59.99, quantity: 5, seller: 'Seller 5' },
    { id: 6, title: 'Product 6', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 69.99, quantity: 5, seller: 'Seller 6' },
    { id: 7, title: 'Product 7', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 79.99, quantity: 5, seller: 'Seller 7' },
    { id: 8, title: 'Product 8', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 89.99, quantity: 5, seller: 'Seller 8' },
    { id: 9, title: 'Product 9', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 99.99, quantity: 5, seller: 'Seller 9' },
    { id: 10, title: 'Product 10', img_path: `${process.env.PUBLIC_URL}/items/dunk.jpeg`, price: 109.99, quantity: 5, seller: 'Seller 10' },
    // Add more products as needed
  ];

// onSearch () => implement backend request depending on filters and input
  return (
    <MainLayout>
      PRODUCTS
      <SearchBar /> 
      <ProductsList products={sampleProducts} key={null}/>
    </MainLayout>
  );
};

export default Products;