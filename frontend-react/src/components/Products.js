import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import MainLayout from './MainLayout';
import SearchBar from './SearchBar';
import ProductsList from './ProductsList';
import { reqProducts, reqProductsFilter } from '../services/ProductsService'


const Products = () => {
  
//   if (!authenticated) {
//     // Redirect to the home page or login page
//     return <Redirect to="/" />;
//   }
  const [products, setProducts] = useState([]);
  const navigate = useNavigate();

  const handleSearch = async(value, filter) =>{
    try {
      const response = await reqProductsFilter(value, filter);
      setProducts(response.data)
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  }

  const handleClickProduct = (id) =>{
    try {
      navigate(`/products/${id}`)
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  }

  const fetchProducts = async () => {
    try {
      // Make API request with the filter parameter
      const response = await reqProducts();
      setProducts(response.data)
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };

  useEffect(() => {
    fetchProducts()
  }, []);

  return (
    <MainLayout>
      <SearchBar onSearch={handleSearch}/> 
      <ProductsList products={products} handleClickProduct={handleClickProduct} key={null}/>
    </MainLayout>
  );
};

export default Products;

// import React, { useState, useEffect } from 'react';
// import MainLayout from './MainLayout';
// import SearchBar from './SearchBar';
// import ProductsList from './ProductsList';
// import { reqProducts } from '../services/ProductsService'

// const Products = () => {
//   // State for storing products data
//   const [products, setProducts] = useState([]);

//   // State for storing search filter (e.g., ID)
//   const [searchFilter, setSearchFilter] = useState('');

//   // Function to fetch products from the API
//   const fetchProducts = async (filter) => {
//     try {
//       // Make API request with the filter parameter
//       const data = await reqProducts;
//       console.log(data)
//       // const data = await response.json();

//       // Update the state with the fetched products
//       setProducts(data);
//     } catch (error) {
//       console.error('Error fetching products:', error);
//     }
//   };

//   // Effect to fetch products when the page is loaded
//   useEffect(() => {
//     fetchProducts('');
//   }, []); // Empty dependency array means this effect runs once on component mount

//   // Function to handle search button click
//   const handleSearch = () => {
//     // Call the fetchProducts function with the searchFilter
//     fetchProducts(searchFilter);
//   };

//   return (
//     <MainLayout>
//       <h1>PRODUCTS</h1>
//       <SearchBar
//         value={searchFilter}
//         onChange={(e) => setSearchFilter(e.target.value)}
//         onSearch={handleSearch}
//       />
//       <ProductsList products={products} />
//     </MainLayout>
//   );
// };

// export default Products;
