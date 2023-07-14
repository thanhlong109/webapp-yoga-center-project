<%-- 
    Document   : instructorProfile
    Created on : Jun 8, 2023, 10:08:11 PM
    Author     : localboss
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.yowu.yogacenter.repository.RatingCourseRepository" %>
<%@page import="com.yowu.yogacenter.repository.RegistrationCourseRepository" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Asset/css/instructorProfile.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <title>Instructor Profile</title>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <div class="banner">
        </div>
        <div class="container">
            <div class="left-container">
                <div class="image-instructor-profile-wrapper">
                    <div class="image-instructor-profile img-square-container">
                        <img src="Asset/img/avatar/${instructor.img}" alt="image for profile">
                    </div>
                </div>
            </div>
            <div class="right-container">
                <div class="row">
                    <h3 class="instructor-name">${instructor.name}</h3>
                    <div class="instructor-contact" >
                        <p><i class="fa-regular fa-envelope"></i> ${instructor.email}</p>
                        <p><i class="fas fa-phone"></i> ${instructor.phone}</p>
                        <p class="instructor-join"><i class="fa-solid fa-feather-pointed"></i> Joined on ${instructor.createDate}</p>
                    </div>
                </div>
                <div class="row">
                    <h3>Biography</h3>
                    <p class="instructor-biography">
                        A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment. I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth. Thousand unknown plants are noticed by me. When I hear the buzz of the little world among the stalks, and grow familiar with the countless.
                    </p>
                </div>
                    
                <c:set var="ratingRepo" value="<%= new RatingCourseRepository()%>"/> 
                <c:set var="rcRepo" value="<%= new RegistrationCourseRepository()%>"/> 
                <div class="row">
                    <h3>Courses (${CourseList.size()})</h3>
                    <div class="surgest-list"> <!-- list surgest course here -->
                        <c:forEach items="${CourseList}" var="c">
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
        </div>
        <script>
            /*display star*/
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
            function goto(url) {
                window.location.href = "${pageContext.request.contextPath}/" + url;
            }
        </script>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>
