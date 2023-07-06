<%-- 
    Document   : membership
    Created on : Jul 1, 2023, 9:59:48 PM
    Author     : Chien Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Membership</title>

        <!-- link CSS -->
        <link rel="stylesheet" href="Asset/css/membership.css">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientHeader.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientFooter.css">
        <style>
            .banner{
                margin-top: 80px
            }
            
            
        </style>
    </head>
    <body>
        <%@include file="../Component/header.jsp" %>
        <div class="banner-container">
            <div class="banner">
                <div class="banner__content">
                    <h1>Membership</h1>
                    <span>upto</span>
                    <h3>50% OFF</h3>
                    <p>offer end after 5 days</p>
                </div>
            </div>
        </div>
        <div class="container">
            <!-- silver -->
            <div class="box">
                <h3>Silver card</h3>
                <p class="price">$2.46 <small class="text-mute">/Month</small></p>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Using the most advanced equipment</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Course with 15% off</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Free drinking water</p>
                </div>
                <a href=""><button class="btn-silver">Buy Now</button></a>
                <span class="type">Silver</span>
            </div>
            <!-- gold -->
            <div class="box">
                <h3>Gold card</h3>
                <p  class="price">$5.5 <small class="text-mute">/Month</small></p>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Using the most advanced equipment</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Course with basic 20% off</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Free drinking water</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Course with advanced 10% off</p>
                </div>
                <a href=""><button class="btn-gold">Buy Now</button></a>
                <span class="type">Gold</span>
            </div>
            <!-- ruby -->
            <div class="box">
                <h3>Ruby card</h3>
                <p  class="price">$12.6 <small class="text-mute">/Month</small></p>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Using the most advanced equipment</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Course with basic 25% off</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Course with advanced 15% off</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>Free drinking water</p>
                </div>
                <div class="box__content">
                    <span class="material-symbols-sharp">verified</span>
                    <p>1 on 1 with trainer </p>
                </div>
                <a href=""><button>Buy Now</button></a>
                <span class="type">Ruby</span>
            </div>
        </div>
         <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
