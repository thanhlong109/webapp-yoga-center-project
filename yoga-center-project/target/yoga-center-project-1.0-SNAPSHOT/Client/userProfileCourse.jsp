<%-- 
    Document   : userProfileCourse
    Created on : Jun 14, 2023, 10:03:15 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.model.RegistrationCourse" %>
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
           .filter-course{
               list-style: none;
               display: flex;
               gap:16px;
               margin-bottom: 32px;
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
               .display-course-content{
                   overflow-x: scroll;
                   max-width: 100%;
               }
               .filter-course{
                   margin-top: 64px;
               }
               td,th{
                   padding: 8px 12px;
               }
           }
            .noice-empty{
                display: flex;
                margin: auto;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                background-color: #e6e6e6;
                border-radius: 16px;
                padding: 34px 50px;
            }
            .noice-empty img{
                height: 75px;
                width: 75px;
            }
            .course-table tr:not(tr:nth-child(1)):hover{
                background-color: #ccc;
                cursor: pointer;
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
                <!-- Start navigation-->
                <ul class="user-nav">
                    <li class="active"><a href="course"><i class="fa fa-book" aria-hidden="true"></i> Course</a></li>
                    <li><a href="wishlist"><i class="fa fa-heart" aria-hidden="true"></i> Wishlist</a></li>
                    <li><a href="setting"><i class="fa fa-sliders" aria-hidden="true"></i> Setting</a></li>
                    <li><a href="booking"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Booking</a></li>
                    <li><a href="membership"><i class="fa-solid fa-medal"></i> Membership </a></li>
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                </ul>
                <!-- end navigation -->
                <div class="user-content">
                    <div class="course-option">
                        <!-- filter course -->
                        <ul class="filter-course">
                            <li value="<%= RegistrationCourse.CourseStatus.ALL.ordinal() %>" class="active">All</li>
                            <li value="<%= RegistrationCourse.CourseStatus.INPROGRESS.ordinal() %>">In Progress</li>
                            <li value="<%= RegistrationCourse.CourseStatus.FINISH.ordinal() %>">Finished</li>
                        </ul>
                        <c:if test="${listRegistrationCourse!=null && listRegistrationCourse.size() gt 0}">
                            <div class="display-course-content">
                                <table class="course-table">
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Registation Date</th>
                                        <th>End Date</th>
                                    </tr>
                                    <c:forEach items="${listRegistrationCourse}" var="rCourse">
                                        <tr onclick="goto('course-detail?id=${rCourse.course.id}')">
                                            <td><img src="../Asset/img/classes/${rCourse.course.img}" alt="img"></td>
                                            <td>${rCourse.course.title}</td>
                                            <td>${rCourse.registrationDate}</td>
                                            <td>${rCourse.endDate}</td>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </c:if>
                         <c:if test="${listRegistrationCourse==null || listRegistrationCourse.size() lt 1}">
                                <div class="noice-empty" style="margin-top: 20px">
                                    <img src="../Asset/img/icon/empty.png" alt="">
                                    <h4>Empty!</h4>
                                </div>
                            </c:if>
                        
                    </div>

                </div>

            </div>
        </div>
        <%@include file="../Component/footer.jsp" %> 
        <script>
            function goto(url){
                window.window.location.href = "${pageContext.request.contextPath}/"+url;   
            }
            
            $(document).ready(()=>{
               document.querySelectorAll(".filter-course li").forEach(f =>{
                $(f).click(()=>{
                    $(f).addClass('active');
                    $(f).siblings().removeClass('active');
                    $.ajax({
                        url:"course?status="+$(f).val(),
                        type:"get",
                        success:function(data){
                            $('.display-course-content').html(data);
                        },
                        error: function(msg){

                            console.log("ereor");
                        }   
                    });
                });
               });

            });
            
        </script>
    </body>
</html>
