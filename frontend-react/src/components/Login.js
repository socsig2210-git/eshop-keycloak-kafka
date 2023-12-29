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
    e.preventDefault()
    try {
      
      const loginResponse  = await loginRequest(username, password);
      
      if(loginResponse.status === 200){
        const data = loginResponse.data;

        const decodeToken = await decodeJwt(data.access_token);
        
        localStorage.setItem("username", decodeToken.preferred_username);
        localStorage.setItem('access_token', data.access_token);
        localStorage.setItem('refresh_token', data.refresh_token);
        
        const roles = decodeToken.realm_access.roles;
        if(roles.includes('customer')){
          localStorage.setItem('role', 'customer');
          navigate('products');
        } else if(roles.includes('seller')){
          localStorage.setItem('role', 'seller');
          navigate('orders');
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




  // const handleLogin = async (e) => {
  //   //prevent reload page onsubmit
  //   e.preventDefault()

  //   try {
  //     var myHeaders = new Headers();
  //     myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
  
  //     var urlencoded = new URLSearchParams();
  //     urlencoded.append("username", username);
  //     urlencoded.append("password", password);
  //     urlencoded.append("client_id", "frontend-app");
  //     urlencoded.append("client_secret", "spxkUSHmR4D3955m1E6asFBVD0pMi0mU");
  //     urlencoded.append("grant_type", "password");
  
  //     var requestOptions = {
  //       method: 'POST',
  //       headers: myHeaders,
  //       body: urlencoded,
  //       redirect: 'follow'
  //     };
  
  //     const loginResponse = await fetch("http://localhost:8182/auth/realms/e-shop/protocol/openid-connect/token", requestOptions)
      
  //     if(loginResponse.ok){
  //       const login = await loginResponse.json()
  //       const token = login.access_token
        

  //       // CAN INTROSPECT AFTER LANDING AT PRODUCTS/ORDERS PAGE
  //       // var authRequestOptions = {
  //       //   method: 'POST',
  //       //   headers: myHeaders,

  //       // }

  //       // const authResponse = await fetch("localhost:8182/auth/realms/e-shop/protocol/openid-connect/token/introspect")
        
  //       //store in localstorage username, email, role (customer, seller) and refresh_token
  //       const decodeToken = await decodeJwt(token);
        
  //       localStorage.setItem("username", decodeToken.preferred_username);
  //       localStorage.setItem('access_token', token);
  //       localStorage.setItem('refresh_token', login.refresh_token);
        
  //       const roles = decodeToken.realm_access.roles;
  //       if(roles.includes('customer')){
  //         localStorage.setItem('role', 'customer');
  //         navigate('products');
  //       } else if(roles.includes('seller')){
  //         localStorage.setItem('role', 'seller');
  //         navigate('orders');
  //       } else {
  //         localStorage.clear();
  //         navigate('/');
  //       }

  //     }else{
  //       const err = await loginResponse.json()
  //       console.log(err) 
  //     }
  
  //   } catch (error) {
  //     console.log(error)
  //   }
  // }