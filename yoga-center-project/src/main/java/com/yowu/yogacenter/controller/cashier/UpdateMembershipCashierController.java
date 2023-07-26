/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.cashier;

import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
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
public class UpdateMembershipCashierController extends HttpServlet {

    private final String EDIT_MEMBERSHIP_PAGE = "../Cashier/UpdateMembership.jsp";
    private final String VIEW_MEMBERSHIP_CONTROLLER = "viewMembershipCashierController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        BillMembershipRepository _billMembershipRepository = new BillMembershipRepository();
        BillMembership billMembershipCashier = _billMembershipRepository.detail(id);
        request.setAttribute("MEMBERSHIP", billMembershipCashier);
        request.setAttribute("StatusList", BillMembership.BillMemBerStatus.values());
        request.getRequestDispatcher(EDIT_MEMBERSHIP_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BillMembershipRepository _billMembershipRepository = new BillMembershipRepository();
        BillMembership billMembership = new BillMembership();
        RegistrationMembershipRepository _regisMembershipRepo = new RegistrationMembershipRepository();
        String orderCode = request.getParameter("txtOrderCode");
        int status = Integer.parseInt(request.getParameter("txtStatus"));
        
        try {
            boolean update = _billMembershipRepository.updateStatus(orderCode, LocalDate.now(), status);
            if(update){
                billMembership = _billMembershipRepository.getMembershipIdByOrdercode(orderCode);
                if (status == BillMembership.BillMemBerStatus.COMPLETED.ordinal()) {
                    RegistrationMembership regisMembership = _regisMembershipRepo.getRecenRegisByMembershipIdAndAccountId(billMembership.getMembership().getId(), billMembership.getAccount().getId());
                    System.out.println(billMembership.getMembership().getId());
                    System.out.println(billMembership.getAccount().getId());
                   _regisMembershipRepo.updateStatusMemById(true, regisMembership.getMembership().getId());
                }
                if (status == BillMembership.BillMemBerStatus.CANCELLED.ordinal() || status == BillMembership.BillMemBerStatus.PENDING.ordinal()) {
                    RegistrationMembership regisMembership = _regisMembershipRepo.getRecenRegisByMembershipIdAndAccountId(billMembership.getMembership().getId(), billMembership.getAccount().getId());
                    
                   _regisMembershipRepo.updateStatusMemById(false, regisMembership.getMembership().getId());
                }
                response.sendRedirect(VIEW_MEMBERSHIP_CONTROLLER);
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
