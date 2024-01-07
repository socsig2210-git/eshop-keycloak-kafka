import axios from 'axios';
const API_BASE_URL = 'http://localhost:5000';

let axiosInstance;

const create = () => {
  axiosInstance = axios.create({
    baseURL: API_BASE_URL,
    headers: {
      "Content-Type": 'application/x-www-form-urlencoded',
      "Authorization": `Bearer ${localStorage.getItem("access_token")}`
    }
  });
}

// Request functions
export const reqProducts = async () => {
  create();
  return await axiosInstance.get(
        '/products'
    );
};

export const reqProductsFilter = async (value, filter) => {
  create();
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

export const reqEditProduct = async(id, stock) => {
  create();
  return await axiosInstance.put(
    `/products/${id}`,
    {
      stock: stock
    }
  )
};

export const reqDeleteProduct = async(id) => {
  create();
  return await axiosInstance.delete(
    `/products/${id}`
  )
};