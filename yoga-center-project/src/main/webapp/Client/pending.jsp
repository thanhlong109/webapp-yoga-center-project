<%-- 
    Document   : pending
    Created on : Jun 27, 2023, 10:46:39 PM
    Author     : Chien Thang
--%>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Payment | YowuYoga</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Signika Negative' rel='stylesheet'>

        <!-- boostrap -->
        <link rel="stylesheet" href="Asset/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
        <link rel="stylesheet" href="Asset/css/common.css">
        <link rel="stylesheet" href="Asset/css/stylepayment-success.css">
    </head>

    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>


            <div class="outline">
                <div class="container payment-body">
                    <div class="row payment-container">
                        <div class="col-md-12 pay-header">
                            <h5>PAYMENT INFORMATION</h5>
                        </div>

                        <div class="col-md-12 pay-img">
                            <img src="Asset/img/checkout/icons8-pending-100.png" alt="" width="100px">
                            <h4>Payment Pending</h4>
                        </div>
                        <div class="col-md-12 payment-in4">
                        <table>
                            <tbody>
                                <tr>
                                    <th>Customer:</th>
                                    <td>${sessionScope.account.name}</td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${sessionScope.account.email}</td>
                                </tr>
                                <tr>
                                    <th>Payment method:</td>
                                        <td>${bill.paymentMethod}</td>                                  
                                </tr>
                                <tr>
                                    <th>Order code:</th>
                                    <td>${bill.orderCode}</td>
                                </tr>
                                <tr>
                                    <th>Amount paid:</th>
                                    <td class="amout">$${bill.value}</td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 break">
                        <div class="line"></div>
                        <span>Details</span>
                        <div class="line"></div>
                    </div>
                    <div class="col-md-12 payment-details">
                        <table>
                            <tbody>
                                <c:if test="${bill.getClass().getName() eq 'com.yowu.yogacenter.model.Bill'}">
                                    <tr>
                                        <th>Payment product:</th>
                                        <td>${bill.course.title}</td>
                                    </tr>
                                        <th>Payment date:</td>
                                        <td>${bill.date}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${bill.getClass().getName() eq 'com.yowu.yogacenter.model.BillMembership'}">
                                    <tr>
                                        <th>Payment product:</th>
                                        <td>Yowu Member level: ${bill.membership.name}</td>
                                    </tr>
                                        <th>Payment date:</td>
                                        <td>${bill.date}</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <div class="thanks">
                            <p>Please pay within 48 hours ...</p>
                            <p>Thank you for choosing us.</p>
                            <p>See you again!</p>
                        </div>
                        <div class="payment-footer">
                            <div>Go to Home page after <span id="counter">30</span>s</div>
                            <p>Powered by <a href="https://vnpay.vn/">VNPAY</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% 
            session.removeAttribute("billCourse");
            session.removeAttribute("billCourseC");
            session.removeAttribute("PAYMENT");
            session.removeAttribute("RegistrationMembership");
            session.removeAttribute("bill");
        %>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
            <script>
                setInterval(function () {
                    var div = document.querySelector("#counter");
                    var count = div.textContent * 1 - 1;
                    div.textContent = count;
                    if (count <= 0) {
                        window.location.replace("${pageContext.request.contextPath}/");
                    }
                }, 1000);
        </script>
    </body>

</html>