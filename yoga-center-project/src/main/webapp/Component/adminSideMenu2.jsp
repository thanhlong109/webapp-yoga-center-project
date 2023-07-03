<%-- 
    Document   : adminSideMenu2
    Created on : Jun 29, 2023, 6:31:53 PM
    Author     : DungVNT
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- LEFT SIDE-BAR -->
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
            <a href="#">
                <span class="material-symbols-sharp"> home</span>
                <h3>Home</h3>
            </a>
        </div>
        <div class="sidebar-elements">
            <a href="#" class="active">
                <span class="material-symbols-sharp">grid_view </span>
                <h3>Dashboard</h3>
            </a>
        </div>
        <div class="sidebar-elements">
            <a href="#" class="course-btn">
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
                <li><a href="#">
                        Add Course Time</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a href="#">
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
            <a href="#">
                <span class="material-symbols-sharp">newspaper</span>
                <h3>Blog</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="#">Blog Analysis</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a href="#">
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
            <a href="#">
                <span class="material-symbols-sharp">calendar_today</span>
                <h3>Schedule</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="<c:url value="/admin/viewClassScheduleListController"/>">
                        View & Edit Schedule</a></li>
                <li><a href="#">Add Schedule</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a href="#">
                <span class="material-symbols-sharp">card_membership</span>
                <h3>Membership</h3>
            </a>
            <ul class="sub-item" id="subItem">
                <li><a href="<c:url value="/admin/viewMembershipListController"/>">
                        View & Edit Membership</a></li>
                <li><a href="#">
                        Add Membership</a></li>
            </ul>
        </div>
        <div class="sidebar-elements">
            <a href="#">
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

// upload image
    const selectImage = document.querySelector(".select-image");
    const inputFile = document.querySelector("#file");
    const imgArea = document.querySelector(".image-area");
//lien ket nut select-image voi input type"file"
    selectImage.addEventListener("click", function () {
        inputFile.click();
    });

    inputFile.addEventListener("change", function () {
        const image = this.files[0];
        console.log(image);

        const reader = new FileReader();
        reader.onload = () => {
// const allImg = imgArea.querySelector("img");
// allImg.forEach(item => item.remove());
            const imgUrl = reader.result;
            const img = document.createElement("img");

            img.src = imgUrl;
            imgArea.appendChild(img);
            imgArea.classList.add("active");
            imgArea.dataset.img = image.name;
        };
        reader.readAsDataURL(image);


    });
</script>