<%-- 
    Document   : courseList
    Created on : Jun 18, 2023, 5:12:14 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.repository.RegistrationCourseRepository" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course list</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            html{
                scroll-behavior: smooth; 
            }

            body{
                font-family: 'Jost', sans-serif;
                display: flex;
                flex-direction: column;
            }
            .banner{
                padding: 12% 20px 10% 20px;
                width: 100%;
                text-align: center;
                background: url( Asset/img/bg/page-title-1.png) top center / cover no-repeat;
            }
            .banner h2{
                color: #227179;
                font-size: 3.3vw;
            }
            .container-wrapper{
                padding: 32px 16px;
                display: grid;
                grid-template-columns: repeat(auto-fit,calc(100% / 4));
            }

            /*card*/

            .card img,.card{
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .card{
                flex-direction: column;
            }

            .card-img{
                max-width: 90%;
                z-index: 1;
                overflow: hidden;
                position: relative;
            }
            .card img{
                width: 100%;
                transition: transform .3s ease-in-out;
            }

            .card:hover.card-zoom img{
                transform: scale(1.2);
            }
            .card:hover .card-hide{
                opacity: 0.95;
            }
            .card-hide{
                z-index: 2;
                position: absolute;
                color: #547670;
                background-color: #f0f0f1;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                display: flex;
                justify-content: center;
                padding-left: 25%;
                flex-direction: column;
                font-size: 20px;
                line-height: 3;
                opacity: 0;
                transition: all ease-in-out .3s;
            }
            .card-body{
                transform: translateY(-30%);
                background-color: white;
                box-shadow: 0 5px 15px rgba(0, 0, 0,0.3);
                width: 80%;
                padding: 18px 32px;
                display: flex;
                flex-direction: column;
                align-items: start;
                z-index: 3;
            }
            .card-body p{
                color: #afafaf;
                font-size: 16px;
            }
            .card-body a{
                text-decoration: none;
                color: #227179;
                margin-top: 6px;
                font-size: 21px;
            }
            .card-body h3{
                font-size: 24px;
                margin-top: 8px;
                color: #404b48;
            }
            @media screen and (max-width:740px){
                
                .container-wrapper{
                    grid-template-columns: repeat(auto-fit,minmax(350px,1fr));
                }
            }
        </style>
    </head>
    <body>
        <%
            request.setAttribute("rcRepo",new RegistrationCourseRepository());
        %>
        <div class="banner">
            <h2>Our Courses</h2>
        </div>
        <ul class="container-wrapper">
            <c:forEach items="${courseList}" var="course">
                <li class="card card-zoom">
                    <div class="card-img">
                        <img src="Asset/img/classes/${course.img}" alt="img">
                        <div class="card-hide">
                            <p><i class="fa-solid fa-book"></i> ${course.duration} slots</p>
                            <p><i class="fa-solid fa-user-group"></i> ${rcRepo.getStudentEnrolled(course.id)} Student Enrolled</p>
                            <p><i class="fa-regular fa-lightbulb"></i>${course.category.name}</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <p>
                            with ${course.account.name}
                        </p>
                        <a href="#">${course.title}</a>
                        <h3><c:if test="${course.price>0}">$${course.price}</c:if><c:if test="${course.price<=0}">Free</c:if></h3>
                    </div>
                </li>
            </c:forEach>  
        </ul>
    </body>
</html>
