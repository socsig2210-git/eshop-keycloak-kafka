import axios from 'axios';

const API_BASE_URL = 'http://localhost:8182/auth';
const CLIENT_URL = API_BASE_URL + '/realms/e-shop/protocol/openid-connect'; 
const MASTER_URL = API_BASE_URL + '/realms/master/protocol/openid-connect'

const axiosInstance = axios.create({
  baseURL: CLIENT_URL,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
  },
});

// Request functions
const loginRequest = async (username, password) => {
    return await axiosInstance.post(
        '/token',
        `username=${username}&password=${password}&client_id=frontend-app&client_secret=spxkUSHmR4D3955m1E6asFBVD0pMi0mU&grant_type=password`
    );
};

const logoutRequest = async (refresh_token) => {
    await axiosInstance.post(
        '/logout',
        `refresh_token=${refresh_token}&client_id=frontend-app&client_secret=spxkUSHmR4D3955m1E6asFBVD0pMi0mU`
    );
};

const registerRequest = async (userData) => {
    const tokenResponse = await axios.post(
        `${MASTER_URL}/token`,
        "grant_type=client_credentials&client_id=admin-cli&client_secret=BQdIipQduVxWBl7Nqw5Qq8fFXIOxa6zZ",
        {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
        },
    );
    const token = tokenResponse.data.access_token;
    const data = JSON.stringify({
        "email": userData.email,
        "enabled": true,
        "username": userData.username,
        "attributes": {
          "client_id": "frontend-app"
        },
        "groups": [
          userData.role
        ],
        "credentials": [
          {
            "type": "password",
            "value": userData.password,
            "temporary": false
          }
        ]
    });

    return await axios.post(
        `${API_BASE_URL}/admin/realms/E-shop/users`,
        data,
        {
            withCredentials: true,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
        },
    )
};

const introspectRequest = async(token) => {
  
  // TODO: FIND IF THERE IS A WAY
  const response = await axios.post(
    `${CLIENT_URL}/token/introspect`,
    `client_id=frontend-app&client_secret=spxkUSHmR4D3955m1E6asFBVD0pMi0mU&token=${token}`,
    {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Accept": '*/*',
        "Accept-Encoding": 'gzip, deflate, br',
        "Connection": 'keep-alive',
        // 'Authorization': `Bearer ${token}`
      },
    }
  );

  return response;

  // return response;

  // curl -X POST \
  // http://keycloak-server/auth/realms/{realm-name}/protocol/openid-connect/token/introspect \
  // -H 'Content-Type: application/x-www-form-urlencoded' \
  // -d 'token={your-access-token}&client_id={your-client-id}&client_secret={your-client-secret}'

  // const clientId = 'frontend-app';
  //   const redirectUri = 'http://localhost:3000/callback'; // Adjust to your actual redirect URI
  //   const responseType = 'code';
  //   const scope = 'openid profile email';

  //   // Construct the authentication URL
  //   const authUrl = `http://localhost:8182/auth/realms/E-Shop/protocol/openid-connect/auth?client_id=${clientId}&redirect_uri=${redirectUri}&response_type=${responseType}&scope=${scope}`;
  // return response

  // var myHeaders = new Headers();
  // myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
  
  // var urlencoded = new URLSearchParams();
  // urlencoded.append("token", token);
  // urlencoded.append("client_id", "frontend-app");
  // urlencoded.append("client_secret", "spxkUSHmR4D3955m1E6asFBVD0pMi0mU");
  
  // var requestOptions = {
  //   method: 'POST',
  //   headers: myHeaders,
  //   body: urlencoded,
  // };
  
  // return await fetch("http://localhost:8182/auth/realms/e-shop/protocol/openid-connect/token/introspect", requestOptions);
      
};

export { loginRequest, logoutRequest, registerRequest, introspectRequest };