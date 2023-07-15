<%-- 
    Document   : failcheckout
    Created on : Jun 27, 2023, 9:53:10 PM
    Author     : Chien Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
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
                            <img src="Asset/img/checkout/failure-icon.png" alt="" width="100px">
                            <h4>Payment failure</h4>
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
                                        <c:if test="${sessionScope.billCourseC != null}">
                                            <td>${sessionScope.billCourseC.method}</td>
                                        </c:if>
                                </tr>
                                <tr>
                                    <th>Order code:</th>
                                    <td>${PAYMENT.vnp_TxnRef}</td>
                                </tr>
                                <tr>
                                    <th>Amount paid:</th>
                                    <td class="amout">$${sessionScope.billCourseC.value}</td>
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
                                <tr>
                                    <th>Payment product:</th>
                                    <c:if test="${sessionScope.billCourseC.course != null}">
                                        <td>${sessionScope.billCourseC.course.title}</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th>Bank code:</td>
                                    <td>${PAYMENT.vnp_BankCode}</td>
                                </tr>
                                <tr>
                                    <th>Payment type:</td>
                                    <td>${PAYMENT.vnp_CardType}</td>
                                </tr>
                                <tr>
                                    <th>Payment date:</td>
                                    <td>${sessionScope.billCourseC.paymentDate}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="thanks">
                            <p>Thank you for choosing us.</p>
                            <p>See you again!</p>
                        </div>
                        <div class="payment-footer">
                            <div>Go to Home page after <span id="counter">30</span>s</div>
                            <p>Powered by <a href="#">VNPAY</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% 
            session.removeAttribute("billCourse");
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