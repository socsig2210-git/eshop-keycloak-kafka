import { BrowserRouter, Route, Routes, Navigate } from 'react-router-dom';
import React, { useState } from 'react';
import Login from './Login';
import Register from './Register';
import Products from './Products';
import Orders from './Orders';
import Basket from './Basket';
import ProtectedRoute from './ProtectedRoute';
import '../css/App.css';

const App = () => {
  const [showLogin, setShowLogin] = useState(true);

  const handleSelectRegister = () => {
    setShowLogin(false);
  };

  const handleSelectLogin = () => {
    setShowLogin(true);
  };

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element ={
          showLogin ? (
            <Login onSelectRegister={handleSelectRegister} />
          ) : (
            <Register onSelectLogin={handleSelectLogin} />
          )
        }/>
        <Route element={<ProtectedRoute />}>
          <Route path="/products" element={<Products />} />
          <Route path="/products/basket" element={<Basket />} />
          <Route path="/orders" element={<Orders />} />
          <Route path="*" element={<Navigate to="/" />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
};

export default App;