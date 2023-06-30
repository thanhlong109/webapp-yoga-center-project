<%-- 
    Document   : successcheckout
    Created on : Jun 27, 2023, 9:53:28 PM
    Author     : Chien Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Payment | YowuYoga</title>
        <!-- Google font -->
        <!-- <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> -->
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
                        <img src="Asset/img/checkout/success-icon.png" alt="" width="100px">
                        <h4>Payment success</h4>
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
                                    <th>Order code:</th>
                                    <td>${sessionScope.orderCode}</td>
                                </tr>
                                <tr>
                                    <th>Amount paid:</th>
                                    <td class="amout">3.000.000 VND</td>
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
                                    <th>Billing content:</td>
                                    <td>Order payment: 685787</td>
                                </tr>
                                <tr>
                                    <th>Bank code:</td>
                                    <td>NCB</td>
                                </tr>
                                <tr>
                                    <th>Payment type:</td>
                                    <td>VISA</td>
                                </tr>
                                <tr>
                                    <th>Payment date:</td>
                                    <td>25/06/2023 21:25</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="thanks">
                            <p>Thank you for choosing us.</p>
                            <p>See you again!</p>
                        </div>
                        <div class="payment-footer">
                            <p><a href="${pageContext.request.contextPath}/">Back to home page</a></p>
                            <p>Powered by <a href="#">VNPAY</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>

</html>