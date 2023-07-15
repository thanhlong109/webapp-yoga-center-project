<%-- 
    Document   : adminSideMenu2
    Created on : Jun 29, 2023, 6:31:53 PM
    Author     : DungVNT
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- LEFT SIDE-BAR -->
<style>
    aside {
        min-height: 100vh;
        height: 100%;
        box-shadow: 2rem 0 2rem rgba(132, 139, 200, 0.18);
    }

    aside .top {

        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 1.4rem;

    }

    aside .logo {
        margin-left: 30%;
        font-size: 2rem;
        font-weight: 800;
        color: var(--color-dark);
    }

    aside .close {
        display: none;
    }

    /* sidebar */
    aside .sidebar {

        display: flex;
        flex-direction: column;
        height: 96vh;
        position: relative;
        top: 3rem;
    }
    aside h3 {
        font-weight: 500;
    }

    aside .sidebar .sidebar-elements a{
        display: flex;
        color: var(--color-info-dark);
        margin-left: 2rem;
        gap: 1rem;
        align-items: center;
        position: relative;
        height: 3.7rem;
        transition: all 300ms ease;
    }
    aside .sidebar .sidebar-elements a span{
        font-size: 1.6rem;
        transition: all 300ms ease;
    }
    /* aside .sidebar .sidebar-elements:last-child{
        position: absolute;
        bottom: 2rem;
        width: 100%;
    } */
    aside .sidebar .sidebar-elements a.active{
        background: var(--color-light);
        color: var(--color-primary);
        margin-left: 0;
    }
    aside .sidebar .sidebar-elements a.active::before{
        content: '';
        width: 6px;
        height: 100%;
        background: var(--color-primary);
    }
    aside .sidebar .sidebar-elements a.active span{
        color: var(--color-primary);
        margin-left: calc(1rem - 3px);
    }
    aside .sidebar .sidebar-elements a:hover{
        color: var(--color-primary);
    }
    aside .sidebar .sidebar-elements a:hover span{
        margin-left: 1rem;
    }
    aside .sidebar .sidebar-elements .sub-item{
        margin-left: 1.4rem;
        padding-left: 2.7rem;
        display: none;
        transition: max-height 300ms ease;
        overflow: hidden; 
    }

</style>
<aside>
    <div class="top">
        <div class="logo">
            <a href="#">YOWU.</a>
        </div>
        <div class="close" id="close-btn">
            <span class="material-symbols-sharp">
                close
            </span>
        </div>
    </div>
    <div class="sidebar">
        <div class="sidebar-elements">
            <a href="${pageContext.request.contextPath}/home">
                <span class="material-symbols-sharp"> home</span>
                <h3>Home</h3>
            </a>
        </div>
        <div class="sidebar-elements">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="js-dashboard">
                <span class="material-symbols-sharp">grid_view </span>
                <h3>Dashboard</h3>
            </a>
        </div>
        <div class="sidebar-elements">
            <a class="course-btn js-course">
                <span class="material-symbols-sharp">menu_book </span>
                <h3>Course</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="<c:url value="/admin/categoryListController"/>">
                        View & Edit Category Course</a></li>
                <li><a href="../Admin/AddCategory.jsp">
                        Add Category Course</a></li>
                <li><a href="<c:url value="/admin/viewCourseListController"/>">
                        View & Edit Course</a></li>
                <li><a href="<c:url value="/admin/addCourseController"/>">
                        Add New Course</a></li>
                <li><a href="<c:url value="/admin/viewCourseTimeListController"/>">
                        View & Edit Course Time</a></li>
                <li><a href="<c:url value="/admin/addCourseScheduleController"/>">
                        Add Course Time</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a class="js-bill">
                <span class="material-symbols-sharp">payments</span>
                <h3>Bill</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="#">Bill Analysis</a></li>
                <li><a href="<c:url value="/admin/viewBillListController"/>">
                        View Bill Details</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a class="js-blog">
                <span class="material-symbols-sharp">newspaper</span>
                <h3>Blog</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="#">Blog Analysis</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a class="js-account">
                <span class="material-symbols-sharp">person</span>
                <h3>Account</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="#">Account Analysis</a></li>
                <li><a href="<c:url value="/admin/viewAccountListController"/>">
                        View & Edit Account</a></li>
                <li><a href="../Admin/AddAccount.jsp">Add New Account</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a class="js-schedule">
                <span class="material-symbols-sharp">calendar_today</span>
                <h3>Schedule</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="<c:url value="/admin/viewClassScheduleListController"/>">
                        View & Edit Schedule</a></li>
                <li><a href="<c:url value="/admin/addClassScheduleController"/>">
                        Add Schedule</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a class="js-membership">
                <span class="material-symbols-sharp">card_membership</span>
                <h3>Membership</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="<c:url value="/admin/viewMembershipListController"/>">
                        View & Edit Membership</a></li>
                <li><a href="../Admin/AddMembership.jsp">
                        Add Membership</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a href="${pageContext.request.contextPath}/logout">
                <span class="material-symbols-sharp">logout</span>
                <h3>Logout</h3>
            </a>
        </div>
    </div>
</aside>
<script>
    var sidebarElements = document.querySelectorAll(".sidebar-elements");
    sidebarElements.forEach(btn => {
        $(btn).click(function () {
            $(this).children(".sub-item").slideToggle(300);
        });
    });
    let currentPath = window.location.pathname;
    let currentPathName = currentPath.replace('${pageContext.request.contextPath}', "");
    switch (currentPathName) {
        case '/admin/categoryListController':
        case '/admin/addCourseScheduleController':
        case '/admin/viewCourseTimeListController':
        case '/admin/viewCourseListController':
        case '/admin/addCourseController':
        {
            $('.js-course').addClass('active');
            break;
        }
        case '/admin/dashboard':
        {
            $('.js-dashboard').addClass('active');
            break;
        }
        case '/admin/viewBillListController':{
            $('.js-bill').addClass('active');
            break;
        }
        case '/admin/viewMembershipListController':{
            $('.js-membership').addClass('active');
            break;
        }
        case '/admin/viewClassScheduleListController':
        case '/admin/addClassScheduleController':{
            $('.js-schedule').addClass('active');
            break;
        }
        case '/admin/viewAccountListController':{
            $('.js-account').addClass('active');
            break;
        }
        
    }
</script>