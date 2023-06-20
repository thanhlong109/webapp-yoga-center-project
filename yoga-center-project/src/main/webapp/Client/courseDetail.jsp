<%-- 
    Document   : courseDetail
    Created on : Jun 20, 2023, 8:29:23 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.yowu.yogacenter.repository.RatingCourseRepository" %>
<%@page import="com.yowu.yogacenter.repository.RegistrationCourseRepository" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                background: url(${pageContext.request.contextPath}/Asset/img/bg/page-title-1.png) top center / cover no-repeat;
            }
            .banner h2{
                color: #227179;
                font-size: 3.3vw;
            }
            .wrapper-container{
                max-width: 1320px;
                margin: 0 auto;
                padding: 50px 65px;
                background-color: white;
                transform: translateY(-50px);
            }
            .container{ 
                display: grid;
                grid-template-columns: 2fr 1fr;
                gap: 32px;
            }
            .text-style-light-green{
                font-size: 13px;
                text-transform: uppercase;
                color: #3dbca8;
                text-decoration: none;
            }
            .row1{
                display: flex;
                flex-wrap: wrap;
            }
            .row1>div{
                padding: 0 35px;
            }
            .row1>div h4{
                color: #a2a2a2;
                font-weight: 500;
            }
            .row1>div:not(.teacher){
                border-left: 1px solid #e6e6e6;
            }
            .teacher{
                display: flex;
                gap: 16px;
            }
            .teacher img{
                height: 45px;
                width: 45px;
                border-radius: 50%;
            }
            .stars i{
                font-size: 12px;
                color: #fc9d1d;
            }
            .avg-star{
                font-size: 12px;
            }

            /*row 2*/
            .row2{
                display: flex;
                gap: 32px;
                flex-direction: column;
                margin-top: 40px;
            }
            .row2 h2{
                font-size: 36px;
                color: #333333;
            }
            .row2 p{
                color: #5e5e5e;
                font-size: 18px;
            }
            .course-img{
                display: flex;
                justify-content: center;
            }
            .course-img img{
                max-width: 100%;
                max-height: 400px;
            }

            /*right container*/
            .right-container{
                border-left: 1px solid #e6e6e6;
                padding-left: 32px;
                display: flex;
                gap: 24px;
                flex-direction: column;
                padding-top: 32px;
                margin-top: 85px;
            }
            .right-box .label{
                font-size: 20px;
                color: #4b4b4b;
                margin-bottom: 8px;
            }
            .right-box .label-value{
                font-size: 18px;
                color: #547670;
                font-weight: 600;
            }
            .book-btn{
                text-decoration: none;
                font-size: 16px;
                padding: 12px 24px;
                border: 2px solid #3dbca8;
                color: #3dbca8;
                text-transform: uppercase;
                display: block;
                text-align: center;
                transition: all ease-in-out .3s;
            }
            .book-btn:hover{
                background-color: #3dbca8;
                color: white;
                border-radius: 24px;
            }
            /**/
            .surgest-course-section{
                margin-top: 64px;
            }
            .surgest-course-section h2{
                font-size: 29px;
                color: #227179;
                margin-bottom: 32px;
            }
            .surgest-list{
                display: flex;
                flex-wrap: wrap;
                gap: 24px;
            }

            .surgest-course-card{
                width: calc(100% / 4);
                transition: all ease-in-out .3s;
                box-shadow: 0 0 15px rgba(0,0,0,0.15);
                min-width: 250px;
                cursor: pointer;
            }
            .surgest-course-card:hover{
                transform: translateY(-10px);
                box-shadow: 0 0 25px rgba(0,0,0,0.35);
            }

            .surgest-card-img img{
                max-width: 100%;
            }

            .surgest-card-body{
                padding: 12px 20px;
            }
            .surgest-card-body>div:first-child{
                display: flex;
                justify-content: space-between;
            }
            .surgest-card-body>div:first-child p{
                color: #3dbca8;
            }
            .surgest-card-stars{
                font-size: 12px;
                color: #3dbca8;
            }
            .surgest-card-body a{
                font-size: 20px;
                color: #545454;
                margin: 8px 0;
                text-decoration: none;
                font-weight: 600;
            } 
            .surgest-card-footer{
                padding: 20px;
                border-top: 1px solid #e6e6e6;
            }
            .surgest-card-price{
                font-size: 20px;
                color: #5e5e5e;
                margin-bottom: 8px;
            }
            .surgest-card-student{
                color: #a2a2a2;
                font-size: 14px;
            }
            select.label-value{
                font-size: 14px !important;
                padding: 4px 8px;
                border: 1px solid #333;
            }
            .jstime{
                list-style: none;
            }
            .hover-poiter{
                
                cursor: pointer;
            }
            

            @media screen and (max-width:740px) {
                .wrapper-container{
                    padding: 40px 20px;
                    transform: translateY(0);
                }
                .banner{
                    padding: 15% 20px 10% 20px;
                }
                .banner h2{
                    font-size: 9vw;
                }
                .row1{
                    gap: 12px;
                    justify-content: space-between;
                }
                .row2 h2{
                    font-size: 24px;
                }
                .container{
                    grid-template-columns: 1fr;
                }
                .right-container{
                    margin-top: 0px;
                    padding: 0 10px;
                }
                .surgest-course-card{
                    width: 100%;
                }
                .surgest-course-section h2{
                    font-size: 24px;
                }
            }

        </style>
    
    </head>
    <body>
        <%@include file="../Component/header.jsp" %>
        <div class="banner">
            <h2>Yoga for Beginners Course</h2>
        </div>
        <div class="wrapper-container">
            <div class="row1">
                <div onclick='goto("teacher?id=1")'  class="teacher hover-poiter">
                    <div class="teacher-img">
                        <img src="${pageContext.request.contextPath}/Asset/img/avatar/${course.account.img}" alt=""> <!--replace Teacher img here-->
                    </div>
                    <div>
                        <h4>Teacher</h4>
                        <a href="#" class="text-style-light-green">${course.account.name}</a> <!--replace teacher name here-->
                    </div>
                </div>
                <div class="category">
                    <h4>Category</h4>
                    <a href="#" class="text-style-light-green">${course.category.name}</a> <!--replace category here-->
                </div>
                <div>
                    <h4>Review</h4>
                    <!--display star and avg , edit at javascrip-->
                    <div class="stars">
                        <i class=""></i>
                        <i class=""></i>
                        <i class=""></i>
                        <i class=""></i>
                        <i class=""></i>
                    </div>
                    <div class="avg-star"></div>
                </div>
                <div>
                    <!--wish list btn-->
                    <!--display this if course not in wish list-->
                    <a class="hover-poiter text-style-light-green jsWishlist ${isInWishList?"added":""}">${isInWishList?"<i class='fa fa-times'></i> Remove From Wishlist":"<i class='fa-regular fa-bookmark'></i> Add To Wishlist"}</a>
                    <!--else <a class="text-style-light-green" href="#link remove wishlist"><i class="fa-regular fa-bookmark"></i> remove Wishlist</a> -->
                </div>
            </div>
            <div class="container">
                <div class="left-container">
                    
                    <div class="row2">
                        <h2>${course.title}</h2> <!--replace Course title here-->
                        <p>${course.detail}</p> <!--Course description here-->

                        <div class="course-img">
                            <img src="${pageContext.request.contextPath}/Asset/img/classes/${course.img}" alt="">
                        </div>
                    </div>
                </div>
                <div class="right-container">
                    <div class="right-box">
                        <div class="label">Date</div>
                        <select class="label-value jsdate" onchange="loadTime(this)"></select>
<!--                        <div class="label-value jsdate"></div>replace date at java script-->
                    </div>
                    <div class="right-box">
                        <div class="label">Time</div>
                        <ul class="label-value jstime"></ul> <!--replace time here-->
                    </div>
                    <div class="right-box">
                        <div class="label">Duration</div>
                        <div class="label-value">${course.duration} slots</div> <!--replace duration here-->
                    </div>
                    <div class="right-box">
                        <div class="label">Price</div>
                        <div class="label-value"><c:if test="${course.price>0}">$${course.price}</c:if><c:if test="${course.price<=0}">Free</c:if></div> <!--replace price here-->
                    </div>
                    <a href="#" class="book-btn">Book now</a>
                </div>
            </div>
            
            <c:set var="ratingRepo" value="<%= new RatingCourseRepository()%>"/> 
            <c:set var="rcRepo" value="<%= new RegistrationCourseRepository()%>"/> 
            <div class="surgest-course-section">
                <h2>More courses you might like</h2>
                <div class="surgest-list"> <!-- list surgest course here -->
                    <c:forEach items="${surgestCourseList}" var="c">
                        <div onclick="goto('course-detail?id=${c.id}')" class="surgest-course-card">
                            <div class="surgest-card-img">
                                <img src="${pageContext.request.contextPath}/Asset/img/classes/${c.img}" alt="">
                            </div>
                            <div class="surgest-card-body">
                                <div>
                                    <p>${c.category.name}</p> <!--replace category for surgest card -->
                                    <div class="surgest-card-stars">
                                        <i class=""></i>
                                        <i class=""></i>
                                        <i class=""></i>
                                        <i class=""></i>
                                        <i class=""></i>
                                    </div>
                                    <div class="agv-star-value" style="display: none;" >${ratingRepo.getAvgCourseRating(c.id)}</div><!-- replace star for surgest card-->
                                </div>
                                <a>${c.title}</a><!--replace title for surgest card-->
                            </div>
                            <div class="surgest-card-footer">
                                <p class="surgest-card-price"><c:if test="${c.price>0}">$${c.price}</c:if><c:if test="${c.price<=0}">Free</c:if></p>
                                <p class="surgest-card-student"><i class="fa fa-users" aria-hidden="true"></i> ${rcRepo.getStudentEnrolled(c.id)} Student Enrolled </p>
                            </div>
                        </div>
                    </c:forEach>
                    
                </div>
            </div>
        </div>
        <%@include file="../Component/toast.jsp" %>                         
        <script defer>
            /*display star*/
            const stars = document.querySelectorAll(".stars i");
            const agvStar = document.querySelector(".avg-star");
            let avg = ${agvRating}; //replace avg star here
            agvStar.textContent = "("+avg + "/5)";
            stars.forEach(star =>{
                if(avg>0){
                    star.classList.add("fa-solid");
                    if(avg<1){
                        star.classList.add("fa-star-half-stroke");
                    }else{
                        star.classList.add("fa-star");
                    } 
                }else{
                    star.classList.add("fa-regular");
                    star.classList.add("fa-star");
                }
                avg-=1;
            });
            /*display date text*/
            const displayDate = document.querySelector(".jsdate");
            const displayTime = document.querySelector(".jstime");
            var dateData="";
            var timeData="";
            <c:forEach items="${courseScheduleList}" var="i">
                dateData+= "<option value='${i.id}' > ${i.dateToString()} </option>";
                timeData+="<li class='time-${i.id}' > ${i.startTime} - ${i.endTime}</li>";
            </c:forEach>
                displayDate.innerHTML =dateData;
                displayTime.innerHTML = timeData;
            loadTime($('.jsdate'));
            function loadTime(select){
                var id = $(select).val();
                $('.right-container li.time-'+id).show();
                $('.right-container li.time-'+id).siblings().hide();    
            }
            
            /*Display star for surgest card*/

            const surgestCards = document.querySelectorAll(".surgest-course-card");
            surgestCards.forEach(card =>{
                let sgCardStars = card.querySelectorAll(".surgest-card-stars i");
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
            
            $('.jsWishlist').click(()=>{
                if($('.jsWishlist').hasClass('added')){
                   $.ajax({
                        url:"course-detail?courseid="+${course.id}+"&action=remove",
                        type:"post",
                        success:function(data){
                            toast({
                                title:"Success!",
                                msg:"Remove success!",
                                type:'success',
                                duration:5000   
                            });
                            $('.jsWishlist').removeClass('added');
                            $('.jsWishlist').html('<i class="fa-regular fa-bookmark"></i> Add To WishList');
                        },
                        error: function(msg){
                            toast({
                                title:"Opps!",
                                msg:"Login to use this fuction!",
                                type:'error',
                                duration:5000   
                            });
                        }   
                    });
                }else{
                    
                   $.ajax({
                        url:"course-detail?courseid="+${course.id}+"&action=add",
                        type:"post",
                        success:function(data){
                            $('.jsWishlist').addClass('added');
                            $('.jsWishlist').html('<i class="fa fa-times" aria-hidden="true"></i> Remove From WishList');
                            toast({
                                title:"Success!",
                                msg:"Add success!",
                                type:'success',
                                duration:5000   
                            });
                        },
                        error: function(msg){
                            toast({
                                title:"Opps!",
                                msg:"Login to use this fuction!",
                                type:'error',
                                duration:5000   
                            });
                        }   
                    });
                }  
            }); 
        </script>
        <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
