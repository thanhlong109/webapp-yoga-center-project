<%-- 
    Document   : membership
    Created on : Jul 6, 2023, 10:19:43 PM
    Author     : Chien Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Membership</title>

        <!-- link CSS -->
        <link rel="stylesheet" href="Asset/css/membership.css">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientHeader.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientFooter.css">
        
        <style>
            .overlay2 {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 500ms;
            visibility: hidden;
            opacity: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .overlay2:target {
            visibility: visible;
            opacity: 1;
            z-index: 99;
        }

        .popup2 {
            background: #fff;
            border-radius: 5px;
            width: 60%;
            max-width: 500px;
            padding: 20px;
            position: relative;
            transition: all 1s ease-in-out;
        }

        .popup2 h3 {
            margin: 0;
            padding: 0;
            color: #333;
            font-family: Tahoma, Arial, sans-serif;
            font-size: 18px;
        }

        .popup2 hr {
            margin: 10px 0;
        }

        .popup2 p {
            margin: 0;
            padding: 0;
            color: #555;
            font-size: 16px;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            font-weight: bold;
            color: #333;
            text-decoration: none;
            cursor: pointer;
        }

        .close:hover {
            color: #06d85f;
        }

        .popup2 button {
            margin-top: 20px;
            padding: 8px 15px;
            border: none;
            background-color: #1cccb8;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup2 button.cancel {
            background-color: #999;
            margin-right: 10px;
        }
        </style>
        
    </head>
    <body>
        <%@include file="../Component/header.jsp" %>
        <div class="banner">
            <h2>Membership</h2>
        </div>

        <div class="container">
            <c:forEach items="${membershipList}" var="memList">
                <c:if test="${sessionScope.account == null}">
                    <div class="box">
                        <h3>${memList.name} Yowu Member</h3>    
                        <p class="price">Only $<fmt:formatNumber value="${memList.price / memList.duration * 30}" pattern="##.##"></fmt:formatNumber><small class="text-mute">/Month</small></p>

                            <div class="box__content">
                                <span class="material-symbols-sharp">verified</span>
                                <p>Membership  ${memList.price} days</p>
                        </div>
                        <div class="box__content">
                            <span class="material-symbols-sharp">verified</span>
                            <p>Membership period lasts up to ${memList.duration} days</p>
                            <input id="durationMem" value="${memList.duration}" type="hidden">
                        </div>
                        <div class="box__content">
                            <span class="material-symbols-sharp">verified</span>
                            <p>Membership period lasts up to ${memList.duration} days</p>
                            <input id="durationMem" value="${memList.duration}" type="hidden">
                        </div>
                        <div class="box__content">
                            <span class="material-symbols-sharp">verified</span>
                            <p>${memList.description}</p>
                        </div>
                        <a onclick="gotoCheckoutForMem('Checkout?memId=${memList.id}&action=membership', ${memList.duration})"><button class="btn-silver">Buy Now</button></a>
                        <span class="type">${memList.name}</span>
                    </div> 
                </c:if>
                <c:if test="${sessionScope.account != null }">
                    <c:if test="${ExistMem == null}">
                        <div class="box">
                            <h3>${memList.name} Yowu Member</h3>
                            <p class="price">Only $<fmt:formatNumber value="${memList.price / memList.duration * 30}" pattern="##.##"></fmt:formatNumber><small class="text-mute">/Month</small></p>
                                <div class="box__content">
                                    <span class="material-symbols-sharp">verified</span>
                                    <p>Membership  ${memList.price} days</p>
                            </div>
                            <div class="box__content">
                                <span class="material-symbols-sharp">verified</span>
                                <p>Membership period lasts up to ${memList.duration} days</p>
                                <input id="durationMem" value="${memList.duration}" type="hidden">
                            </div>
                            <div class="box__content">
                                <span class="material-symbols-sharp">verified</span>
                                <p>${memList.description}</p>
                            </div>
                            <a onclick="gotoCheckoutForMem('Checkout?memId=${memList.id}&action=membership', ${memList.duration})"><button class="btn-silver">Buy Now</button></a>
                            <span class="type">${memList.name}</span>
                        </div> 
                    </c:if>
                    <c:if test="${ExistMem != null}">
                        <div class="box">
                            <h3>${memList.name} Yowu Member</h3>
                            <p class="price">Only $<fmt:formatNumber value="${memList.price / memList.duration * 30}" pattern="##.##"></fmt:formatNumber><small class="text-mute">/Month</small></p>
                                <div class="box__content">
                                    <span class="material-symbols-sharp">verified</span>
                                    <p>Membership card $${memList.price}</p>
                            </div>
                            <div class="box__content">
                                <span class="material-symbols-sharp">verified</span>
                                <p>Membership period lasts up to ${memList.duration} days</p>
                                <input id="durationMem" value="${memList.duration}" type="hidden">
                            </div>
                            <div class="box__content">
                                <span class="material-symbols-sharp">verified</span>
                                <p>${memList.description}</p>
                            </div>
                            <c:if test="${ExistMem != null &&  memList.id == ExistMem.membership.id}">
                                <a> <button class="btn-silver">You already here</button></a>
                            </c:if>
                            <c:if test="${ExistMem != null &&  memList.id != ExistMem.membership.id && ExistMem.membership.price < memList.price}">
                                <button class="btn-silver" onclick="openPopupEdit(${memList.id}, ${memList.price})">Update membership card now</button>
                            </c:if>
                            <c:if test="${ExistMem != null &&  memList.id != ExistMem.membership.id && ExistMem.membership.price > memList.price}">
                                <a><button class="btn-silver">You can't update membership card</button></a>
                            </c:if>
                            <span class="type">${memList.name}</span>
                        </div> 
                    </c:if>
                </c:if>
            </c:forEach>
            <div class="overlay2" id="popupEdit">
            <div class="popup2">
                <!-- Nội dung của popup -->
                <h3>Update Membership Card</h3>
                <hr class="hr" />
                <a href="#anchorLink" class="close" onclick="closePopupEdit()">&times;</a>
                <p style="color: #ee4747">Are you sure to upgrade your membership card?</p>
                   <p style="color: #ee4747">When you click OK, you will cancel the remaining time of the card you currently own.</p>
                </p>
                <button class="btn-silver" onclick="handleUpdate(memId)">Update Now</button>
                <button class="btn-silver" onclick="closePopupEdit()">Cancel</button>
            </div>
        </div>

        </div>
    </div>
</body>

<script>

    function gotoCheckoutForMem(url, durationMem) {
        window.location.href = "${pageContext.request.contextPath}/" + url + "&durationMem=" + durationMem;
    }

    function gotoUpdateForMem(url, durationMem) {
        window.location.href = "${pageContext.request.contextPath}/" + url + "&durationMem=" + durationMem;
    }

    

</script>
<script>
        

        function openPopupEdit(value) {
            
            document.querySelector(
                '#main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header'
            ).style.zIndex = "0";
        }

        function closePopupEdit(e) {
            let checked = document.querySelector(".confirmative-change");
            if (checked.checked != true) {
                e.preventDefault();
            }
            document.querySelector(
                '#main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header'
            ).style.zIndex = "10";
        }
         function openPopupEdit(memId, price) {
        // Hiển thị popup
        document.getElementById("popupEdit").style.visibility = "visible";
        document.getElementById("popupEdit").style.opacity = "1";
        // Vô hiệu hóa các phần tử khác khi hiển thị popup (nếu cần)
        document.querySelector('body').style.overflow = 'hidden';
        // Lưu memId vào biến toàn cục để sử dụng trong hàm handleUpdate()
        window.memId = memId;
    }

    function closePopupEdit() {
        // Ẩn popup
        document.getElementById("popupEdit").style.visibility = "hidden";
        document.getElementById("popupEdit").style.opacity = "0";
        // Bỏ vô hiệu hóa các phần tử khác khi ẩn popup (nếu cần)
        document.querySelector('body').style.overflow = 'auto';
    }

    function handleUpdate(memId) {
        // Gửi yêu cầu update thông qua JavaScript hoặc Ajax (tùy theo yêu cầu của bạn)
        // Ví dụ sử dụng JavaScript redirect để đến trang update
        window.location.href = "${pageContext.request.contextPath}/Checkout?memId=" + memId + "&action=membership";
        // Sau khi xử lý xong, bạn có thể đóng popup bằng cách gọi hàm closePopupEdit()
        closePopupEdit();
    }
    </script>

<%@include file="../Component/footer.jsp" %> 
</html>
