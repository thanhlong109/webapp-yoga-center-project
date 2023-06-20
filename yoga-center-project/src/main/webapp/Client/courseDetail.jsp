<%-- 
    Document   : courseDetail
    Created on : Jun 20, 2023, 8:29:23 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .banner{
                padding: 12% 20px 10% 20px;
                width: 100%;
                text-align: center;
                background: url(../img/bg/page-title-1.png) top center / cover no-repeat;
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
            .row1>div:not(.row1>div:first-child){
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
                <div class="teacher">
                    <div class="teacher-img">
                        <img src="../img/icon/default-avata.png" alt=""> <!--replace Teacher img here-->
                    </div>
                    <div>
                        <h4>Teacher</h4>
                        <a href="#" class="text-style-light-green">JANE SMITH</a> <!--replace teacher name here-->
                    </div>
                </div>
                <div class="category">
                    <h4>Category</h4>
                    <a href="#" class="text-style-light-green">MEDITATION</a> <!--replace category here-->
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
                    <a class="text-style-light-green" href="#link add wishlist"><i class="fa-regular fa-bookmark"></i> Add Wishlist</a>
                    <!--else <a class="text-style-light-green" href="#link remove wishlist"><i class="fa-regular fa-bookmark"></i> remove Wishlist</a> -->
                </div>
            </div>
            <div class="container">
                <div class="left-container">

                    <div class="row2">
                        <h2>Yoga for Beginners Course</h2> <!--replace Course title here-->
                        <p>The practice of yoga has been thought to date back to pre-vedic Indian traditions; possibly in the Indus valley civilization around 3000 BCE. Yoga is mentioned in the Rigveda and referenced in the Upanishads,. Although, yoga most likely developed as a systematic study around the 5th centuries.</p> <!--Course description here-->

                        <div class="course-img">
                            <img src="../img/classes/shutterstock_1371365420-950x1075.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="right-container">
                    <div class="right-box">
                        <div class="label">Date</div>
                        <div class="label-value jsdate"></div><!--replace date at java script-->
                    </div>
                    <div class="right-box">
                        <div class="label">Time</div>
                        <div class="label-value">10:00 - 12:00</div> <!--replace time here-->
                    </div>
                    <div class="right-box">
                        <div class="label">Duration</div>
                        <div class="label-value">8 slots</div> <!--replace duration here-->
                    </div>
                    <div class="right-box">
                        <div class="label">Price</div>
                        <div class="label-value">$32</div> <!--replace price here-->
                    </div>
                    <a href="#" class="book-btn">Book now</a>
                </div>
            </div>
            <div class="surgest-course-section">
                <h2>More courses you might like</h2>
                <div class="surgest-list"> <!-- list surgest course here -->
                    <div class="surgest-course-card">
                        <div class="surgest-card-img">
                            <img src="../img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                        </div>
                        <div class="surgest-card-body">
                            <div>
                                <p>Meditation</p> <!--replace category for surgest card -->
                                <div class="surgest-card-stars">
                                    <i class=""></i>
                                    <i class=""></i>
                                    <i class=""></i>
                                    <i class=""></i>
                                    <i class=""></i>
                                </div>
                                <div class="agv-star-value" style="display: none;" >4.5</div><!-- replace star for surgest card-->
                            </div>
                            <a href="#">Yamas and Niyamas</a><!--replace title for surgest card-->
                        </div>
                        <div class="surgest-card-footer">
                            <p class="surgest-card-price">$32</p>
                            <p class="surgest-card-student"><i class="fa fa-users" aria-hidden="true"></i> 192 Student Enrolled </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script defer>
            /*display star*/
            const stars = document.querySelectorAll(".stars i");
            const agvStar = document.querySelector(".avg-star");
            let avg = 4.5; //replace avg star here
            agvStar.textContent = "("+avg + "/5)";
            stars.forEach(star =>{
                if(avg>0){
                    star.classList.add("fa-solid")
                    if(avg<1){
                        star.classList.add("fa-star-half-stroke")
                    }else{
                        star.classList.add("fa-star")
                    } 
                }else{
                    star.classList.add("fa-regular")
                    star.classList.add("fa-star")
                }
                avg-=1;
            })
            /*display date text*/
            const displayDate = document.querySelector(".jsdate");
            var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            var date = "0,2,4"; /*replace date of week here*/
            var day2s = date.split(',');
            var daysText = "";
            day2s.forEach(day =>{
                daysText +=days[day]+", "; 
            })
            displayDate.textContent = "Every "+daysText;

            /*Display star for surgest card*/

            const surgestCards = document.querySelectorAll(".surgest-course-card");
            surgestCards.forEach(card =>{
                let sgCardStars = card.querySelectorAll(".surgest-card-stars i");
                let avgSt = card.querySelector(".agv-star-value").textContent;
                sgCardStars.forEach(st =>{
                    if(avgSt>0){
                    st.classList.add("fa-solid")
                    if(avgSt<1){
                        st.classList.add("fa-star-half-stroke")
                    }else{
                        st.classList.add("fa-star")
                    } 
                    }else{
                        st.classList.add("fa-regular")
                        st.classList.add("fa-star")
                    }
                    avgSt-=1;
                })
            })

        </script>
        
        <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
