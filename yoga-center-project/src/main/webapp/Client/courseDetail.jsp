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
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Course Detail</title>
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
                padding: 12% 20px 4% 20px;
                width: 100%;
                text-align: center;
                background: url(${pageContext.request.contextPath}/Asset/img/bg/page-title-1.png) top center / cover no-repeat;
            }
            .banner h2{
                color: #227179;
                font-size: 3.3vw;
            }
            .banner p{
                color: #547670;
                font-size: 24px;
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
            .teacher-img{
                height: 45px;
                width: 45px;
                max-width: 45px;
                border-radius: 50%;
            }
            .yellow-stars{
                font-size: 12px;
                color: #ffc107;
                line-height: 100%;
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
                width: calc(90% / 4);
                transition: all ease-in-out .3s;
                box-shadow: 0 0 15px rgba(0,0,0,0.15);
                min-width: 250px;
                cursor: pointer;
            }
            .surgest-course-card:hover{
                transform: translateY(-10px);
                box-shadow: 0 0 25px rgba(0,0,0,0.35);
            }

            .surgest-card-img{
                height: 160px;
                max-height: 160px;
                min-height: 160px;
                overflow: hidden;
                display: flex;
                align-items: center;
            }


            .surgest-card-img img{
                max-width: 100%;
            }

            .surgest-card-body{
                padding: 12px 20px;
                min-height: 140px;
            }
            .surgest-card-body>div:first-child{
                display: flex;
                justify-content: space-between;
            }
            .surgest-card-body>div:first-child p{
                color: #3dbca8;
            }
            .green-stars{
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
            /**/
            select.label-value{
                font-size: 14px !important;
                padding: 4px 8px;
                border: 1px solid #333;

            }

            .time-value {
                padding: 0px !important;
            }

            .jstime{
                list-style: none;
            }
            .hover-poiter{

                cursor: pointer;
            }

            .separate{
                border-bottom: 1px solid #d7d7d7;
                margin: 32px 0;
            }
            /*feedback*/
            .feedback-area{
                background-color: #e9ebee4d;
                padding: 8px 0px 32px 0px;
            }
            .feedback-area-title{
                color: #545454;
                font-weight: 600;
                font-size: 1.4em;
                padding-left: 12px;
                border-left: 10px solid #227179;
                line-height: 2.8;
            }

            .load-feedback{
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .user-feedback-item{
                display: flex;
                gap: 16px;
                padding: 16px 24px;
                background: #fff;
                border:1px solid #e6e6e6;
                border-radius: 10px;
                margin: 0 20px;
                transition: all ease-in-out .3s
            }
            .user-feedback-item:hover{
                background: #3dbca829;
            }
            .user-feedback-item .yellow-stars{
                font-size: 16px;
            }
            .user-feedback-avata{
                overflow: hidden;
                display: flex;
                justify-content: center;
                border-radius: 50%;
                border: 2px solid #e6e6e6;
                align-items: center;
                max-width: 85px;
                max-height: 85px;
                min-width: 85px;
                min-height: 85px;
                border-radius: 50%;
            }
            .user-feedback-avata img{
                width: 100%;
            }
            .feedback-info{
                flex:1;
            }
            .feedback-info>div{
                display: flex;
                justify-content: space-between;
                margin-bottom: 8px;
            }
            .user-feedback-name{
                font-size: 17px;
                color: #3dbca8;
                font-weight: 600;
            }
            .user-feedback-content{
                line-height: 1.7;
                color: #5e5e5e;
            }
            .feedback-btn-open{
                display: inline-block;
                margin: 20px 20px 0;
                padding: 10px 24px;
                background: #fff;
                border:1px solid #e6e6e6;
                border-radius: 10px;
                color: #3dbca8;
                cursor: pointer;
                font-weight: 600;
                transition: all ease-in-out .3s;
            }
            .feedback-btn-open:hover{
                background: #3dbca8;
                color: white;
            }


            .text-ellipsis {
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Limit the text to 3 lines */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; /* Add "..." at the end of the third line */
                white-space: normal;
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
                cursor: pointer;
                text-align: center;
            }
            .book-btn:hover{
                background-color: #3dbca8;
                color: white;
                border-radius: 24px;
            }
            .msg-green{
                padding: 12px 24px;
                background-color: white;
                border-radius: 24px;
                color: #3dbca8;
                text-transform:capitalize;
                display: block;
                font-weight: 600;
                border: 2px solid #3dbca8;
                text-align: center;
            }
            .msg-yellow{
                padding: 12px 24px;
                background-color: white;
                border-radius: 24px;
                color: rgb(255, 205, 86);
                text-transform:capitalize;
                display: block;
                font-weight: 600;
                border: 2px solid rgb(255, 205, 86);
                text-align: center;
            }

            /*rating*/
            .rating-box-wrapper{
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0,0,0,0.35);
                align-items: center;
                justify-content: center;
                display: none;
                animation: fadein2 ease-in-out .3s;
            }
            .rating-box{
                width: 400px;
                background-color: #fff;
                padding: 20px 40px;
                display: flex;
                flex-direction: column;
                gap: 16px;
                border-radius: 10px;
                position: relative;
            }
            .rating-title{
                font-size: 18px;
                color: #545454;
                font-weight: 600;
                text-transform: capitalize;
            }
            .rating-star{
                display: flex;
                gap: 16px;
                color: #e6e6e6;
                cursor: pointer;
                font-size: 32px;
                justify-content: space-around;
            }
            .rating-note{
                font-size: 20px;
                line-height: 1.7;
                text-align: center;
                color: #3dbca8;
            }
            .star-light{
                color: #ff9c1a;
                animation: fadein2 ease-in-out .3s;
            }
            .rating-feedback{
                padding: 15px;
                height: 59px;
                border-radius: 5px;
                outline: none;
                font-size: 16px;
                resize: none;
                max-height: 200px;
                border-color: #bfbfbf;
            }
            .rating-feedback::-webkit-scrollbar{
                display: none;
            }

            .rating-box button{
                padding: 12px 24px;
                width: fit-content;
                margin: 0 auto;
                border: 2px solid #3dbca8;
                background-color: #3dbca8;
                border-radius: 12px;
                color: white;
                font-weight: 600;
                cursor: pointer;
                box-shadow: 0 2px 8px rgba(0,0,0,.25);
                transition: all ease-in-out .3s;
            }
            .rating-box button:hover{
                background-color: #fff;
                color: #3dbca8;
            }
            .rating-close{
                position: absolute;
                top:20px;
                right: 20px;
                color: #545454;
                font-size: 24px;
                cursor: pointer;
            }
            .rating-close:hover{
                color: #e53f4f;
            }

            @keyframes fadein2{
                from{
                    opacity: 0;
                }
                to{
                    opacity: 1;
                }
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
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <div class="banner">
            <h2>${course.title}</h2>
        </div>
        <div class="wrapper-container">
            <div class="row1">
                <div onclick='goto("instructor?id=${course.account.id}")'  class="teacher hover-poiter">
                    <div class="img-square-container teacher-img">
                        <img src="${pageContext.request.contextPath}/Asset/img/avatar/${course.account.img}" alt="#"> <!--replace Teacher img here-->
                    </div>
                    <div>
                        <h4>Teacher</h4>
                        <a class="text-style-light-green">${course.account.name}</a> <!--replace teacher name here-->
                    </div>
                </div>
                <div class="category">
                    <h4>Category</h4>
                    <a href="course-filter?categoryid=${course.category.id}" class="text-style-light-green">${course.category.name}</a> <!--replace category here-->
                </div>
                <div>
                    <h4>Review</h4>
                    <!--display star and avg , edit at javascrip-->
                    <div data-avg="${agvRating}" class="yellow-stars stars">
                        <i class=""></i>
                        <i class=""></i>
                        <i class=""></i>
                        <i class=""></i>
                        <i class=""></i>
                    </div>
                    <div class="avg-star">( ${agvRating}/5 )</div>
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
                    <div class="separate"></div>
                    <!<!-- ----------------------------------- Feedback -------------------------------- -->
                    <c:if test="${feedbackList!=null || allowRating}">
                        <div class="feedback-area">
                            <h2 class="feedback-area-title">Feedback (${feedbackList.size()})</h2>
                            <div class="load-feedback">
                                <c:forEach items="${feedbackList}" var="feedbackItem">
                                    <c:set var="feedbackAcc" value="${feedbackItem.registrationCourse.account}"/>
                                    <div class="user-feedback-item">
                                        <div class="user-feedback-avata img-square-container">
                                            <img src="${pageContext.request.contextPath}/Asset/img/avatar/${feedbackAcc.img}" alt="avatar.img">
                                        </div>
                                        <div class="feedback-info">
                                            <div>
                                                <h4 class="user-feedback-name">${feedbackAcc.name}</h4>
                                                <div data-avg="${feedbackItem.ratingStar}" class="yellow-stars stars">
                                                    <i class=""></i>
                                                    <i class=""></i>
                                                    <i class=""></i>
                                                    <i class=""></i>
                                                    <i class=""></i>
                                                </div>
                                            </div>
                                            <p class="user-feedback-content text">
                                                ${feedbackItem.feedback}
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <c:if test="${allowRating}">
                                <span class="feedback-btn-open">Post Your Feedback</span>
                            </c:if>
                        </div>
                    </c:if>
                </div>
                <div class="right-container">
                    <div class="right-box">
                        <div class="label">Date</div>
                        <select id="dateSD" class="label-value jsdate" onchange="loadTime(this)"></select>
                    </div>
                    <div class="right-box">
                        <div class="label " >Choose start date</div>
                        <input id="datepicker" type="text" width="276"/>
                    </div>
                    <div id="date-error-message" style="display: none;"></div>
                    <div class="right-box">
                        <div class="label">Time</div>
                        <ul class="label-value time-value jstime" style=" padding: 0px"></ul> <!--replace time here-->
                    </div>
                    <div class="right-box">
                        <div class="label">Duration</div>
                        <div class="label-value">${course.duration} slots</div> <!--replace duration here-->
                        <input id="duration" value="${course.duration}" type="hidden" required>
                    </div>
                    <div class="right-box">
                        <div class="label">Price</div>
                        <div class="label-value">
                            <c:if test="${course.price>0}">$${course.price}</c:if>
                            <c:if test="${course.price<=0}">Free</c:if>
                            </div> <!--replace price here-->
                        </div>
                    <c:if test="${sessionScope.account == null}">
                        <c:if test="${course.price>0}">
                            <a class="book-btn" onclick="gotoCheckout('Checkout?id=${course.id}&action=course')" >
                                Purchase
                            </a>
                        </c:if>   
                        <c:if test="${course.price<=0}">
                            <a class="book-btn" onclick="gotoCheckout('Checkout?id=${course.id}&action=course')" >
                                Errol
                            </a>
                        </c:if>
                    </c:if>

                    <c:if test="${sessionScope.account != null && allowBook}">
                        <c:if test="${course.price>0}">
                            <a class="book-btn" onclick="gotoCheckout('Checkout?id=${course.id}&action=course')" >
                                Purchase
                            </a>
                        </c:if>   
                        <c:if test="${course.price<=0}">
                            <a class="book-btn" onclick="gotoCheckout('Checkout?id=${course.id}&action=course')" >
                                Errol
                            </a>
                        </c:if>

                    </c:if>
                    <c:if test="${sessionScope.account != null  && !allowBook && billStatus ==0}">
                        <p class="msg-green">You have joined the course</p> 
                    </c:if>
                    <c:if test="${sessionScope.account != null  && !allowBook && billStatus == 1}">
                        <a class="book-btn" onclick="gotoCheckout('Checkout?id=${course.id}&action=course')" >
                            Purchase
                        </a>
                    </c:if>

                    <c:if test="${sessionScope.account != null  && billStatus == 2}">
                        <p class="msg-yellow">Waiting for payment</p> 
                    </c:if>
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
                                    <div data-avg="${ratingRepo.getAvgCourseRating(c.id)}" class="green-stars stars">
                                        <i class=""></i>
                                        <i class=""></i>
                                        <i class=""></i>
                                        <i class=""></i>
                                        <i class=""></i>
                                    </div>
                                </div>
                                <a class="text-ellipsis">${c.title}</a><!--replace title for surgest card-->
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
        <div class="rating-box-wrapper">
            <form action="course-detail" method="post" class="rating-box">
                <i class="fa-regular fa-circle-xmark rating-close"></i>
                <p class="rating-title">how was your experience?</p>
                <div class="rating-star">
                    <i class="fas-sharp fa-solid fa-star"></i>
                    <i class="fas-sharp fa-solid fa-star"></i>
                    <i class="fas-sharp fa-solid fa-star"></i>
                    <i class="fas-sharp fa-solid fa-star"></i>
                    <i class="fas-sharp fa-solid fa-star"></i>
                </div>
                <input id="starPoint" type="hidden" name="star" value="0"/>
                <div class="rating-note"></div>
                <textarea required name="feedback" class="rating-feedback" placeholder="Describe your experience.."></textarea>
                <button>POST</button>
            </form>
        </div>
        <%@include file="../Component/toast.jsp" %> 
        <script defer>
            <c:if test="${checkDup != null}">
            toast({
                title: "Opps!",
                msg: "${checkDup}",
                type: 'warning',
                duration: 7000
            });
            </c:if>
            <% 
            request.removeAttribute("checkDup");
            %>
            /*rating stars*/
            const ratingStarList = $('.rating-star i');
            const ratingFeedback = document.querySelector('.rating-feedback');

            $('.rating-feedback').keyup(function (e) {
                $(this).css('height', '59px');
                let scHeight = e.target.scrollHeight;
                $(this).css('height', scHeight + 'px');
            });
            var ratingList = $('.rating-star i');
            let valueStar = 0;
            ratingList.each(function () {
                $(this).click(function () {
                    for (let i = 0; i < ratingList.length; i++) {
                        if (i <= $(this).index()) {
                            $(ratingList[i]).addClass('star-light');
                        } else {
                            $(ratingList[i]).removeClass('star-light');
                        }
                    }
                    let text = "";
                    valueStar = $(this).index();
                    switch (valueStar) {
                        case 0:
                        {
                            text = 'I just hate it <i class="fa-solid fa-face-angry"></i>';
                            break;
                        }
                        case 1:
                        {
                            text = "I don't like it <i class='fa-solid fa-face-frown'></i>";
                            break;
                        }
                        case 2:
                        {
                            text = 'It ok <i class="fa-solid fa-face-smile"></i>';
                            break;
                        }
                        case 3:
                        {
                            text = 'It is awesome <i class="fa-solid fa-face-laugh-beam"></i>';
                            break;
                        }
                        case 4:
                        {
                            text = 'I just love it <i class="fa-solid fa-face-laugh-squint"></i>';
                            break;
                        }
                    }
                    $('.rating-note').html(text);
                    $('#starPoint').val(valueStar + 1);
                });
            });
            /*validate and post form rating*/
            <c:if test="${allowRating}">
            $('.rating-box').on("submit", function (e) {
                e.preventDefault();
                if ($('#starPoint').val() === '0') {
                    toast({
                        title: "Opps!",
                        msg: 'Please rate us by click on star <i class="fa-solid fa-face-laugh-squint"></i>!',
                        type: 'warning',
                        duration: 5000
                    });
                } else if ($('.rating-feedback').val().length > 50) {
                    toast({
                        title: "Opps!",
                        msg: "Your feedback too long, please lest than 50 charactors!",
                        type: 'warning',
                        duration: 5000
                    });
                } else {
                    $.ajax({
                        type: "POST",
                        cache: false,
                        url: $(this).attr('action'),
                        data: "action=rating&courseid=${course.id}&" + $(this).serialize(),
                        success: function (data) {
                            let rateUi = '<div class="user-feedback-item">' +
                                    '<div class="user-feedback-avata img-square-container">' +
                                    '<img src="${pageContext.request.contextPath}/Asset/img/avatar/${sessionScope.account.img}" alt="avatar.img">' +
                                    '</div>' +
                                    '<div class="feedback-info">' +
                                    '<div>' +
                                    '<h4 class="user-feedback-name">${sessionScope.account.name}</h4>' +
                                    '<div data-avg="' + (valueStar + 1) + '" class="yellow-stars stars">' +
                                    '<i class=""></i>' +
                                    '<i class=""></i>' +
                                    '<i class=""></i>' +
                                    '<i class=""></i>' +
                                    '<i class=""></i>' +
                                    '</div>' +
                                    '</div>' +
                                    '<p class="user-feedback-content text">' + $('.rating-feedback').val() + '</p>' +
                                    '</div>' +
                                    '</div>';
                            $('.load-feedback').append(rateUi);
                            displayStars();
                            toast({
                                title: "Success!",
                                msg: "Thanks for your feedback!",
                                type: 'success',
                                duration: 5000
                            });
                            $('.feedback-btn-open').hide();
                        },
                        error: function (msg) {

                        }
                    });
                    $('.rating-box-wrapper').hide();
                }
            });
            /*close form*/
            $('.rating-close').click(function () {
                $('.rating-box-wrapper').hide();
            });
            /*open form*/
            $('.feedback-btn-open').click(function () {
                $('.rating-box-wrapper').css('display', 'flex');
            });
            </c:if>
        </script>
        <script>
            var dateSelect = [];
            var date = new Date();
            var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
            $('#datepicker').datepicker({
                uiLibrary: 'bootstrap5',
                format: 'yyyy-mm-dd',
                minDate: today,
                disableDates: function (date) {
                    const dayOfWeek = date.getDay();
                    return dateSelect.includes(dayOfWeek);
                }
            });

            document.getElementById("datepicker").required = true;
        </script>
        <script defer>
            /*display star*/
            displayStars();
            function displayStars() {
                const starsParents = document.querySelectorAll(".stars");
                starsParents.forEach(sp => {
                    let stars = sp.querySelectorAll(".stars i");
                    var avg = $(sp).data('avg');
                    stars.forEach(star => {
                        if (avg > 0) {
                            star.classList.add("fa-solid");
                            if (avg < 1) {
                                star.classList.add("fa-star-half-stroke");
                            } else {
                                star.classList.add("fa-star");
                            }
                        } else {
                            star.classList.add("fa-regular");
                            star.classList.add("fa-star");
                        }
                        avg -= 1;
                    });
                });
            }
            /*display date text*/
            const displayDate = document.querySelector(".jsdate");
            const displayTime = document.querySelector(".jstime");
            var dateData = "";
            var timeData = "";
            <c:forEach items="${courseScheduleList}" var="i">
            dateData += "<option data-cId='${i.dateOfWeek}' value='${i.id}' > ${i.dateToString()} </option>";
            timeData += "<li class='time-${i.id}' > ${i.startTime} - ${i.endTime}</li>";
            </c:forEach>
            displayDate.innerHTML = dateData;
            displayTime.innerHTML = timeData;
            loadTime($('.jsdate'));
            function loadTime(select) {
                var id = $(select).val();
                var datePick = $('.jsdate').find(':selected').attr('data-cId');
                var parseDate = datePick.split(",");
                dateSelect = [];
                parseDate.forEach(i => {
                    var j = parseInt(i);
                    if (j < 6) {
                        j = j + 1;
                    } else {
                        j = 0;
                    }
                    dateSelect.push(j);
                });

                console.log(dateSelect);
                $('.right-container li.time-' + id).show();
                $('.right-container li.time-' + id).siblings().hide();
            }
            function goto(url) {
                window.location.href = "${pageContext.request.contextPath}/" + url;
            }

            function gotoCheckout(url) {
                var course_scheduleId = $('#dateSD').val();
                var duration = $('#duration').val();
                var start_Time = $('#datepicker').val();

                if (!start_Time) {
                    $('#date-error-message').text('Please choose a start date !!!');
                    $('#date-error-message').css('color', 'red');
                    $('#date-error-message').show();

                    setTimeout(function () {
                        $('#date-error-message').hide();
                    }, 5000);

                    return;
                }

                // Các mã khác trong hàm gotoCheckout...

                // Xóa thông báo nếu đã chọn ngày
                $('#date-error-message').text('');
                $('#date-error-message').hide();

                window.location.href = "${pageContext.request.contextPath}/" + url + "&course_scheduleId=" + course_scheduleId + "&duration=" + duration + "&start_time=" + start_Time;
            }



            $('.jsWishlist').click(() => {
                if ($('.jsWishlist').hasClass('added')) {
                    $.ajax({
                        url: "course-detail?courseid=" +${course.id} + "&action=remove",
                        type: "post",
                        success: function (data) {
                            if (data == "account-failed") {
                                toast({
                                    title: "Opps!",
                                    msg: "Login to use this fuction!",
                                    type: 'error',
                                    duration: 5000
                                });
                            } else {
                                toast({
                                    title: "Success!",
                                    msg: "Remove success!",
                                    type: 'success',
                                    duration: 5000
                                });
                                $('.jsWishlist').removeClass('added');
                                $('.jsWishlist').html('<i class="fa-regular fa-bookmark"></i> Add To WishList');
                            }
                        },
                        error: function (msg) {
                            toast({
                                title: "Opps!",
                                msg: "Login to use this fuction!",
                                type: 'error',
                                duration: 5000
                            });
                        }
                    });
                } else {

                    $.ajax({
                        url: "course-detail?courseid=" +${course.id} + "&action=add",
                        type: "post",
                        success: function (data) {
                            if (data == "account-failed") {
                                toast({
                                    title: "Opps!",
                                    msg: "Login to use this fuction!",
                                    type: 'error',
                                    duration: 5000
                                });
                            } else {
                                $('.jsWishlist').addClass('added');
                                $('.jsWishlist').html('<i class="fa fa-times" aria-hidden="true"></i> Remove From WishList');
                                toast({
                                    title: "Success!",
                                    msg: "Add success!",
                                    type: 'success',
                                    duration: 5000
                                });
                            }
                        },
                        error: function (msg) {
                            toast({
                                title: "Opps!",
                                msg: "Login to add wishlist!",
                                type: 'error',
                                duration: 5000
                            });
                        }
                    });
                }
            });
        </script>
        <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
