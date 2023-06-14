
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
</head>
<body>
    <jsp:include page="../Component/header.jsp"></jsp:include>
    <div class="banner">
        <h2>Forget Passsword</h2>       
    </div>
    <div class="container-wrapper">
        <div class="container">
            <form action="#">
                <h2>Find Your Account</h2>               
                <div>
                    <label>Email address</label>
                    <input required type="text" name="txtEmail" placeholder="Email">
                </div>                             
                <a class="btn" href="#">Get New Password</a><br>
                <a href="#">← Go back</a>
            </form>
        </div>
    </div>
    <jsp:include page="../Component/footer.jsp"></jsp:include>
</body>
</html>