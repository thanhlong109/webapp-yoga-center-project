<%-- 
    Document   : getNewPassword
    Created on : Jul 5, 2023, 8:38:30 PM
    Author     : Chien Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Password</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/font/css/all.css"/>
        <link rel="stylesheet" href="Asset/css/login.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css"/>
        <link rel="stylesheet" href="Asset/css/clientFooter.css"/>
        <link rel="stylesheet" href="Asset/css/common.css"/>
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
            <div class="banner">
                <h2>Create New Password</h2>       
            </div>
            <div class="container-wrapper">
                <div class="container">
                    <form action="newPassword" method="POST">
                    <h2>Reset Password</h2>               
                    <div>
                        <label>Enter new password</label>
                        <input class="pass1" required type="password" name="password" placeholder="New Password" onchange="checkPass()" >
                        <label>Confirm new password</label>
                        <input class="pass2" required type="password" name="confPassword" placeholder="Confirm New Password" onchange="checkPass()" >
                         <p class="note-signup error">${errSignup}</p>
                    </div>
                    
                    <button id="btn2" class="btn" type="submit"> Get new Password </button> <br>
                    <c:if test="${sessionScope.account != null}">
                        <a href="${pageContext.request.contextPath}/">← Go back</a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <a href="${pageContext.request.contextPath}/login">← Go back</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/login">← Go back</a>
                </form>
            </div>
        </div>
                
                <script>
                    function checkPass() {
                var button = document.getElementById("btn2");
                var pass1 = document.querySelector(".pass1");
                var pass2 = document.querySelector(".pass2");
                if (pass1.value == pass2.value) {
                    pass1.classList.remove("input-wrong");
                    pass2.classList.remove("input-wrong");
                    document.querySelector(".note-signup").innerHTML = "";
                    btn2.disabled = false;
                } else {
                    pass1.classList.add("input-wrong");
                    pass2.classList.add("input-wrong");
                    document.querySelector(".note-signup").innerHTML = "Passwords don't match!";
                    btn2.disabled = true;
                }

            }
                </script>        
                
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>
