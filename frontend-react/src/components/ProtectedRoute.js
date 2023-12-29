import React from "react";
import { Navigate, Outlet, useLocation } from "react-router-dom";
import { useAuthCtx } from "../services/AuthProvider";

const ProtectedRoute = () => {
    const { token, userData } = useAuthCtx();
    // const navigate = useNavigate();
    const location = useLocation();

    if(token){
        if(userData.role === 'customer'
        && !location.pathname.startsWith('/products')){
            console.log(location.pathname)
            return (
                <Navigate to='/products' />
            );
        }

        if(userData.role === 'seller'
        && !location.pathname.startsWith('/orders')){
            console.log(location.pathname)
            return (
                <Navigate to='/orders' />
            );
        }
        return (
            <Outlet />
        );
    } else {
        console.log('something')
        return (
            <Navigate to='/' />
        );
    }    
    // const { authenticate } = useAuthCtx();

    // setTimeout(() => {
    //     await authenticate();
    // }, "1000")
    // const active = authenticate();
    // if (active) {
        
    // }
};

export default ProtectedRoute;