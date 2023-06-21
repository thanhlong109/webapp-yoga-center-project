<%-- 
    Document   : header
    Created on : Jun 4, 2023, 5:13:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Start Header -->
<div class="header-wrapper">
    <div class="header">
        <a href="${pageContext.request.contextPath}" class="logo">
            YOWU.
        </a>
        <div class="nav-wrapper">
            <ul class="nav">
                <i class="fa-solid fa-x closebtn"></i>
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li>
                    <a href="${pageContext.request.contextPath}/ViewClass">Classes</a>
                    <i class="fa-solid fa-chevron-right subnavbtn pc-hide"></i>
                    <ul class="subnav">
                        <i class="fa-solid fa-x closebtn"></i>
                <li><a href="#">About1</a></li>
                <li><a href="#">About2</a></li>
                <li><a href="#">About3</a></li>
                <li><a href="#">About4</a></li>
                <li><a href="#">About5</a></li>  
            </ul>
            </li>
            <li><a href="#">Pages</a></li>
            <li>
                <a href="BlogHomeController">Blog</a>
                <i class="fa-solid fa-chevron-right subnavbtn pc-hide"></i>
                <ul class="subnav">
                    <i class="fa-solid fa-x closebtn"></i>
                    <li class="active"><a href="#">About1</a></li>
                    <li><a href="#">About2</a></li>
                    <li><a href="#">About3</a></li>
                    <li><a href="#">About4</a></li>
                    <li><a href="#">About5</a></li>  
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/Timetable">Schedule</a></li>
            </ul>

            <div class="user-btn">
                <c:if test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/login">
                        <i class="fa-solid fa-user"></i> Login/Register  <!-- display name user here, if user null display login/Register-->
                    </a>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <a class="text-account" href="${pageContext.request.contextPath}/userprofile/course">
                        <div class="img">
                            <img id="img_account" src="${pageContext.request.contextPath}/Asset/img/avatar/${sessionScope.account.img}" /> 
                            <span>${sessionScope.account.name}</span>
                        </div> 
                        <!-- display name user here, if user null display login/Register-->
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

    $(window).bind('mousewheel', function (event) {
        if (event.originalEvent.wheelDelta >= 0) {
//Scroll up
            $(".header-wrapper").slideDown(400);
        } else {
//Scroll down
            $(".header-wrapper").slideUp(400);
        }
    });


</script>


