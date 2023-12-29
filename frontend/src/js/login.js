function decodeJwt(jwtToken) {
    const base64Url = jwtToken.split('.')[1]; // Get the payload part of the JWT
    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/'); // Replace Base64 URL encoding characters
    const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
      return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join('')); // Decode Base64 and handle URI component encoding
  
    return JSON.parse(jsonPayload);
  }
  
  //Login User
  
  async function Login(e){
    //prevent reload page onsubmit
    e.preventDefault()
    //get user username
    const getUsernameLogin = document.getElementById("login-username").value;
    //get user password
    const getPasswordLogin = document.getElementById("login-password").value;

    try {
      var myHeaders = new Headers();
      myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
  
      var urlencoded = new URLSearchParams();
      urlencoded.append("username", getUsernameLogin);
      urlencoded.append("password", getPasswordLogin);
      urlencoded.append("client_id", "frontend-app");
      urlencoded.append("client_secret", "spxkUSHmR4D3955m1E6asFBVD0pMi0mU");
      urlencoded.append("grant_type", "password");
  
      var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: urlencoded,
        redirect: 'follow'
      };
  
      const response = await fetch("http://localhost:8182/auth/realms/e-shop/protocol/openid-connect/token", requestOptions)
      
      if(response.ok){
        const login = await response.json()
        const token = login.access_token

        // console.log(JSON.stringify(login))
        
        //store in localstorage username, email, role (customer, seller) and refresh_token
        const decodeToken = await decodeJwt(token)

        // localStorage.setItem("email", decodeToken.email)
        localStorage.setItem("username", decodeToken.preferred_username)
        localStorage.setItem('access_token', token)
        localStorage.setItem('role', decodeToken.realm_access.roles[0])
        localStorage.setItem('refresh_token', login.refresh_token)

        // console.log(localStorage)
        //clear localStorage
        // localStorage.clear()

        location.href = "http://localhost:8000/"
      }else{
        const err = await response.json()
        console.log(err) 
      }
  
    } catch (error) {
      console.log(error)
    }
  }
  
  async function Register(e) {
    
    //prevent reload page onsubmit
    e.preventDefault()
  
    //from register form get all data for register a user
    const getUsername = document.getElementById("register-username").value;
    const getEmail = document.getElementById("register-email").value;
    const getPassword = document.getElementById("register-password").value;
    const getRole = document.getElementById("user-role").value;
  
    try {
      var myHeaders = new Headers();
      myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
  
      var urlencoded = new URLSearchParams();
      urlencoded.append("grant_type", "client_credentials");
      urlencoded.append("client_id", "admin-cli");
      urlencoded.append("client_secret", "BQdIipQduVxWBl7Nqw5Qq8fFXIOxa6zZ");
  
      var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: urlencoded,
        redirect: 'follow'
      };
  
      //get admin access token
      const first_response = await fetch("http://localhost:8182/auth/realms/master/protocol/openid-connect/token", requestOptions)
        
      if(first_response.ok){
        const adminAccessToken = await first_response.json();
        const token = adminAccessToken.access_token
  
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");
        myHeaders.append("Authorization", "Bearer "+token);

        var raw = JSON.stringify({
          "email": getEmail,
          "enabled": true,
          "username": getUsername,
          "attributes": {
            "client_id": "frontend-app"
          },
          "groups": [
            getRole
          ],
          "credentials": [
            {
              "type": "password",
              "value": getPassword,
              "temporary": false
            }
          ]
        });
  
        var registerOptions = {
          method: 'POST',
          headers: myHeaders,
          body: raw,
          redirect: 'follow'
        };
    
      const registerUser =  await fetch("http://localhost:8182/auth/admin/realms/e-shop/users", registerOptions)
        
        if(registerUser.ok){
          alert('register user is ok')
    
          setTimeout(()=>{
            window.location.href = "http://localhost:8000"
          },2000)
          
        }else{
          const err = await registerUser.json()
          console.log(err)
        }
  
      }else{
        const err = await first_response.json();
        console.log(err);
      }
      
    } catch (error) {
      console.log(error)
    }
  
  }

function SelectLogin() {
    const loginForm = document.getElementById("login-form");
    const registerForm = document.getElementById("register-form");

    loginForm.style.display = "block";
    registerForm.style.display = "none";
}

function SelectRegister() {
    const loginForm = document.getElementById("login-form");
    const registerForm = document.getElementById("register-form");

    loginForm.style.display = "none";
    registerForm.style.display = "block";
}