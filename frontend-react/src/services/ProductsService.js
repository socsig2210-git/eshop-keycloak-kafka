import axios from 'axios';
const API_BASE_URL = 'http://localhost:5000';

const axiosInstance = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    "Content-Type": 'application/x-www-form-urlencoded',
    "Accept": '*/*'
  },
});

// Request functions
export const reqProducts = async () => {
  return await axiosInstance.get(
        '/products'
    );
};

export const reqProductsFilter = async (value, filter) => {
  
  switch (filter) {
    case 'id':
      return await axiosInstance.get(
        `/products/id/${value}`
      );
    case 'seller':
      return await axiosInstance.get(
        `/products/seller/${value}`
      );
    case 'title':
      return await axiosInstance.get(
        `/products/title/${value}`
      );
    default:
      break;
  }
};