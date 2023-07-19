<%-- 
    Document   : userProfileMembership
    Created on : Jul 17, 2023, 7:14:38 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>User profile</title>
        <link rel="stylesheet" href="../Asset/css/clientHeader.css">
        <link rel="stylesheet" href="../Asset/css/clientFooter.css">
        <link rel="stylesheet" href="../Asset/css/common.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        
        <style>
            .banner{
               padding: 12% 20px 10% 20px;
               width: 100%;
               text-align: center;
               background: url(../Asset/img/bg/page-title-1.png) top center / cover no-repeat;
           }
           .banner h2{
               color: #227179;
               font-size: 3.3vw;
           }
           .container{
               max-width: 1320px;
               margin: 0 auto;
               padding: 50px;
               width: 1220px;
           }
           .user2{
               display: flex;
               align-items: center;
           }
           .user-img{
               max-width: 120px;
               max-height: 120px;
               min-width: 120px;
               min-height: 120px;
               overflow: hidden;
               border-radius: 50%;
               display: flex;
               justify-content: center;
               align-items: center;
              border: 1px solid #4444;
              margin-right: 24px;
           }

           .user-container{
               margin-top: 64px;
               display: flex;
           }
           .user-nav{
               list-style: none;
               display: flex;
               flex-direction: column;
               gap: 2px;
               box-shadow: 0 5px 25px rgba(0,0,0,0.15);
               width: 250px;
               height: fit-content;
           }
           .user-nav li{
               background-color: #f5f5f5;
               cursor: pointer;
           }
           .user-nav li.active,.user-nav li:hover{
               background-color: #fbfbfb;
           }
           .user-nav li.active a{
               color: #3dbca8;
           }

           .user-nav a{
               text-decoration: none;
               color: #6a6a6a;
               line-height: 50px;
               margin-left: 16px;
               display: block;
           }
           .user-nav a i{
               margin-right: 16px;
           }
           .user-content{
               padding: 0 50px;
               flex: 1;
           }
           .membership-title{
               color: #545454;
           }
           .membership-container{
               list-style: none;
               display: flex;
               flex-direction: column;
               gap: 20px;
               margin-top: 24px;    
           }
           
           .membership-container li{
               background: #6a6a6a29;
               padding: 12px 4px;
           }
           .membership-container span{
               font-weight: 600;
               color: #545454;
           }
           @media screen and (max-width:740px) {


               .container{
                   padding: 50px 20px;
                   max-width: 100%;
               }
               .banner h2{
                   font-size: 9vw;
               }
               .user-container{
                   flex-direction: column;
               }
               .user-nav{
                   flex-direction: row;
                   width: fit-content;
               }
               .user-nav li{
                   width: fit-content;
                   display: flex;
                   height: fit-content;
               }
               .user-nav a{
                   margin-left: 0; 
                   text-align: center; 
               }
               .user-nav a i{
                   margin-right: 0;
               }
               .user-content{
                   padding: 0;
               }
            
           }
        </style>
    </head>
    <body>
        <%@include file="../Component/header.jsp" %> 
        <div class="banner">
            <h2>Your Profile</h2>
        </div>
        <div class="container">
            <c:if test="${sessionScope.account!=null}">
                <div class="user2">
                    <div class="user-img img-square-container"><img src="../Asset/img/avatar/${sessionScope.account.img}" alt=""></div>
                    <h2>${sessionScope.account.name}</h2>
                </div>
            </c:if>
            <div class="user-container">
                <ul class="user-nav">
                    <li ><a href="course"><i class="fa fa-book" aria-hidden="true"></i> Course</a></li>
                    <li><a href="wishlist"><i class="fa fa-heart" aria-hidden="true"></i> Wishlist</a></li>
                    <li><a href="setting"><i class="fa fa-sliders" aria-hidden="true"></i> Setting</a></li>
                    <li><a href="booking"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Booking</a></li>
                    <li class="active"><a href="membership"><i class="fa-solid fa-medal"></i> Membership </a></li>
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                </ul>
                <div class="user-content">
                    <div class="display-course-content">
                        <h2 class="membership-title" >Your membership</h2>
                        <c:if test="${rmembership==null}">
                            <ul class="membership-container">
                                <li><span>Member Level: </span> Default</li>
                                <li><span>Member discount: </span> 0%</li>
                            </ul>
                        </c:if>
                        <c:if test="${rmembership!=null}">
                            <ul class="membership-container">
                                <li><span>Member Level: </span>${rmembership.membership.name}</li>
                                <li><span>Member discount: </span>${rmembership.membership.discount}%</li>
                                <li><span>Registration Date: </span>${rmembership.registrationDate}</li>
                                <li><span>Days left:</span> ${daysleft} days</li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
