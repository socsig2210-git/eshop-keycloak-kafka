import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import decodeJwt from '../utils/jwtHelper';
import { loginRequest } from '../services/KeycloakService';


const Login = ({ onSelectRegister }) => {

  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const handleUsernameChange = (e) => setUsername(e.target.value);
  const handlePasswordChange = (e) => setPassword(e.target.value);
  
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const loginResponse  = await loginRequest(username, password);
      
      if(loginResponse.status === 200){
        const data = loginResponse.data;
        await localStorage.setItem('access_token', data.access_token);

        const decodeToken = await decodeJwt(data.access_token);
        
        localStorage.setItem("username", decodeToken.preferred_username);
        localStorage.setItem('refresh_token', data.refresh_token);
        
        const roles = decodeToken.realm_access.roles;
        if(roles.includes('customer')){
          localStorage.setItem('role', 'customer');
          navigate('products');
        } else if(roles.includes('seller')){
          localStorage.setItem('role', 'seller');
          navigate('myproducts');
        } else {
          localStorage.clear();
          navigate('/');
        }

      }else{
        console.error(loginResponse); 
      }
    } catch (error) {
      console.error(error);
    }
  }

  return (
    <div id="login-form">
      <div className="form-container">
        <h2>Login</h2>
        <form onSubmit={(e) => handleLogin(e)}>
          <label htmlFor="login-username">Username:</label>
          <input type="text" id="login-username" name="username"
            value={username} onChange={handleUsernameChange} required />

          <label htmlFor="login-password">Password:</label>
          <input type="password" id="login-password" name="password"
            value={password} onChange={handlePasswordChange} required />

          <button className="submit-button" type="submit">Login</button>
        </form>
        <div className="span-toggle">
          Don't have an account? <span onClick={() => onSelectRegister()}>Register</span> now!
        </div>
      </div>
    </div>
  );
};

export default Login;
