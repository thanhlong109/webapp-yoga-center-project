
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forget Password</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/font/css/all.css"/>
        <link rel="stylesheet" href="../Asset/css/login.css">
        <link rel="stylesheet" href="../Asset/css/clientHeader.css"/>
        <link rel="stylesheet" href="../Asset/css/clientFooter.css"/>
        <link rel="stylesheet" href="../Asset/css/common.css"/>
        <style>
            
        </style>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
            <div class="banner">
                <h2>Forget Passsword</h2>       
            </div>
            <div class="container-wrapper">
                <div class="container">
                    <form action="${pageContext.request.contextPath}/forgotPassword" method="POST">
                    <h2>Find your account</h2>               
                    <div>
                        <label>Enter your email address</label>
                        <c:if test="${sessionScope.account != null}" >
                            <input required type="email" name="txtEmail" value="${sessionScope.account.email}" readonly>
                        </c:if>
                        <c:if test="${sessionScope.account == null}" >
                            <input required type="email" name="txtEmail" placeholder="Enter Email">
                        </c:if>    
                        
                    </div>                             
                    <button class="btn" type="submit"> Get New Password </button> <br>
                    <a href="${pageContext.request.contextPath}/login">← Go back</a>
                </form>
            </div>
        </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>