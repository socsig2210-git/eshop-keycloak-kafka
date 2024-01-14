import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom'
import { reqPostProduct } from '../services/ProductsService';

const AddProduct = () => {
  const [productData, setProductData] = useState({
    title: '',
    price: '',
    quantity: '',
  });

  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;
  
    setProductData({
      ...productData,
      [name]: value,
    });
  };

  const handleSubmit = async(e) => {
    e.preventDefault();

    console.log('Product Data:', productData);
    try {
        const response = await reqPostProduct(productData);
        navigate(`/myproducts/${response.data.id}`);
    } catch (error) {
        console.error(error);
    }
  };

  return (
    <div id='product-form'>
        <div className="form-container">
            <h2>Add New Product</h2>
            <form onSubmit={handleSubmit}>
                
                <label htmlFor="title">Title:</label>
                <input type="text" name="title" value={productData.title} onChange={handleChange} required />

                {/* <label htmlFor="image">Image:</label>
                <input type="file" name="image" onChange={handleChange} accept="image/*" required /> */}

                <label htmlFor="price">Pricing:</label>
                <input type="number" step="0.01" name="price" value={productData.price} onChange={handleChange} required />

                
                <label htmlFor="quantity">Stock:</label>
                <input type="number" name="quantity" value={productData.quantity} onChange={handleChange} required />

                <button className='submit-button' type="submit">Add Product</button>
            </form>
        </div>
    </div>
  );
};

export default AddProduct;

//   const [productData, setProductData] = useState({
//     title: '',
//     image: null,
//     price: '',
//     quantity: '',
//   });

//   const handleChange = (e) => {
//     const { name, value, type, files } = e.target;

//     // For file input, use files[0] to get the selected file
//     const newValue = type === 'file' ? files[0] : value;

//     setProductData({
//       ...productData,
//       [name]: newValue,
//     });
//   };

// TODO: FOR IMAGE UPLAODING

//   const handleSubmit = async(e) => {
//     e.preventDefault();

//     // Handle form submission here
//     console.log('Product Data:', productData);
//     try {
//         const formData = new FormData();
//         formData.append('title', productData.title);
//         formData.append('image', productData.image);
//         formData.append('price', productData.price);
//         formData.append('quantity', productData.quantity);

//         const response = await reqPostProduct(formData);
//         console.log(response);
//     } catch (error) {
//         console.error(error);
//     }
//   };

