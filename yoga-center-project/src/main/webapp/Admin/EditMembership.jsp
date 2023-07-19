<%-- 
    Document   : EditMembership
    Created on : Jul 4, 2023, 3:57:24 PM
    Author     : DungVNT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Membership</title>
        <!-- Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!-- Link CSS  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/alertBoxAdmin.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu2.jsp"></jsp:include>
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
                        <div class="profile">
                            <div class="info">
                                <p>Hey, <b>${sessionScope.account.name}</b></p>
                                <small class="text-muted">Admin</small>
                            </div>
                            <div class="profile-photo">
                                <img src="../Asset/img/avatar/${sessionScope.account.img}" alt="">
                            </div>
                        </div>
                    </div>
                    <h1>Edit Membership</h1>
                    <div id="wrapper">
                        <form action="updateMembershipController" method="post">
                            <h3>Edit Membership</h3>

                            <div class="input__group">
                                <input type="hidden" name="txtId" value="${MEMBERSHIP.id}"/>
                            <input type="text" name="txtName" value="${MEMBERSHIP.name}">
                            <label for="">Name</label>
                        </div>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.membershipNameLengthError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.membershipNameLengthError}
                            </div>
                        </c:if>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.membershipNameDuplicateError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.membershipNameDuplicateError}
                            </div>
                        </c:if>
                        <div class="input__group">
                            <input type="text" name="txtDuration" value="${MEMBERSHIP.duration}">
                            <label for="">Duration</label>
                        </div>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.membershipDurationError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.membershipDurationError}
                            </div>
                        </c:if>
                        <div class="input__group">
                            <input type="text" name="txtPrice" value="${MEMBERSHIP.price}">
                            <label for="">Price</label>
                        </div>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.membershipPriceError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.membershipPriceError}
                            </div>
                        </c:if>
                        <div class="input__group detail">
                            <textarea name="txtDescription" id="detail" rows="5" value="${MEMBERSHIP.description}">${MEMBERSHIP.description} </textarea>
                            <label for="">Description</label>
                        </div>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.membershipDescriptionError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.membershipDescriptionError}
                            </div>
                        </c:if>
                        <div class="input__group">
                            <input type="text" name="txtDiscount" value="${MEMBERSHIP.discount}">
                            <label for="">Discount(%)</label>
                        </div>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.membershipDiscountError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.membershipDiscountError}
                            </div>
                        </c:if>
                        <c:if test="${UPDATE_MEMBERSHIP_ERROR.error != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_MEMBERSHIP_ERROR.error}
                            </div>
                        </c:if>
                        <div class="input__button">
                            <button type="submit" value="Add" id="btn__Add">Update</button>
                            <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
                        </div>

                    </form>

            </main>
        </div>
        <script>
            var close = document.getElementsByClassName("closebtn");
            var i;

            for (i = 0; i < close.length; i++) {
                close[i].onclick = function () {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function () {
                        div.style.display = "none";
                    }, 600);
                };
            }
        </script>
    </body>
</html>
