<%-- 
    Document   : checkout
    Created on : Jun 24, 2023, 3:08:00 PM
    Author     : Chien Thang
--%>

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
                                        <span class="checkout-method">VnPay</span>
                                    </li>
                                    <li class="element__checkout-method-offline__payment">
                                        <input type="radio" name="payment-method" value="STUDIO">
                                        <img src="Asset/img/checkout/pngwing.com.png" alt="">
                                        <span class="checkout-method">Studio</span>
                                    </li>
                                </ul>
                                
                                <input id="duration" name="duration" value="" type="hidden">
                                <input id="startTime" name="startTime" value="" type="hidden">
                                
                                <div class="element__checkout-button">
                                    <button type="submit" name="btnPlaceOrder">Place Order</button>
                                </div>
                            </div>
                            <p class="checkout__element-condition">

                                By completing your purchase you agree to those
                                <a href="">Term Conditions</a>
                            </p>
                        </div>
                        <!-- form-right -->
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
                                            <th class="title-price" >Voucher ${discount.discount}%</th>
                                    <input type="hidden" id="discount" name="discountTotal" value="${discount.discount}">
                                        </tr>
                                        <tr class="table-title">
                                            <th class="title-content">${discount.description}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="table-detail">
                                            <td class="detail-content">Subtotal</td>
                                    
                                            <td class="detail-price">$${course.price - (course.price * (discount.discount) / 100)}</td>
                                    <input type="hidden" id="subtotal" name="subtotal" value="${course.price - (course.price * (discount.discount) / 100)}">
                                    </tr>
                                    <tr class="table-total">
                                        <td class="total-title">Total</td>
                                        <td class="total-price">$${course.price - (course.price * (discount.discount) / 100)}</td>
                                    <input type="hidden" id="total" name="total" value="${course.price - (course.price * (discount.discount) / 100)}">
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
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
        
        console.log(id);
        console.log(scheduleId);
        
        
        document.getElementById('course_id').value = id;
        document.getElementById('course_scheduleId').value = scheduleId;
        document.getElementById('duration').value = duration;
        document.getElementById('startTime').value = startTime;
    </script>

</body>

