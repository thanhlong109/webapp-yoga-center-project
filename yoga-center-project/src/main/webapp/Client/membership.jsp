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
                                <a onclick="gotoUpdateForMem('Checkout?memId=${memList.id}&action=membership', ${memList.duration})"><button class="btn-silver">Update now</button></a>
                            </c:if>
                            <c:if test="${ExistMem != null &&  memList.id != ExistMem.membership.id && ExistMem.membership.price > memList.price}">
                                <a><button class="btn-silver">You can't update membership</button></a>
                            </c:if>
                            <span class="type">${memList.name}</span>
                        </div> 
                    </c:if>
                </c:if>
            </c:forEach>
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

<%@include file="../Component/footer.jsp" %> 
</html>
