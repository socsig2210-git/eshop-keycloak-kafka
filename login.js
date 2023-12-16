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