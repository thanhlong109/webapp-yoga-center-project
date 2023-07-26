/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.cashier;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author localboss
 */
public class UpdateBillCashierController extends HttpServlet {
     private final String EDIT_BILL_PAGE = "../Cashier/UpdateBill.jsp";
    private final String VIEW_BILL_CONTROLLER = "viewBillCashierController";
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        BillRepository _billRepository = new BillRepository();
        Bill billCashier = _billRepository.detail(id);
        request.setAttribute("StatusList", Bill.BillStatus.values());
        request.setAttribute("BILL", billCashier);
        request.getRequestDispatcher(EDIT_BILL_PAGE).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillRepository _billRepository = new BillRepository();
        Bill bill = new Bill();
        RegistrationCourseRepository _regisCourseRepository = new RegistrationCourseRepository();
        int status = Integer.parseInt(request.getParameter("txtStatus"));
        String orderCode = request.getParameter("txtOrderCode");
        System.out.println(orderCode);
          try {

            boolean update = _billRepository.updateStatus(orderCode, LocalDate.now(), status);
              System.out.println(orderCode + ", " + status);
            System.out.println(update);
            if (update) {
                bill = _billRepository.getCourseIdByOrdercode(orderCode);
                
//                bill = _billRepository.getCourseIdByOrdercode(orderCode);
                if (status == Bill.BillStatus.COMPLETED.ordinal()) {
                    RegistrationCourse regisCourse = _regisCourseRepository.getRecentRegisByCourseIdAndAccountID(bill.getAccount().getId(), bill.getCourse().getId());
                    
                    _regisCourseRepository.updateStatusById(true, regisCourse.getId());
                }
                if (status == Bill.BillStatus.CANCELLED.ordinal() || status == Bill.BillStatus.PENDING.ordinal()) {
                    RegistrationCourse regisCourse = _regisCourseRepository.getRecentRegisByCourseIdAndAccountID(bill.getAccount().getId(), bill.getCourse().getId());
                    
                    _regisCourseRepository.updateStatusById(false, regisCourse.getId());
                }
                response.sendRedirect(VIEW_BILL_CONTROLLER);

            }
        } catch (ParseException ex) {
            Logger.getLogger(UpdateBillCashierController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
