<%-- 
    Document   : Home
    Created on : Jun 3, 2023, 10:01:56 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.repository.RegistrationCourseRepository" %>
<%@page import="com.yowu.yogacenter.repository.CourseRepository" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Yowu Yoga Center</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="Asset/css/font/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/common.css">
        <link rel="stylesheet" href="Asset/css/clientHome.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css"/>
        <link rel="stylesheet" href="Asset/css/clientFooter.css"/>

    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
            <div class="banner">
                <div class="banner-content">
                    <h3>Yowu</h3>
                    <h2>Yoga Class</h2>
                    <p>
                        We are the most popular yoga studio in town. Rated by more than 1000+ customers. Our instructers are well-know and certified
                    </p>
                    <a href="#section2" class="btn btn-red-orange">
                        Browse Course
                    </a>
                    <a href="#section2" class="arrow">
                        <i class="fa-solid fa-arrow-down"></i>
                    </a>
                </div>
            </div>
            <!-- End banner -->

            <!-- Start section 1 -->
            <div class="section1">
                <div>
                    <div>
                        <img src="./Asset/img/icon/icon1-1.png" alt="">
                    </div>
                    <div>
                        <h2>Many Style</h2>
                        <p>
                            20+ Styles of Yoga Workout and Mediatation that suit everyone
                        </p>
                    </div>
                </div>
                <div>
                    <div>
                        <img src="./Asset/img/icon/icon2-1.png" alt="">
                    </div>
                    <div>
                        <h2>Pro Instructors</h2>
                        <p>
                            Professional Yoga Instructors from around the world
                        </p>
                    </div>
                </div>
                <div>
                    <div>
                        <img src="./Asset/img/icon/icon3.png" alt="">
                    </div>
                    <div>
                        <h2>Quality Conten</h2>
                        <p>
                            All Our Classes are Well Planned by Professional Yoga Instructors
                        </p>
                    </div>
                </div>
            </div>
            <!-- End section 1 -->

            <!-- Start section 2 - popular online classes -->
            <div id="section2" class="section">
                <h2 class="section-title">Popular Online Classes</h2>
                <p class="section-des">A meditative means of discovering dysfunctional perception and cognition, as well as overcoming it to release any suffering, find inner peace and salvation.</p>
            </div>
            <!-- End section 2 -->
            
            <!-- Start carourse -->
            <%
                request.setAttribute("rcRepo",new RegistrationCourseRepository());
                request.setAttribute("courseRepo",new CourseRepository());
            %>
            <div id="caroursel"  class="wrapper-caroursel">
                <i id="left" class="fa-solid fa-arrow-left"></i>
                <ul class="caroursel">
                    <c:forEach items="${popularList}" var="course">
                        <li class="card card-zoom">
                            <div class="card-img">
                                <img src="Asset/img/classes/${course.img}" alt="">
                                <div class="card-hide">
                                    <p><i class="fa-solid fa-book"></i> ${course.duration} Slot</p>
                                    <p><i class="fa-solid fa-user-group"></i> ${rcRepo.getStudentEnrolled(course.id)} Student Enrolled</p>
                                    <p><i class="fa-regular fa-lightbulb"></i> ${course.category.name}</p>
                                </div>
                            </div>
                            <div class="card-body">
                                <p>
                                    With ${course.account.name}
                                </p>
                                <a href="course-detail?id=${course.id}" class="text-ellipsis">${course.title}</a>
                                <h3><c:if test="${course.price>0}">$${course.price}</c:if><c:if test="${course.price<=0}">Free</c:if></h3>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <i id="right" class="fa-solid fa-arrow-right"></i>
            </div>
            <!-- End caroursel -->

            <!-- Start section 3 -->
            <div class="section3">
                <div>
                    <img src="Asset/img/about/hp1-about-image.png" alt="">
                </div>
                <div>
                    <h4>Our foundation is</h4>
                    <h2>Modern Yoga</h2>
                    <p>Modern postural yoga consists largely but not exclusively of the practice of asanas. There were very few standing asanas before 1900. By 2012, there were at least 19 widespread styles from Ashtanga Yoga to Viniyoga. These emphasise different aspects including aerobic exercise, precision in the asanas, and spirituality in the Haṭha yoga tradition. For example, Bikram Yoga has an aerobic exercise style with rooms heated to 105 °F</p>
                    <div>
                        <a href="#" class="btn btn-white-boder-green">Learn More</a>
                        <a href="#" class="btn btn-light-green">Our Story</a>
                    </div>
                </div>
            </div>
            <!-- End section 3 -->

            <!-- Start Section 4 -->
            <div class="section">
                <h2 class="section-title">
                    Our Instructors
                </h2>
                <p class="section-des">
                    a meditative means of discovering dysfunctional perception and cognotion, as well as overcoming it to release any suffering, find inner peace and salvation
                </p>
            </div>
            <div class="wrapper-caroursel">
                <i id="left" class="fa-solid fa-arrow-left"></i>
                <ul class="caroursel">
                    <c:forEach items="${instructorList}" var="acc">
                        <li class="card">
                            <div class="card-img">
                                <img src="Asset/img/avatar/${acc.img}" alt="">
                            </div>
                            <div class="card2-body">
                                <h2>${acc.name}</h2>
                                <a href="#">${courseRepo.countNumberCourseByInstructor(acc.id)} Course</a>
                            </div>
                        </li>
                        
                    </c:forEach>
                    
                </ul>
                <i id="right" class="fa-solid fa-arrow-right"></i>
            </div>
            <!-- Start section 5 -->
            <div class="section section5">
                <div>
                    <img src="Asset/img/icon/yoka-icon.png" alt="">
                    <h2 class="section-title">Inspired Articles</h2>
                    <p class="section-des">Modern postural yoga consists largely but not exclusively of the practice of asanas. There were very few standing asanas before 1900. By 2012, there were at least 19 widespread styles.</p>
                    <div class="category-list">
                        <c:forEach items="${categoryList}" var="category">
                            <a href="course-filter?categoryid=${category.id}"><i class="fa-solid fa-book"></i> ${category.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div>

                </div>
            </div>    
            <!-- End section 5 -->
            <!-- Start section 6-->
            <div class="section section6">
                <div>
                    <img src="Asset/img/icon/mail.png" alt="">
                    <h2 class="section-title">Subscribe to our newsletter</h2>
                    <p class="section-des">Get updates for new classes and new products</p>
                    <form action="#">
                        <i class="fa-sharp fa-solid fa-paper-plane"></i>
                        <input type="text" name="mail" placeholder="Your Email Address">
                        <button type="submit">SUBSCRIBE</button>
                    </form>
                </div>
            </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
        <!-- End section 6-->
        <script defer src="Asset/js/caroursel.js"></script>
    </body>
</html>