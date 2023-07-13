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
        <title>JSP Page</title>
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
                <div class="sidebar-elements">
                    <a href="#">
                        <span class="material-symbols-sharp"> home</span>
                        <h3>Home</h3>
                    </a>
                </div>
<!--                <div class="sidebar-elements">
                    <a href="#" class="active">
                        <span class="material-symbols-sharp">receipt_long</span>
                        <h3>Cashier</h3>
                    </a>
                </div>-->

                <div class="sidebar-elements">
                    <a href="#" class="active">
                        <span class="material-symbols-sharp">payments</span>
                        <h3>Bill</h3>
                    </a>
                    <ul class="sub-item" id="subItem">
                        <li><a href="#">Update Bill</a></li>
                        <li><a href="<c:url value="/cashier/viewBillController"/>">
                                View Bill Details</a></li>
                    </ul>
                </div>

                <div class="sidebar-elements">
                    <a href="#">
                        <span class="material-symbols-sharp">card_membership</span>
                        <h3>Membership</h3>
                    </a>
                    <ul class="sub-item" id="subItem">
                        <li><a href="#">View Membership</a></li>
                        <li><a href="#">Edit Membership</a></li>
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
    </body>
</html>
