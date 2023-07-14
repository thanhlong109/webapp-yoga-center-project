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
        <jsp:include page="../Component/cashierSideMenu.jsp"></jsp:include>
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
                        <img src="../img/avatar/hinh-avatar-1.png" alt="">
                    </div>
                </div>
            </div>
            <h1>Update Bill</h1>
            
        </main>
    </body>
</html>
