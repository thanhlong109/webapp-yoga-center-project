/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.checkout;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;

/**
 *
 * @author Chien Thang
 */
public class CheckoutResultController extends HttpServlet {

    private final String FAIL_CHECKOUT = "Client/failcheckout.jsp";
    private final String SUCCESS_CHECKOUT = "Client/successcheckout.jsp";
    private final String SUCCESS_MEMBERSHIP = "Client/successmembership.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL_CHECKOUT;
        try {
            long vnp_Amount = Integer.parseInt(request.getParameter("vnp_Amount"));
            String vnp_BankCode = request.getParameter("vnp_BankCode");
            String vnp_BankTranNo = request.getParameter("vnp_BankTranNo");
            String vnp_CardType = request.getParameter("vnp_CardType");
            String vnp_PayDate = request.getParameter("vnp_PayDate");
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
            String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            PaymentDTO payment = new PaymentDTO(vnp_Amount, vnp_BankCode, vnp_BankTranNo, vnp_CardType, vnp_PayDate, vnp_OrderInfo, vnp_TransactionNo, vnp_ResponseCode, vnp_TxnRef);
            HttpSession session = request.getSession();
            String orderCode = vnp_TxnRef; // Lấy orderCode từ vnp_OrderInfo hoặc từ đâu đó khác
            session.setAttribute("orderCode", orderCode);
//http://localhost:8080/yoga-center-project/CheckoutSendController?id=3&course_scheduleId=5&order__comment=&payment-method=studio&btnPlaceOrder=&discountTotal=&subtotal=54.0&total=54.0

            Account acc = (Account) request.getSession().getAttribute("account");
            String accountID = Integer.toString(acc.getId());
            System.out.println(accountID);
            BillRepository bill = new BillRepository();
            BillMembershipRepository billMem = new BillMembershipRepository();
            RegistrationCourseRepository regis = new RegistrationCourseRepository();
            RegistrationMembership regisMember = (RegistrationMembership) request.getSession().getAttribute("RegistrationMembership");
            RegistrationMembershipRepository memRepo = new RegistrationMembershipRepository();
            
            if (vnp_ResponseCode.equals("00")) {
                if (regisMember != null) {
                    boolean checkMem = billMem.updateStatus(orderCode, vnp_PayDate, 0);
                    BillMembership billMember = billMem.getMembershipIdByOrdercode(orderCode);
                    boolean updateRegisMem = memRepo.updateStatusMem(true, accountID, billMember.getMembership().getId());
                    if (checkMem) {
                        request.setAttribute("billMem", billMember);
                        request.setAttribute("PAYMENT", payment);
                        url = SUCCESS_MEMBERSHIP;
                    }
                } else {
                    boolean check = bill.updateStatus(vnp_TxnRef, vnp_PayDate, 0);
                    Bill billR = bill.getCourseIdByOrdercode(vnp_TxnRef);
                    System.out.println(billR.getCourse().getId());
                    boolean updateRegis = regis.updateStatus(true, accountID, billR.getCourse().getId());
                    System.out.println(updateRegis);
                    Bill billL = bill.getAllByAccountIdAndCourseID(accountID, billR.getCourse().getId());
                    System.out.println(billL);
                    if (check) {
                        session.setAttribute("billCourseC", billL);
                        request.setAttribute("PAYMENT", payment);
                        url = SUCCESS_CHECKOUT;
                    }
                }

            } else if (vnp_ResponseCode.equals("24")) {

                boolean check = bill.updateStatus(vnp_TxnRef, "", 1);
                if (check) {
                    request.setAttribute("PAYMENT", payment);
                    url = FAIL_CHECKOUT;
                }
            }
            System.out.println(vnp_PayDate);

        } catch (NumberFormatException | ParseException e) {
            log("Error at PaymentResultController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
