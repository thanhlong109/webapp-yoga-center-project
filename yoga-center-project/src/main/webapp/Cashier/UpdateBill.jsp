<%-- 
    Document   : UpdateBill
    Created on : Jul 14, 2023, 10:15:47 AM
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
        <!--<link rel="stylesheet" href="../Asset/css/dashboard_2.css"/>-->
          <link rel="stylesheet" href="../Asset/css/cashier.css"/> 
        <!--  <link rel="stylesheet" href="../Asset/css/adminAddScreen.css"/> -->
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
        <div class="container">
            <jsp:include page="../Component/cashierSideMenu.jsp"></jsp:include>
                <!--                <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
                                <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
                                <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />-->
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
                        <form action="searchBillController" id="search-box">
                            <input type="text" id="search-text" placeholder="Search" required>
                            <button id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                        <div class="profile">
                            <div class="info">
                                <p>Hey, <b>Cashier</b></p>
                                <small class="text-muted">Cashier</small>
                            </div>
                            <div class="profile-photo">
                                <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <h1>Update Bill</h1>
                    <div id="wrapper">
                        <form action="updateBillCashierController" method="POST">
                            <h3>Update Bill </h3>
                            <div class="input__group">
                                <input type="hidden" name="txtId" value="${BILL.id}">
                                <input type="text" name="txtOrderCode" value="${BILL.ordercode}"/>
                                <label for="">Order Code</label>
                             </div>
                            <div class="input__group filter">
                                 <select class="input-filter" name="txtStatus" >
                                    <c:forEach items="${StatusList}" var="item">
                                        <option ${BILL.status==item.ordinal()?'selected':''} value="${item.ordinal()}" >${item.name()}</option>
                                    </c:forEach>
                                </select>

                                <label for="">Status</label>
                            </div>


                            <div class="input__button">
                            <button type="submit" value="Add" id="btn__Add">Update</button>
                            <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
                            </div>
                        </form>
                </div>
            </main>
        </div>


        <script>
            var sidebarElements = document.querySelectorAll(".sidebar-elements");
            sidebarElements.forEach(btn => {
                $(btn).click(function () {
                    $(this).children(".sub-item").slideToggle(300);
                });
            });
        </script>
    </body>
</html>
