/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.controller.client;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import com.yowu.yogacenter.repository.CourseWishlistRepository;
import com.yowu.yogacenter.repository.RatingCourseRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import jakarta.mail.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author ACER
 */
public class CourseDetailController extends HttpServlet {
    
    private final String COURSE_DETAIL_PAGE = "Client/courseDetail.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CourseRepository cr = new CourseRepository();
            CourseScheduleRepository sc = new CourseScheduleRepository();
            RatingCourseRepository ratec = new RatingCourseRepository();
            CourseWishlistRepository cwr = new CourseWishlistRepository();
            Course c = cr.detail(id);
            Account account = (Account) request.getSession().getAttribute("account");
            RegistrationCourseRepository rcr = new RegistrationCourseRepository();
            boolean isInWishList = false;
            RegistrationCourse rc2 = null;
            Bill billStatus = null;
            BillRepository billRepo = new BillRepository();
            boolean allowBook = true;
            if (account != null) {
                isInWishList = cwr.isExist(id, account.getId());
                billStatus = billRepo.getBillRecentByAccountIdAndCourseID(account.getId(), id);
                if (billStatus != null) {
                    RegistrationCourse regisStatus = rcr.getRecentRegisByCourseIdAndAccountID(account.getId(), id);
                    if (regisStatus != null) {
                        if (regisStatus.getCourseStatus() != RegistrationCourse.CourseStatus.FINISH.ordinal()) {
                            Date dateNow = new Date();
                            
                            Date dateEnd = regisStatus.getEndDate();
                            if (!dateNow.before(dateEnd)) {
                                regisStatus.setCourseStatus(RegistrationCourse.CourseStatus.FINISH.ordinal());
                                rcr.update(regisStatus);
                                
                            }
                        }
                    }
                    allowBook = regisStatus.getCourseStatus() == RegistrationCourse.CourseStatus.FINISH.ordinal();
                    
                }
            }
            if (billStatus != null) {
                int status = billStatus.getStatus();
                request.setAttribute("billStatus", status);
            }
            request.setAttribute("allowBook", allowBook);
            System.out.println(request.getContextPath() + "/course-detail?id=" + id);
            request.setAttribute("regisID", rc2);
            request.setAttribute("agvRating", ratec.getAvgCourseRating(c.getId()));
            request.setAttribute("course", c);
            request.setAttribute("courseScheduleList", sc.getScheduleByCourse(c.getId()));
            request.setAttribute("surgestCourseList", cr.getRandomNCourses(4));
            request.setAttribute("isInWishList", isInWishList);
            request.setAttribute("feedbackList", ratec.getByCourseID(id));
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher(COURSE_DETAIL_PAGE).forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int courseId = Integer.parseInt(request.getParameter("courseid"));
            Account account = (Account) request.getSession().getAttribute("account");
            if (account == null) {
                out.print("account-failed");
            } else {
                CourseWishlistRepository cwr = new CourseWishlistRepository();
                switch (action) {
                    case "remove": {
                        cwr.detele(courseId, account.getId());
                        break;
                    }
                    case "add": {
                        
                        cwr.add(courseId, account.getId());
                        break;
                    }
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
