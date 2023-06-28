/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.checkout;

import com.yowu.yogacenter.repository.BillRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Chien Thang
 */
public class CheckoutResultController extends HttpServlet {

    private final String FAIL_CHECKOUT = "Client/failcheckout.jsp";
    private final String SUCCESS_CHECKOUT = "Client/successcheckout.jsp";

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
            BillRepository bill = new BillRepository();

            if (vnp_ResponseCode.equals("00")) {
                boolean check = bill.updateStatus(vnp_TxnRef, vnp_PayDate, 0);
                if (check) {
                    request.setAttribute("PAYMENT", payment);
                    url = SUCCESS_CHECKOUT;
                }
            }else if(vnp_ResponseCode.equals("24")){
                boolean check = bill.updateStatus(vnp_TxnRef, "", 1);
                if (check) {
                    request.setAttribute("PAYMENT", payment);
                    url = FAIL_CHECKOUT;
                }
            }
            System.out.println(vnp_PayDate);

        } catch (Exception e) {
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
