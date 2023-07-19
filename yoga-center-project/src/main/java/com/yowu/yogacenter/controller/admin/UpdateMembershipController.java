/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.admin;

import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.MembershipError;
import com.yowu.yogacenter.repository.MembershipRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DungVNT
 */
public class UpdateMembershipController extends HttpServlet {

    private final String EDIT_PAGE = "../Admin/EditMembership.jsp";
    private final String VIEW_MEMBERSHIP_LIST_CONTROLLER = "viewMembershipListController";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MembershipRepository _membershipRepository = new MembershipRepository();
        Membership m = _membershipRepository.detail(id);

        request.setAttribute("MEMBERSHIP", m);
        request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MembershipRepository _membershipRepository = new MembershipRepository();
        Membership m = new Membership();
        MembershipError membershipError = new MembershipError();
        boolean result = false;
        
        try {
            boolean checkValidation = true;
            int id = Integer.parseInt(request.getParameter("txtId"));
            String name = request.getParameter("txtName");
            String duration = request.getParameter("txtDuration");
            String price = request.getParameter("txtPrice");
            String description = request.getParameter("txtDescription");
            String discount = request.getParameter("txtDiscount");

            if (name.length() < 5 || name.length() > 50) {
                membershipError.setMembershipNameDuplicateError("Name must have 5 to 50 characters!!!");
                checkValidation = false;
            }
            if (_membershipRepository.checkDuplicateUpdate(name)) {
                membershipError.setMembershipNameDuplicateError("Name already exsited!!!");
                checkValidation = false;
            }
            if (!duration.matches("[0-9]+")) {
                membershipError.setMembershipDurationError("Duration only contains numbers!!!");
                checkValidation = false;
            }
            if (!price.matches("[0-9]+")) {
                membershipError.setMembershipPriceError("Price only contains numbers!!!");
                checkValidation = false;
            }
            if (description.length() < 10 || description.length() > 255) {
                membershipError.setMembershipDescriptionError("Description must have 10 to 255 characters!!!");
                checkValidation = false;
            }
            if (!discount.matches("[0-9]+")) {
                membershipError.setMembershipDiscountError("Discount only contains numbers!!!");
                checkValidation = false;
            }

            if (checkValidation) {
                m.setId(id);
                m.setName(name);
                m.setDuration(Integer.parseInt(duration));
                m.setPrice(Float.parseFloat(price));
                m.setDescription(description);
                m.setDiscount(Integer.parseInt(discount));
                m.setIsActive(true);

                result = _membershipRepository.update(m);
                if (!result) {
                    membershipError.setError("Unknown error!!!");
                    m = _membershipRepository.detail(id);
                    request.setAttribute("MEMBERSHIP", m);
                    request.setAttribute("UPDATE_MEMBERSHIP_ERROR", membershipError);
                }
            } else {
                m = _membershipRepository.detail(id);
                request.setAttribute("MEMBERSHIP", m);
                request.setAttribute("UPDATE_MEMBERSHIP_ERROR", membershipError);
            }

        } catch (Exception e) {
            log("Error at UpdateMembershipController: " + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(VIEW_MEMBERSHIP_LIST_CONTROLLER);
            } else {
                request.getRequestDispatcher(EDIT_PAGE).forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
