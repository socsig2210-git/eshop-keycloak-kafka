import React from "react"
import { logoutRequest } from "../services/KeycloakService";
import { useNavigate } from "react-router-dom";

const LogoutButton = () => {
    
    const navigate = useNavigate();

    const handleLogout = async(e) => {
        e.preventDefault()
        try {
            const refresh_token = localStorage.getItem('refresh_token');
            await logoutRequest(refresh_token);
            localStorage.clear();
            navigate('/');

        } catch (error) {
            console.error(error)
        };
    };
    
    return(
        <button id="logout-btn" onClick={(e) => handleLogout(e)}>Logout</button>
    );
}

export default LogoutButton;