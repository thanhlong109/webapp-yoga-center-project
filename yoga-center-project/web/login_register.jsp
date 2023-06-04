<%-- 
    Document   : login_register
    Created on : Jun 4, 2023, 11:45:21 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./Asset/css/font/css/all.css"/>
        <link rel="stylesheet" href="./Asset/css/login.css">
    </head>

    <div class="banner">
        <h2>Login Account</h2>
        <p>Register New Account</p>
    </div>
    <div class="container-wrapper">
        <div class="container">
            <form action="#">
                <h2>Register</h2>
                <div>
                    <label>Enter Username *</label>
                    <input required type="text" name="txtUsername" placeholder="Username">
                </div>
                <div>
                    <label>Enter Email *</label>
                    <input required type="text" name="txtEmail" placeholder="Email">
                </div>
                <div>
                    <label>Enter Phone Number *</label>
                    <input required type="text" name="txtPhone" placeholder="Phone number">
                </div>
                <div>
                    <label>Enter Password *</label>
                    <div class="pass">
                        <input required type="password" name="txtPassword" placeholder="Password">
                        <i class="fa-sharp fa-solid fa-eye"></i>  
                    </div>
                </div>
                <div>
                    <label>Confirm Password *</label>
                    <div class="pass">
                        <input required type="password" name="txtPassword" placeholder="Password">
                        <i class="fa-sharp fa-solid fa-eye"></i>  
                    </div>
                </div>
                <a class="btn" href="#">Register</a>
            </form>
            <form action="#">
                <h2>Login</h2>
                <div>
                    <label>Enter Username *</label>
                    <input required type="text" name="txtUsername" placeholder="Username">
                </div>
                <div>
                    <label>Enter Password *</label>
                    <div class="pass">
                        <input required type="password" name="txtPassword" placeholder="Password">
                        <i class="fa-sharp fa-solid fa-eye"></i> 
                    </div>
                </div>

                <a class="btn" href="#">Login</a><br>
                <a href="#">Forgot your password?</a>
            </form>
        </div>
    </div>
    <script defer>
        const passBoxs = document.querySelectorAll("form .pass");
        passBoxs.forEach(passBox => {
            let icon = passBox.querySelector("i");
            let input = passBox.querySelector("input");
            icon.addEventListener("click", () => {
                if (icon.classList.contains("fa-eye")) {
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                    input.setAttribute("type", "text");
                } else {
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                    input.setAttribute("type", "password");
                }

            });
        });
    </script>

</html>