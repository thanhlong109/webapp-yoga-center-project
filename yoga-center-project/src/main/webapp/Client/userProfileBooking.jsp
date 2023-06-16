<%-- 
    Document   : userProfileSetting
    Created on : Jun 16, 2023, 9:08:04 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
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
               padding: 50px 30px;
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
           .user-img img{
               width: 100%;
               max-height: 150px ;
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
           }
           .user-nav a i{
               margin-right: 16px;
           }
           .user-content{
               padding: 0 50px;
           }
           .filter-course{
               list-style: none;
               display: flex;
               gap:16px;
           }
           .filter-course>li{
               padding: 0px 4px;
               color: #696969;
               font-weight: 600;
               cursor: pointer;
           }
           .filter-course>li.active{
               border-bottom: 2px solid #3dbca8;
           }
           table{
               margin-top: 46px;
               border-collapse: collapse;
               border: 1px solid #e6e6e6;
               text-align: center;
           }
           th{
               color: #5e5e5e;
               background-color: #e6e6e6;
           }
           td,th{
               padding: 12px 24px;

           }
           .course-table img{
               max-width: 100px;
               max-height: 70px;
           }
           /**/
           .status{
               padding: 4px 8px;
               font-weight: 600;
               font-size: 14px;
               color: white;
           }
           .status-complete{
               background-color: #eabd53;
           }
           .status-pending{
               background-color: #b3b3b3;
           }
           .status-cancelled{
               background-color: #ea6553;
           }
           a+a{
               margin-left: 16px;
           }
           
           .view-bill{
                display: flex;
                flex-direction: column;
                gap: 16px;
            }
            .view-bill h3{
                color: #333;
            }
            .view-bill label{
                font-weight: 600;
                color: #333;
                margin-right: 8px;
            }
            .view-bill>div{
                padding: 12px 24px;
            }
            .view-bill>div:nth-child(even){
                background-color: #e6e6e6;
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
                   width: 100%;
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
               .display-course-content{
                   overflow-x: scroll;
                   max-width: 100%;
               }
               td,th{
                   padding: 8px 12px;
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
            <div class="user2">
                <div class="user-img"><img src="../Asset/img/avatar/hinh-avatar-1.png" alt="img"></div>
                <h2>Longn99955</h2>
            </div>
            <div class="user-container">
                <!-- Start navigation -->

                <ul class="user-nav">
                    <li><a href="course"><i class="fa fa-book" aria-hidden="true"></i> Course</a></li>
                    <li><a href="wishlist"><i class="fa fa-heart" aria-hidden="true"></i> Wishlist</a></li>
                    <li><a href="setting"><i class="fa fa-sliders" aria-hidden="true"></i> Setting</a></li>
                    <li class="active"  ><a href="booking"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Booking</a></li>
                    <li><a href="../logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                </ul>
                <!-- End navigation-->
                <div class="user-content">
                    <div class="course-option">
                        <div class="display-course-content">
                            <table class="course-table">
                                <tr>
                                    <th>ID</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Actions</th>
                                </tr>
                                <c:forEach items="${billList}" var="bill">
                                    <tr>
                                        <td>${bill.id}</td>
                                        <td>${bill.value}</td>
                                        <td><span class="status status-complete"></span></td>
                                        <td>2023-06-15</td>
                                        <td><a href="#">view</a></td>
                                    </tr>
                                </c:forEach>
                                    
                               
                                
                                <tr>
                                    <td>2</td>
                                    <td>$15</td>
                                    <td><span class="status status-pending">Pending</span></td>
                                    <td>2023-06-15</td>
                                    <td><a href="#">view</a> <a href="#">Cancel</a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>$15</td>
                                    <td><span class="status status-cancelled">Cancelled </span></td>
                                    <td>2023-06-15</td>
                                    <td><a href="#">view</a></td>
                                </tr>
                                <div class="view-bill">
                                    <h3>Order detail</h3>
                                    <div>
                                        <label>Bill ID:</label><span>#1</span>
                                    </div>
                                    <div>
                                        <label>Bill Status:</label><span>Cancelled</span>
                                    </div>
                                    <div>
                                        <label>Course:</label><span>yoga for beginer</span>
                                    </div>
                                    <div>
                                        <label>Total Price:</label><span>$21</span>
                                    </div>
                                    <div>
                                        <label>Date:</label><span>23/11/2023</span>
                                    </div>

                                </div>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
