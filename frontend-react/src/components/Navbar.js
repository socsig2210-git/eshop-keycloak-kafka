import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import LogoutButton from './LogoutButton';

const Navbar = ({ username, role, onLogout }) => {
  return (
    <div className="navbar">
      <div className="left-section">
        <Link to={'/products'}>
          Home
        </Link>
      </div>
      <div className="center-section">
        <h1 className="logo">E-SHOP</h1>
      </div>
      {/* <div className="right-section">
        {role === 'customer' && (
          <Link to="/products/basket" className="cart-button">
            Cart
          </Link>
        )}
      </div> */}
      <div className="right-section">
        <Link to="/products/basket" className="cart-button">
          <img src={`${process.env.PUBLIC_URL}/cart.png`}
                alt="Cart"
                width="24"
                height="24"></img>
        </Link>
      </div>
        <LogoutButton />
    </div>
  );
};

// Navbar.propTypes = {
//   username: PropTypes.string.isRequired,
//   role: PropTypes.string.isRequired,
//   onLogout: PropTypes.func.isRequired,
// };

export default Navbar;