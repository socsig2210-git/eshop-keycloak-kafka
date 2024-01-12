import { createContext, useContext, useState } from 'react';
import * as ks from './KeycloakService';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {

  const [token, setToken] = useState(null);
  const [refreshToken, setRefreshToken] = useState(null);
  const [userData, setUserData] = useState(null);

  const authenticate = async() => {
    try {
      console.log(`auth token: ${token}`)
      if(token != null){
        const response = await ks.introspectRequest(token);
        console.log(response)
        return response.active;
      } else {
        return false;
      }
    } catch (error) {
      console.error(error)
      onLogout();
      return false;
    }  
  };

  const onLogin = (token, refreshToken, userData) => {
    // after login, set token, refresh token, some user data
    setToken(token);
    setRefreshToken(refreshToken);
    setUserData(userData);
    // console.log(`${token}\n\n\n${refreshToken}`)
  }

  const onLogout = () => {
    // after logout delete all states
    setToken(null);
    setRefreshToken(null);
    setUserData(null);
  }


  const value = {
    token,
    refreshToken,
    userData,
    authenticate: authenticate,
    login: onLogin,
    logout: onLogout,
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuthCtx = () => {
  return useContext(AuthContext);
};