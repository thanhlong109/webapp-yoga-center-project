<%-- 
    Document   : header
    Created on : Jun 4, 2023, 5:13:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@page import="com.yowu.yogacenter.model.Role" %>

<!-- Start Header -->
<div class="header-wrapper">
    <div class="header">
        <a href="${pageContext.request.contextPath}" class="logo">
            YOWU.
        </a>
        <div class="nav-wrapper">
            <ul class="nav">
                <i class="fa-solid fa-x closebtn"></i>
                <li class="js-home"><a href="${pageContext.request.contextPath}">Home</a></li>
                <li class="js-about"><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li class="js-course">
                    <a href="${pageContext.request.contextPath}/courses">Course</a>
                </li>
                <li class="js-membership"><a href="${pageContext.request.contextPath}/Membership">Membership</a></li>
                <li class="js-blog">
                    <a href="${pageContext.request.contextPath}/blogs">Blog</a>
                </li>
                <li class="js-schedule"><a href="${pageContext.request.contextPath}/Timetable">Schedule</a></li>
                
            </ul>

            <div class="user-btn">
                <c:if test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/login">
                        <i class="fa-solid fa-user"></i> Login/Register  <!-- display name user here, if user null display login/Register-->
                    </a>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <a class="text-account" href="${pageContext.request.contextPath}/userprofile/course">
                        <div class="img img-square-container">
                            <img id="img_account" src="${pageContext.request.contextPath}/Asset/img/avatar/${sessionScope.account.img}" />
                        </div>   
                    </a>
                </c:if>
            </div>
            <div class="menu-mobile">
                <i class="fa-solid fa-bars"></i>
            </div>
        </div>
    </div>
</div>
<!-- End header -->
<script src="${pageContext.request.contextPath}/Asset/js/cdnjs.cloudflare.com_ajax_libs_jquery_3.7.0_jquery.min.js"></script>

<%@include file="../Component/imgSquare.jsp" %>
<script defer>
    const menuBtn = document.querySelector(".menu-mobile");
    const nav = document.querySelector(".nav");
    const closeMenuBtns = document.querySelectorAll(".closebtn");
    const subnavbtns = document.querySelectorAll(".subnavbtn");

    menuBtn.addEventListener("click", () => {
        if (nav.classList.contains("show")) {
            nav.classList.remove("show");
        } else {
            nav.classList.add("show");
        }
    });
    subnavbtns.forEach(subBtn => {
        subBtn.addEventListener("click", () => {
            let subnav = subBtn.parentElement.querySelector(".subnav");
            if (subnav.classList.contains("show")) {
                subnav.classList.remove("show");
            } else {
                subnav.classList.add("show");
            }
        });
    });
    closeMenuBtns.forEach(closebtn => {
        closebtn.addEventListener("click", () => {
            if (closebtn.parentElement.classList.contains("show")) {
                closebtn.parentElement.classList.remove("show");
            } else {
                closebtn.parentElement.classList.add("show");
            }
        });
    });
    var scrollvalue = 0;
    $(window).bind('mousewheel', function (event) {
        scrollvalue += event.originalEvent.wheelDelta;
        var currentPoint = window.pageYOffset;
        if (scrollvalue >= 600) {
//Scroll up
            $(".header-wrapper").slideDown(400);
            scrollvalue = 0;
        } else if (scrollvalue <= -600 && currentPoint>200) {
            //Scroll down
            $(".header-wrapper").slideUp(400);
            scrollvalue = 0;
        }
    });

    /* active nav auto*/
    let currentPath = window.location.pathname;
    let currentPathName = currentPath.replace('${pageContext.request.contextPath}', "");
    switch (currentPathName) {
        case '/course-detail':
        case '/courses':
        {
            $('.js-course').addClass('active');
            break;
        }
        case '/blog-detail':
        case '/blogs':
        {
            $('.js-blog').addClass('active');
            break;
        }
        case '/home':
        {
            $('.js-home').addClass('active');
            break;
        }
        case '/Timetable':
        {
            $('.js-schedule').addClass('active');
            break;
        }
        case '/Membership':{
            $('.js-membership').addClass('active');
            break;
        }
        case '/about':{
            $('.js-about').addClass('active');
            break;
        }

    }
</script>

