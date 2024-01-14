import axios from 'axios';
const API_BASE_URL = `http://localhost:5001`;

let axiosInstance;

const create = () => {
    axiosInstance = axios.create({
        baseURL: API_BASE_URL,
        headers: {
            "Content-Type": 'application/x-www-form-urlencoded',
            "Authorization": `Bearer ${localStorage.getItem("access_token")}`
        }
    });
};

export const reqOrders = async () => {
    create();
    return await axiosInstance.get(
        '/orders'
    );
};

export const reqPlaceOrder = async (order) => {
    create();
    return await axiosInstance.post(
        '/orders',
        order
    );
};