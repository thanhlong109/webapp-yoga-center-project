<%-- 
    Document   : adminSideMenu
    Created on : Jun 17, 2023, 7:14:06 PM
    Author     : DungVNT
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- AdminSideBar -->
<div class="left-side-bar-wrapper">
    <i class="fa-solid fa-bars"></i>
    <div class="left-side-bar open">
        <div class="logo">
            <a href="#">YOWU.</a>
        </div>
        <div class="left-nav">

            <div class="main-nav">
                <div class="nav-item">
                    <a href="#">Home</a>
                </div>
                <div class="nav-item active">
                    <a href="#">Dashboard</a>
                </div>
                <div class="separate"></div>
                <div class="nav-item  m">
                    Manage
                </div>
            </div>
            <ul class="nav-2">
                <li class="nav-2-main-container">
                    <div class="nav-2-main">
                        <i class="fa-solid fa-book"></i> Course <i class="fa-solid js-arrow fa-chevron-down"></i>
                    </div> 
                    <ul class="sub-nav-2 show">
                        <li class="active"><a href="<c:url value="/admin/categoryListController"/>">
                                View All & Edit Category</a></li>
                        <li><a href="../Admin/AddCategory.jsp">
                                Add New Category</a></li>
                        <li><a href="<c:url value="/admin/viewCourseListController"/>">
                                View All & Edit Course</a></li>
                        <li><a href="<c:url value="/admin/addCourseController"/>">
                                Add New Course</a></li>   
                        <li><a href="<c:url value="/admin/viewCourseTimeListController"/>">
                                View All & Edit Course Time</a></li>
                        <li><a href="#">
                                Add Course Time</a></li>                        
                    </ul>
                </li>
                <li class="nav-2-main-container">
                    <div class="nav-2-main">
                        <i class="fa-solid fa-money-bill-wave"></i> Bill <i class="fa-solid fa-chevron-right js-arrow"></i>
                    </div>
                    <ul class="sub-nav-2">
                        <li><a href="#">
                                Bill Analysis</a></li>
                        <li><a href="<c:url value="/admin/viewBillListController"/>">
                                View Bill Details</a></li>
                    </ul> 
                </li>
                <li class="nav-2-main-container">
                    <div class="nav-2-main">
                        <i class="fa-sharp fa-solid fa-rss"></i> Blog <i class="fa-solid fa-chevron-right js-arrow"></i>
                    </div> 
                    <ul class="sub-nav-2">
                        <li><a href="#">
                                Blog Analysis</a></li>
                    </ul> 
                </li>
                <li class="nav-2-main-container">
                    <div class="nav-2-main">
                        <i class="fa-solid fa-user-group"></i> Account <i class="fa-solid fa-chevron-right js-arrow"></i>
                    </div>
                    <ul class="sub-nav-2">
                        <li><a href="#">
                                Account Analysis</a></li>
                        <li><a href="<c:url value="/admin/viewAccountListController"/>">
                                View All & Edit Account</a></li>
                        <li><a href="#">
                                Add New Account</a></li>
                    </ul> 
                </li>
                <li class="nav-2-main-container">
                    <div class="nav-2-main">
                        <i class="fa-solid fa-calendar-days"></i> Schedule <i class="fa-solid fa-chevron-right js-arrow"></i>
                    </div>
                    <ul class="sub-nav-2">
                        <li><a href="<c:url value="/admin/viewClassScheduleListController"/>">
                                View All & Edit Schedule</a></li>
                        <li><a href="#">
                                Add New Schedule</a></li>
                    </ul> 
                </li>
                <li class="nav-2-main-container">
                    <div class="nav-2-main">
                        <i class="fa-solid fa-calendar-days"></i> Membership <i class="fa-solid fa-chevron-right js-arrow"></i>
                    </div>
                    <ul class="sub-nav-2">
                        <li><a href="<c:url value="/admin/viewMembershipListController"/>">
                                View All & Edit Membership</a></li>
                        <li><a href="#">
                                Add New Membership</a></li>
                    </ul> 
                </li>
            </ul>
        </div>
    </div>
</div>
<script src="../Asset/js/cdnjs.cloudflare.com_ajax_libs_jquery_3.7.0_jquery.min.js"></script>
<script defer>

    /*open up down each part in left side bar*/
    const nav2btns = document.querySelectorAll(".nav-2-main-container");
    nav2btns.forEach(btn => {
        let subNav2 = btn.querySelector(".sub-nav-2");
        let arrow = btn.querySelector(".js-arrow");
        if (subNav2 !== null) {
            btn.addEventListener("click", () => {
                if (subNav2.classList.contains("show")) {
                    subNav2.classList.remove("show");
                    arrow.classList.remove("fa-chevron-down");
                    arrow.classList.add("fa-chevron-right");
                } else {
                    subNav2.classList.add("show");
                    arrow.classList.add("fa-chevron-down");
                    arrow.classList.remove("fa-chevron-right");
                }
            });
        }
        subNav2.addEventListener("click", (event) => {
            event.stopPropagation();
        });
    });
    /*show active sub-nav in nav-bar when load new page*/
    const activeShow = document.querySelector(".sub-nav-2 .active");
    let acP = activeShow.parentElement;
    acP.classList.add("show");
    let arr = acP.parentElement.querySelector(".js-arrow");
    arr.classList.remove("fa-chevron-right");
    arr.classList.add("fa-chevron-down");
    /* open close left side bar*/
    const menuBtn = document.querySelector(".fa-bars");
    const leftBar = document.querySelector(".left-side-bar");
    menuBtn.addEventListener("click", () => {
        leftBar.classList.toggle("open");
    });

</script>
