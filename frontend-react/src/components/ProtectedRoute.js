import React, { useEffect, useState } from "react";
import { Navigate, Outlet, useLocation } from "react-router-dom";
import { introspectRequest, loginRequest } from '../services/KeycloakService'
// import { useAuthCtx } from "../services/AuthProvider";

const ProtectedRoute = () => {
    // const [result, setResult] = useState(null);

    const location = useLocation();
    const token = localStorage.getItem('access_token');
    const role = localStorage.getItem('role');
    
    // useEffect(() => {

    //     const introspect = async() => {
    //         try {
    //             const response = await introspectRequest(token);
    //             // const result = await response.json();
    //             console.log(response);
    //             // setResult(result);
    //         } catch (error) {
    //             console.error(error);
    //         }
    //     };

    //     introspect();
    // });

    // const active = data.active;

    //TODO: fix the fucking active shit
    if(token){
        if(role === 'customer'
        && !location.pathname.startsWith('/products')){
            return (
                <Navigate to='/products' />
            );
        }

        if(role === 'seller'
        && !location.pathname.startsWith('/orders')){
            return (
                <Navigate to='/orders' />
            );
        }
        return (
            <Outlet />
        );
    } else {
        return (
            <Navigate to='/' />
        );
    }    
};

export default ProtectedRoute;