import React, { useState } from 'react';
import { registerRequest } from '../services/KeycloakService';

const Register = ({ onSelectLogin }) => {
  
  // React states
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [email, setEmail] = useState('');
  const [role, setRole] = useState('');

  const handleUsernameChange = (e) => setUsername(e.target.value);
  const handlePasswordChange = (e) => setPassword(e.target.value);
  const handleEmailChange = (e) => setEmail(e.target.value);
  const handleRoleChange = (e) => setRole(e.target.value);  

  const handleRegister = async(e) => {
    e.preventDefault()
  
    try {

      const data = {
        username: username,
        password: password,
        email: email,
        role: role,
      };

      const registerResponse = await registerRequest(data);

      if(registerResponse.status === 201){
        onSelectLogin();
      } else {
        console.error(registerResponse)
      }
    } catch (error) {
      console.log(error)
    }
  
  }

  return (
    <div id="register-form">
      <div className="form-container">
        <h2>Register</h2>
        <form onSubmit={(e) => handleRegister(e)}>
          <label htmlFor="register-username">Username:</label>
          <input 
            type="text" 
            id="register-username" 
            name="username" 
            value={username}
            onChange={handleUsernameChange}          
            required />

          <label htmlFor="register-email">Email:</label>
          <input 
            type="email"
            id="register-email" 
            name="email" 
            value={email}
            onChange={handleEmailChange}          
            required />

          <label htmlFor="register-password">Password:</label>
          <input 
            type="password"
            id="register-password" 
            name="password" 
            value={password}
            onChange={handlePasswordChange}
            required />

          <label htmlFor="user-role">Role:</label>
          <select 
            id="user-role"
            name="user-role"
            value={role}
            onChange={handleRoleChange}
            required>
            <option value="" disabled={true}>--Select--</option>
            <option value="Customers">Customer</option>
            <option value="Sellers">Seller</option>
          </select>

          <button className="submit-button" type="submit">Register</button>
        </form>
        <div className="span-toggle">
          Already have an account? <span onClick={() => onSelectLogin()}>Login</span> now!
        </div>
      </div>
    </div>
  );
};

export default Register;
