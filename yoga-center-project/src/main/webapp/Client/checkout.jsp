<%-- 
    Document   : checkout
    Created on : Jun 24, 2023, 3:08:00 PM
    Author     : Chien Thang
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="ftm" uri="jakarta.tags.fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Asset/css/checkout.css" type="text/css"/>
    <link rel="stylesheet" href="Asset/css/clientHeader.css">
    <link rel="stylesheet" href="Asset/css/clientFooter.css">
    <link rel="stylesheet" href="Asset/css/common.css">
    <style>
        .email_name{
            color: #3dbca8;
            font-style: italic;
        }

        .element__checkout-method img{
            height: 4vh;
            width: 4vh;
        }
        .checkout-method{
            margin-left: 15px;
            margin-top: 2px;
        }

        .custom-alert {
            color: #dc3545;

        }

        .discript{
            color: #a2a2a2;
            text-align: left
        }

    </style>
</head>

<body>
    <jsp:include page="../Component/header.jsp"></jsp:include>
        <div class="main">
            <div class="banner">
                <h1>Checkout</h1>
            </div>
            <div class="container">
                <h2>Checkout</h2>
                <div class="container__elements">
                    <div class="container__element-form">
                        <form action="CheckoutSendController">
                            <input type="hidden" id="course_id" name="id" value="" >
                            <input type="hidden" id="course_scheduleId" name="course_scheduleId" value="">
                            <input type="hidden" id="memId" name="memId" value="">
                            <input type="hidden" id="durationMem" name="durationMem" value="">

                            <!-- form-left -->
                            <div class="container__element-left">
                                <div class="element__checkout-account-login ">
                                    <p class="element__checkout-content element__checkout-seperate">
                                        Logged in as
                                        <span class="email_name">${sessionScope.account.name}</span>
                                </p>
                                <a href="${pageContext.request.contextPath}/logout">Logout</a>
                            </div>
                            <div class="element__checkout-comment">
                                <textarea name="order__comment" id="order__comment" rows="3"
                                          placeholder="Note to administrator" spellcheck="false"></textarea>
                            </div>
                            <c:if test="${course.price != 0}">
                                <input name="coursePrice" id="coursePrice" value="" type="hidden">
                                <div class="element__checkout-payment">
                                    <div class="checkout__payment-title">
                                        <h4>Payment</h4>
                                        <span>
                                            <!-- Nhúng icon ổ khóa -->
                                            <i class="fas fa-lock"></i>
                                            Secure Connection
                                        </span>
                                    </div>
                                    <ul class="element__checkout-method">
                                        <li class="element__checkout-method-paypal">
                                            <input type="radio" name="payment-method" value="VNPAY">
                                            <img src="Asset/img/checkout/vnpay.png" alt="">
                                            <span class="checkout-method">VNPAY</span>
                                        </li>
                                        <li class="element__checkout-method-offline__payment">
                                            <input type="radio" name="payment-method" value="STUDIO">
                                            <img src="Asset/img/checkout/pngwing.com.png" alt="">
                                            <span class="checkout-method">Payment in Studio</span>
                                        </li>
                                    </ul>

                                    <input id="duration" name="duration" value="" type="hidden" >
                                    <input id="startTime" name="startTime" value="" type="hidden">

                                    <div class="element__checkout-button">
                                        <button type="submit" name="btnPlaceOrder">Place Order</button>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${course.price == 0}">
                                <input name="coursePrice" id="coursePrice" value="" type="hidden">
                                <div class="element__checkout-payment">
                                    <div class="checkout__payment-title">
                                        <h4>Welcome to yowu</h4>
                                        <span>
                                            <!-- Nhúng icon ổ khóa -->
                                            <i class="fas fa-lock"></i>
                                            Secure Connection
                                        </span>
                                    </div>

                                    <input id="duration" name="duration" value="" type="hidden">
                                    <input id="startTime" name="startTime" value="" type="hidden">

                                    <div class="element__checkout-button">
                                        <button type="submit" name="btnPlaceOrder">Enroll course</button>
                                        <input type="hidden" name="payment-method" value="Free">
                                    </div>
                                </div>
                            </c:if>

                            <p class="checkout__element-condition">

                                By completing your purchase you agree to those
                                <a href="">Term Conditions</a>
                            </p>
                        </div>
                        <c:if test="${course != null }" >
                            <input name="coursePrice" id="coursePrice" value="" type="hidden">
                            <!-- form-checkout with course -->
                            <div class="container__element-right">
                                <h4>Your Order</h4>
                                <div class="element__right-table">
                                    <table>
                                        <thead>
                                            <tr class="table-title">
                                                <th class="title-content">${course.title}</th>
                                                <th class="title-price">$${course.price}</th>
                                            </tr>
                                            <tr class="table-title">
                                                <th class="title-content">Membership card</th>
                                                    <c:if test="${discount.discount == null}">
                                                    <th class="title-price" >Voucher 0%</th>
                                                    </c:if>
                                                    <c:if test="${discount.discount != null}">
                                                    <th class="title-price" >Voucher ${discount.discount}%</th>
                                                <tr class="table-title">
                                                    <th class="title-content discript">${discount.description}</th>
                                                </tr>
                                            </c:if>
                                        <input type="hidden" id="discount" name="discountTotal" value="${discount.discount}">
                                        </tr>

                                        <tr class="table-title">
                                            <th class="title-content">Course start date</th>
                                            <th class="title-price" >${startDate}</th>
                                        </tr>
                                        <tr class="table-title">
                                            <th class="title-content">Course end date</th>
                                            <th class="title-price" >${dateEnd}</th>
                                        </tr>
                                        <tbody>
                                            <tr class="table-detail">
                                                <td class="detail-content">Subtotal</td>

                                                <td class="detail-price">$<fmt:formatNumber value="${course.price - (course.price * (discount.discount) / 100)}" pattern="##.##"></fmt:formatNumber> </td>
                                        <input type="hidden" id="subtotal" name="subtotal" value="${course.price - (course.price * (discount.discount) / 100)}">
                                        </tr>
                                        <tr class="table-total">
                                            <td class="total-title">Total</td>
                                            <td class="total-price">$<fmt:formatNumber value="${course.price - (course.price * (discount.discount) / 100)}" pattern="##.##"></fmt:formatNumber></td>
                                        <input type="hidden" id="total" name="total" value="${course.price - (course.price * (discount.discount) / 100)}">
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${member != null}">
                            <input name="memPrice" id="memPrice" value="${member.price}" type="hidden">
                            <!-- form-checkout with membership -->
                            <div class="container__element-right">
                                <h4>Your Order</h4>
                                <div class="element__right-table">
                                    <table>
                                        <thead>
                                            <tr class="table-title">
                                                <th class="title-content">Yowu Member level: ${member.name}</th>
                                                <th class="title-price">$${member.price}</th>
                                            </tr>
                                            </tr>

                                            <tr class="table-title">
                                                <th class="title-content">Start date</th>
                                                <th class="title-price" >${startdate} </th>
                                            </tr>

                                            <tr class="table-title">
                                                <th class="title-content">End date</th>
                                                <th class="title-price" >${enddate}</th>
                                            </tr>
                                        <input type="hidden" value="${enddate}" name="endDate" id="endDate">
                                        <input type="hidden" value="${startdate}" name="startDate" id="startDate">
                                        <tr class="table-title">
                                            <th class="title-price" style="color: #a2a2a2">${member.description}</th>
                                        </tr>
                                        <tbody>
                                            <tr class="table-detail">
                                                <td class="detail-content">Subtotal</td>
                                                <td class="detail-price">$${member.price}</td>
                                        <input type="hidden" id="subtotal" name="subtotal" value="${member.price}">
                                        </tr>
                                        <tr class="table-total">
                                            <td class="total-title">Total</td>
                                            <td class="total-price">$${member.price}</td>
                                        <input type="hidden" id="total" name="total" value="${member.price}">
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>

                    </form>
                </div>
            </div>

        </div>
    </div>
    <jsp:include page="../Component/footer.jsp"></jsp:include>
    <script>
        const params = new URLSearchParams(window.location.search);
        console.log(params);
        var id = params.get('id');
        var scheduleId = params.get('course_scheduleId');
        var duration = params.get('duration');
        var startTime = params.get('start_time');

        var coursePrice = params.get('coursePrice');
        var memId = params.get('memId');
        var durationMem = params.get('durationMem');
        var memPrice = params.get('memPrice');
        
        console.log(id);
        console.log(coursePrice);
        console.log(memPrice);

        document.getElementById('course_id').value = id;
        document.getElementById('course_scheduleId').value = scheduleId;
        document.getElementById('duration').value = duration;
        document.getElementById('startTime').value = startTime;

        document.getElementById('memId').value = memId;
        document.getElementById('durationMem').value = durationMem;

    <c:if test="coursePrice != 0 || memPrice != 0">
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy ra các radio button
                var paymentMethods = document.getElementsByName("payment-method");

                // Gắn sự kiện cho nút "Place Order"
                var placeOrderButton = document.querySelector('button[name="btnPlaceOrder"]');
                placeOrderButton.addEventListener("click", function (event) {
                    // Kiểm tra nếu không có radio button được chọn
                    var isSelected = false;
                    for (var i = 0; i < paymentMethods.length; i++) {
                        if (paymentMethods[i].checked) {
                            isSelected = true;
                            break;
                        }
                    }

                    // Nếu không có radio button nào được chọn, hiển thị thông báo
                    if (!isSelected) {
                        event.preventDefault(); // Ngăn chặn gửi biểu mẫu


                        var alertDiv = document.createElement("div");
                        alertDiv.classList.add("alert", "alert-danger", "custom-alert");
                        alertDiv.innerHTML = "Please choose a payment method!!!";


                        var countdownSpan = document.createElement("span");
                        countdownSpan.id = "countdownSpan";
                        countdownSpan.style.marginLeft = "10px";
                        countdownSpan.style.color = "red";
                        countdownSpan.innerText = "5"; // Số giây đếm ngược ban đầu


                        alertDiv.appendChild(countdownSpan);



                        var checkoutButton = document.querySelector(".element__checkout-button");
                        checkoutButton.parentNode.insertBefore(alertDiv, checkoutButton);


                        var countdownValue = 5;
                        var countdownInterval = setInterval(function () {
                            countdownValue--;
                            countdownSpan.innerText = countdownValue.toString();

                            if (countdownValue === 0) {
                                alertDiv.remove(); // Xóa thông báo
                                clearInterval(countdownInterval); // Dừng đếm ngược
                            }
                        }, 1000);
                    }
                });
            });
        }

</c:if>

    </script>

</body>

