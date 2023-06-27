<%-- 
    Document   : courseList
    Created on : Jun 18, 2023, 5:12:14 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.repository.RatingCourseRepository" %>
<%@page import="com.yowu.yogacenter.repository.RegistrationCourseRepository" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Course list</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientHeader.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientFooter.css">
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
            /*card*/

            .course-list{
                display: flex;
                flex-wrap: wrap;
                gap: 24px;
                padding: 32px;
               
            }

            .course-card{
                width: calc(100% / 4);
                transition: all ease-in-out .3s;
                box-shadow: 0 0 15px rgba(0,0,0,0.15);
                min-width: 300px;
                cursor: pointer;
            }
            .course-card:hover{
                transform: translateY(-10px);
                box-shadow: 0 0 25px rgba(0,0,0,0.35);
            }
            .card-img{
                max-height: 200px;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .card-img img{
                max-width: 100%;
            }

            .card-body{
                padding: 12px 20px;
            }
            .card-body>div:first-child{
                display: flex;
                justify-content: space-between;
            }
            .card-body>div:first-child p{
                color: #3dbca8;
            }
            .card-stars{
                font-size: 12px;
                color: #3dbca8;
            }
            .card-body a{
                font-size: 20px;
                color: #545454;
                margin: 8px 0;
                text-decoration: none;
                font-weight: 600;
            } 
            .card-footer{
                padding: 20px;
                border-top: 1px solid #e6e6e6;
            }
            .card-price{
                font-size: 20px;
                color: #5e5e5e;
                margin-bottom: 8px;
            }
            .card-student{
                color: #a2a2a2;
                font-size: 14px;
            }
            @media screen and (max-width:740px){
                
                .course-card{
                    width: 100%;
                }
                .course-section h2{
                    font-size: 24px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <%
            request.setAttribute("rcRepo",new RegistrationCourseRepository());
            request.setAttribute("rcr",new RatingCourseRepository());
        %>
        <div class="banner">
            <h2>Our Courses</h2>
        </div>
        <div class="course-list"> <!-- list  course here -->
            <c:if test="${courseList!=null&&courseList.size() gt 0}">
                <c:forEach items="${courseList}" var="course">
                    <div onclick="goto('course-detail?id=${course.id}')" class="course-card">
                        <div class="card-img">
                            <img src="Asset/img/classes/${course.img}" alt="">
                        </div>
                        <div class="card-body">
                            <div>
                                <p>${course.category.name}</p> <!--replace category for card -->
                                <div class="card-stars">
                                    <i class=""></i>
                                    <i class=""></i>
                                    <i class=""></i>
                                    <i class=""></i>
                                    <i class=""></i>
                                </div>
                                <div class="agv-star-value" style="display: none;" >${rcr.getAvgCourseRating(course.id)}</div><!-- replace star for  card-->
                            </div>
                            <a>${course.title}</a><!--replace title for  card-->
                        </div>
                        <div class="card-footer">
                            <p class="card-price"><c:if test="${course.price>0}">$${course.price}</c:if><c:if test="${course.price<=0}">Free</c:if></p>
                            <p class="card-student"><i class="fa fa-users" aria-hidden="true"></i> ${rcRepo.getStudentEnrolled(course.id)} Student Enrolled </p>
                        </div>
                    </div>
                </c:forEach> 
            </c:if>
             
        </div>
        
        <script defer>
            const surgestCards = document.querySelectorAll(".course-card");
            surgestCards.forEach(card =>{
                let sgCardStars = card.querySelectorAll(".card-stars i");
                let avgSt = card.querySelector(".agv-star-value").textContent;
                sgCardStars.forEach(st =>{
                    if(avgSt>0){
                    st.classList.add("fa-solid");
                    if(avgSt<1){
                        st.classList.add("fa-star-half-stroke");
                    }else{
                        st.classList.add("fa-star");
                    } 
                    }else{
                        st.classList.add("fa-regular");
                        st.classList.add("fa-star");
                    }
                    avgSt-=1;
                });
            });
            function goto(url){
                window.window.location.href = "${pageContext.request.contextPath}/"+url;   
            }
        </script>
        <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
