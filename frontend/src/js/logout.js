async function Logout(e){
    //prevent reload page onsubmit
    e.preventDefault()

    try {
      var myHeaders = new Headers();
      myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
  
      var urlencoded = new URLSearchParams();
      urlencoded.append("refresh_token", localStorage.getItem('refresh_token'));
      urlencoded.append("client_id", "frontend-app");
      // urlencoded.append("client_secret", "6PP1lYj2D77DLWaiiiZCftP91QbRnBrX");
  
      var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: urlencoded,
        redirect: 'follow'
      };
  
      const response = await fetch("http://localhost:8182/auth/realms/e-shop/protocol/openid-connect/logout", requestOptions)
      
      if(response.ok){
        //clear localStorage
        localStorage.clear()

        // location.href = "http://localhost:8000/home.html"
      }else{
        const err = await response.json()
        console.log(err) 
      }
  
    } catch (error) {
      console.log(error)
    }
    // return false
}