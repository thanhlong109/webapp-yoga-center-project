<%-- 
    Document   : cashierSideMenu
    Created on : Jul 11, 2023, 11:14:33 AM
    Author     : localboss
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier</title>
        
         <!-- Link CSS -->
        <link rel="stylesheet" href="../Asset/css/cashier.css">
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


        <!-- Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
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
<!--                <div class="sidebar-elements">
                    <a href="#">
                        <span class="material-symbols-sharp"> home</span>
                        <h3>Home</h3>
                    </a>
                </div>-->
<!--                <div class="sidebar-elements">
                    <a href="#" class="active">
                        <span class="material-symbols-sharp">receipt_long</span>
                        <h3>Cashier</h3>
                    </a>
                </div>-->

                <div class="sidebar-elements">
                    <a href="#"">
                        <span class="material-symbols-sharp">payments</span>
                        <h3>Bill</h3>
                    </a>
                    <ul class="sub-item" id="subItem">
                        <li><a href="<c:url value="/cashier/updateBillCashierController"/>" style="display: none">Update Bill</a></li>
                        <li><a href="<c:url value="/cashier/viewBillCashierController"/>"> View Bill Details</a></li>
                    </ul>
                </div>

                <div class="sidebar-elements">
                    <a href="#">
                        <span class="material-symbols-sharp">card_membership</span>
                        <h3>Membership</h3>
                    </a>
                    <ul class="sub-item" id="subItem">
                        <li><a href="<c:url value="/cashier/viewMembershipCashierController"/>">View Membership</a></li>
                        <li><a href="<c:url value="/cashier/updateMembershipCashierController"/>" style="display: none">Update Membership</a></li>
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
    </body>
</html>
